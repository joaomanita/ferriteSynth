open Mini_ast
open Printf
open Choice
open Stdlib

let fresh_channel_id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    "chan_" ^ string_of_int !unique

let fresh_val_id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    "val_" ^ string_of_int !unique

let fresh_binder_id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    "binder_" ^ string_of_int !unique

type id = string

let fn_ctxt = ref []
let type_ctxt = ref []
let append_type_ctxt name t = type_ctxt := (name, t) :: !type_ctxt

let rec lookup_type name ctxt =
  match ctxt with
  | [] -> None
  | (n, t) :: xs -> if n = name then Some t else lookup_type name xs

let rec resolve_type t =
  match t with
  | TyPrimitive s -> (
      match lookup_type s !type_ctxt with Some real_t -> real_t | None -> t)
  | TyAtomic _ -> t
  | TyInternalChoice l ->
      TyInternalChoice
        (List.map (fun (label, ty) -> (label, resolve_type ty)) l)
  | TyExternalChoice l ->
      TyExternalChoice
        (List.map (fun (label, ty) -> (label, resolve_type ty)) l)
  | TySendChannel (t1, t2) -> TySendChannel (resolve_type t1, resolve_type t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (resolve_type t1, resolve_type t2)
  | TySendValue (t1, t2) -> TySendValue (t1, resolve_type t2)
  | TyReceiveValue (t1, t2) -> TyReceiveValue (t1, resolve_type t2)
  | TyEnd -> t
  | TySharedToLinear t -> TySharedToLinear (resolve_type t)
  | TyLinearToShared t -> TyLinearToShared (resolve_type t)
  | TySession t -> TySession (resolve_type t)
  | TyFunc ((_, _), _) -> t
  | TyApp (tyFunc, tyArgs) ->
      TyApp
        ( resolve_type tyFunc,
          (List.map (fun tyArg -> resolve_type tyArg)) tyArgs )
  | TyRec t -> TyRec (resolve_type t)
  | TyZ _ -> t

exception Fail

(* For context see Table 2 of https://web.tecnico.ulisboa.pt/bernardo.toninho/papers/ecoop22-ferrite.pdf*)
type tm =
  | Var of id
  | Offer of label * tm
  | Case of id * (label * tm) list
  | OfferChoice of (label * tm) list
  | Choose of id * (label * tm)
  | SendChannelFrom of id * tm
  | ReceiveChannelFrom of id * (id * tm)
  | ReceiveChannel of id * tm
  | SendChannelTo of (id * id) * tm
  | SendValue of tm * tm
  | SendValueTo of (id * tm) * tm
  | ReceiveValueFrom of (id * id) * tm
  | ReceiveValue of id * tm
  | Terminate
  | Wait of id * tm
  | Detach of tm
  | Release of id * tm
  | Accept of tm
  | Accquire of id * (id * tm)
  | Forward of id
  | Cut of side list * tm * (id * tm)
  | Func of (id * (id * ty) list) * (ty * tm)
  | App of tm * tm list
  | Fix of tm
  | Unfix of id * tm

and side = L | R

let rec print_labeled_choices l print_func =
  match l with
  | [] -> ""
  | (label, tx) :: [] -> label ^ ": " ^ print_func tx
  | (label, tx) :: xs ->
      label ^ ": " ^ print_func tx ^ ", " ^ print_labeled_choices xs print_func

let rec print_type t =
  match t with
  | TyPrimitive t -> t
  | TyAtomic a -> a
  | TyInternalChoice l ->
      "InternalChoice<" ^ print_labeled_choices l print_type ^ ">"
  | TyExternalChoice l ->
      "ExternalChoice<" ^ print_labeled_choices l print_type ^ ">"
  | TySendChannel (t1, t2) ->
      "SendChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveChannel (t1, t2) ->
      "ReceiveChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TySendValue (t1, t2) -> "SendValue<" ^ t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveValue (t1, t2) -> "ReceiveValue<" ^ t1 ^ ", " ^ print_type t2 ^ ">"
  | TyEnd -> "End"
  | TySharedToLinear t -> "SharedToLinear<" ^ print_type t ^ ">"
  | TyLinearToShared t -> "LinearToShared<" ^ print_type t ^ ">"
  | TySession t -> "Session<" ^ print_type t ^ ">"
  | TyFunc ((name, tyArgs), tyRet) ->
      "FN<<" ^ name ^ ", "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"
  | TyApp (tyFunc, tyArgs) ->
      "App<" ^ print_type tyFunc ^ ", "
      ^ String.concat ", " (List.map print_type tyArgs)
      ^ ">"
  | TyRec t -> "Rec<" ^ print_type t ^ ">"
  | TyZ i -> print_peano i

and print_peano i =
  match i with 0 -> "Z" | x -> "S<" ^ print_peano (x - 1) ^ ">"

let rec print_ctxt ctxt =
  match ctxt with
  | [] -> ""
  | (id, t) :: xs -> sprintf "(%s, %s), %s" id (print_type t) (print_ctxt xs)

let print_side = function L -> "L" | R -> "R"

let rec print_exp e =
  match e with
  | Var a -> a
  | Offer (label, tm) -> sprintf "offer_case!(%s, %s)" label (print_exp tm)
  | Case (chan, choices) ->
      sprintf "case!{ %s ; %s }" chan (print_labeled_choices choices print_exp)
  | OfferChoice choices ->
      sprintf "offer_choice!{ %s }" (print_labeled_choices choices print_exp)
  | Choose (chan, (label, tm)) ->
      sprintf "choose!(%s, %s, %s)" chan label (print_exp tm)
  | SendChannelFrom (chan, tm) ->
      sprintf "send_channel_from(%s, %s)" chan (print_exp tm)
  | ReceiveChannelFrom (chan, (binder, tm)) ->
      sprintf "receive_channel_from(%s, |%s| {%s})" chan binder (print_exp tm)
  | ReceiveChannel (binder, tm) ->
      sprintf "receive_channel(|%s| {%s})" binder (print_exp tm)
  | SendChannelTo ((chan, chan_sent), tm) ->
      sprintf "send_channel_to(%s, %s, %s)" chan chan_sent (print_exp tm)
  | SendValue (v, tm) ->
      sprintf "send_value(%s, %s)" (print_exp v) (print_exp tm)
  | SendValueTo ((chan, v), tm) ->
      sprintf "send_value_to(%s, %s, %s)" chan (print_exp v) (print_exp tm)
  | ReceiveValueFrom ((chan, binder), tm) ->
      sprintf "receive_value_from(%s, move |%s| {%s})" chan binder
        (print_exp tm)
  | ReceiveValue (binder, tm) ->
      sprintf "receive_value(|%s| {%s})" binder (print_exp tm)
  | Terminate -> "terminate ()"
  | Wait (chan, tm) -> sprintf "wait(%s, %s)" chan (print_exp tm)
  | Detach tm -> sprintf "detach_shared_session(%s)" (print_exp tm)
  | Release (chan, tm) ->
      sprintf "release_shared_session(%s, %s)" chan (print_exp tm)
  | Accept tm -> sprintf "accept_shared_session(%s)" (print_exp tm)
  | Accquire (chan, (binder, tm)) ->
      sprintf "acquire_shared_session(%s, move |%s| {%s})" chan binder
        (print_exp tm)
  | Forward chan -> sprintf "forward(%s)" chan
  | Cut (cut_dirs, session_tm, (binder, tm)) ->
      sprintf "cut! { [%s]; %s; %s => {%s}}"
        (String.concat ", " (List.map print_side cut_dirs))
        (print_exp session_tm) binder (print_exp tm)
  | Func ((name, argList), (t, tm)) ->
      let args_str =
        argList
        |> List.map (fun (n, ty) -> n ^ ": " ^ print_type ty)
        |> String.concat ", "
      in
      sprintf "fn %s(%s) -> %s { %s }" name args_str (print_type t)
        (print_exp tm)
  | App (func_tm, arg_tmList) ->
      sprintf "%s(%s)" (print_exp func_tm)
        (arg_tmList |> List.map print_exp |> String.concat ", ")
  | Fix tm -> sprintf "fix_session(%s)" (print_exp tm)
  | Unfix (id, tm) -> sprintf "unfix_session(%s, %s)" id (print_exp tm)

(* Substitutes name x in expression e1 with expression e2 *)
(* let rec subst e1 x e2 =
  match e1 with
  | Var y -> if x = y then e2 else e1
  | Offer (label, tm) -> Offer (label, subst tm x e2)
  | Case (chan, choices) ->
      Case (chan, List.map (fun (label, tm) -> (label, subst tm x e2)) choices)
  | OfferChoice choices ->
      OfferChoice (List.map (fun (label, tm) -> (label, subst tm x e2)) choices)
  | Choose (chan, (label, tm)) -> Choose (chan, (label, subst tm x e2))
  | SendChannelFrom (chan, tm) -> SendChannelFrom (chan, subst tm x e2)
  | ReceiveChannelFrom (chan, (binder, tm)) ->
      if x <> binder then ReceiveChannelFrom (chan, (binder, subst tm x e2))
      else e1
  | ReceiveChannel (binder, tm) ->
      if x <> binder then ReceiveChannel (binder, subst tm x e2) else e1
  | SendChannelTo ((chan, chan_sent), tm) ->
      SendChannelTo ((chan, chan_sent), subst tm x e2)
  | SendValue (v, tm) -> SendValue (subst v x e2, subst tm x e2)
  | SendValueTo ((chan, v), tm) ->
      SendValueTo ((chan, subst v x e2), subst tm x e2)
  | ReceiveValueFrom ((chan, binder), tm) ->
      if x <> binder then ReceiveValueFrom ((chan, binder), subst tm x e2)
      else e1
  | ReceiveValue (binder, tm) ->
      if x <> binder then ReceiveValue (binder, subst tm x e2) else e1
  | Terminate -> Terminate
  | Wait (chan, tm) -> Wait (chan, subst tm x e2)
  | Detach tm -> Detach (subst tm x e2)
  | Release (chan, tm) -> Release (chan, subst tm x e2)
  | Accept tm -> Accept (subst tm x e2)
  | Accquire (chan, (binder, tm)) ->
      if x <> binder then Accquire (chan, (binder, subst tm x e2)) else e1
  | Forward chan -> if chan = x then e2 else e1
  | Cut (session_tm, (binder, tm)) ->
      if x <> binder then Cut (session_tm, (binder, subst tm x e2)) else e1
  | Func ((name, argList), (t, tm)) ->
      let binders = List.map fst argList in
      if List.mem x binders then e1
      else Func ((name, argList), (t, subst tm x e2))
  | App (func_tm, arg_tmList) ->
      App (subst func_tm x e2, List.map (fun tm -> subst tm x e2) arg_tmList)
*)

let rec shift d t =
  match t with
  | TyZ k -> TyZ (k + d)
  | TyRec t1 -> TyRec (shift d t1)
  | TyInternalChoice l ->
      TyInternalChoice (List.map (fun (lbl, t1) -> (lbl, shift d t1)) l)
  | TyExternalChoice l ->
      TyExternalChoice (List.map (fun (lbl, t1) -> (lbl, shift d t1)) l)
  | TySendChannel (t1, t2) -> TySendChannel (shift d t1, shift d t2)
  | TyReceiveChannel (t1, t2) -> TyReceiveChannel (shift d t1, shift d t2)
  | TySendValue (v, t1) -> TySendValue (v, shift d t1)
  | TyReceiveValue (v, t1) -> TyReceiveValue (v, shift d t1)
  | TySharedToLinear t1 -> TySharedToLinear (shift d t1)
  | TyLinearToShared t1 -> TyLinearToShared (shift d t1)
  | TySession t1 -> TySession (shift d t1)
  | _ -> t

let rec subst k replacement t =
  match t with
  | TyZ n -> if n = k then replacement else if n > k then TyZ (n - 1) else TyZ n
  | TyRec t1 -> TyRec (subst (k + 1) (shift 1 replacement) t1)
  | TyInternalChoice l ->
      TyInternalChoice
        (List.map (fun (lbl, t1) -> (lbl, subst k replacement t1)) l)
  | TyExternalChoice l ->
      TyExternalChoice
        (List.map (fun (lbl, t1) -> (lbl, subst k replacement t1)) l)
  | TySendChannel (t1, t2) ->
      TySendChannel (subst k replacement t1, subst k replacement t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (subst k replacement t1, subst k replacement t2)
  | TySendValue (v, t1) -> TySendValue (v, subst k replacement t1)
  | TyReceiveValue (v, t1) -> TyReceiveValue (v, subst k replacement t1)
  | TySharedToLinear t1 -> TySharedToLinear (subst k replacement t1)
  | TyLinearToShared t1 -> TyLinearToShared (subst k replacement t1)
  | TySession t1 -> TySession (subst k replacement t1)
  | _ -> t

let unfold t = match t with TyRec t1 -> subst 0 (TyRec t1) t1 | _ -> t

let rec synthesize t =
  let programs =
    inversionR !fn_ctxt [] [] (resolve_type t) [] [] 0 >>= fun (delta_out, e) ->
    if delta_out <> [] then Choice.fail else return (delta_out, e)
  in
  run_all programs

(* Apply all invertible/asynchronous rules to the goal t*)
and inversionR gamma delta_in omega t psi zeta ident =
  Printf.printf "%s< InversionR: %s\n" (String.make ident ' ') (print_type t);

  let tm =
    match t with
    | TyFunc ((name, argList), tRet) ->
        let resolved_argList =
          List.map (fun (id, t1) -> (id, resolve_type t1)) argList
        in
        fn_ctxt := (name, t) :: !fn_ctxt;
        let resolved_retType = resolve_type tRet in
        inversionR gamma delta_in resolved_argList resolved_retType psi zeta
          (ident + 1)
        >>= fun (delta_out, e) ->
        return (delta_out, Func ((name, argList), (tRet, e)))
    | TyApp (tyFunc, tyArgList) ->
        let rec synth_args delta args =
          match args with
          | [] -> return (delta, [])
          | t :: rest ->
              inversionR gamma delta omega t psi zeta (ident + 1)
              >>= fun (delta', arg_tm) ->
              synth_args delta' rest >>= fun (delta'', arg_tms) ->
              return (delta'', arg_tm :: arg_tms)
        in

        let resolved_tyArgList =
          List.map (fun tyArg -> resolve_type tyArg) tyArgList
        in
        synth_args delta_in resolved_tyArgList
        >>= fun (delta_after_args, arg_tm_list) ->
        let func_id, delta_out = searchAndRemove tyFunc delta_after_args in
        return (delta_out, App (Var func_id, arg_tm_list))
    | TyRec _ ->
        if List.mem t psi then
          let (name, tyArgs), tyRet = searchFuncType t !fn_ctxt in
          let tyArgsList = List.map snd tyArgs in

          inversionR gamma
            ((name, TyFunc ((name, tyArgs), tyRet)) :: delta_in)
            omega
            (TyApp (TyFunc ((name, tyArgs), tyRet), tyArgsList))
            psi zeta (ident + 1)
        else
          let unfolded_t = unfold t in
          inversionR gamma delta_in omega unfolded_t (t :: psi) zeta (ident + 1)
          >>= fun (delta_out, e) -> return (delta_out, Fix e)
    | TySession t ->
        inversionR gamma delta_in omega t psi zeta (ident + 1)
        >>= fun (delta_out, e) ->
        if delta_out <> [] then Choice.fail else return (delta_out, e)
    | TyReceiveChannel (tChan, tCont) ->
        let x = fresh_channel_id () in
        inversionR gamma delta_in ((x, tChan) :: omega) tCont psi zeta
          (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, ReceiveChannel (x, e1))
    | TyReceiveValue (tau, tCont) ->
        let x = fresh_val_id () in
        inversionR
          ((x, TyPrimitive tau) :: gamma)
          delta_in omega tCont psi zeta (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, ReceiveValue (x, e1))
    | TyExternalChoice l -> (
        let branches =
          List.map
            (fun (label, t) ->
              inversionR gamma delta_in omega t psi zeta (ident + 1)
              >>= fun res -> Choice.return (label, res))
            l
        in
        sequence branches >>= fun branches ->
        let out_ctxts =
          List.map (fun (_, (delta_out, _)) -> delta_out) branches
        in
        if not (all_equal out_ctxts) then Choice.fail
        else
          match out_ctxts with
          | [] -> Choice.fail
          | delta_out :: _ ->
              let choices =
                List.map (fun (label, (_, tm)) -> (label, tm)) branches
              in
              Choice.return (delta_out, OfferChoice choices))
    | _ -> inversionL gamma delta_in omega t psi zeta (ident + 1)
  in
  tm

and sequence lst =
  match lst with
  | [] -> Choice.return []
  | x :: xs ->
      x >>= fun v ->
      sequence xs >>= fun vs -> Choice.return (v :: vs)

and inversionL gamma delta_in omega t psi zeta ident =
  match omega with
  | [] ->
      Printf.printf "%s< InversionL: Empty\n" (String.make ident ' ');
      let tm = decideFocus gamma delta_in t psi zeta (ident + 1) in
      tm
  | (x, ty) :: xs ->
      Printf.printf "%s< InversionL: %s\n" (String.make ident ' ')
        (print_type ty);

      let tm =
        match ty with
        | TyPrimitive _ ->
            inversionL ((x, ty) :: gamma) delta_in xs t psi zeta (ident + 1)
        | TyFunc ((name, argList), tRet) ->
            if tRet <> t || resolve_type tRet <> t then Choice.fail
            else
              let resolved_argList =
                List.map
                  (fun (id, argType) -> (id, resolve_type argType))
                  argList
              in
              let rec sequence_inversion gamma delta = function
                | [] -> return (delta, [])
                | (_, t1) :: xs ->
                    inversionR gamma delta [] t1 psi zeta (ident + 1)
                    >>= fun (delta', e) ->
                    sequence_inversion gamma delta' xs
                    >>= fun (delta'', rest) -> return (delta'', e :: rest)
              in
              sequence_inversion gamma delta_in resolved_argList
              >>= fun (delta_out, tm_list) ->
              return (delta_out, App (Var name, tm_list))
        | TySendChannel (tyChan, tyCont) ->
            let binder = fresh_binder_id () in
            inversionL gamma delta_in
              ((x, tyCont) :: (binder, tyChan) :: xs)
              t psi zeta (ident + 1)
            >>= fun (delta_out, e1) ->
            return (delta_out, ReceiveChannelFrom (x, (binder, e1)))
        | TySendValue (tau, tyCont) ->
            let binder = fresh_binder_id () in
            inversionL
              ((binder, TyPrimitive tau) :: gamma)
              delta_in ((x, tyCont) :: xs) t psi zeta (ident + 1)
            >>= fun (delta_out, e1) ->
            return (delta_out, ReceiveValueFrom ((x, binder), e1))
        | TyInternalChoice l -> (
            let branches =
              List.map
                (fun (label, t1) ->
                  inversionL gamma delta_in ((x, t1) :: xs) t psi zeta
                    (ident + 1)
                  >>= fun res -> Choice.return (label, res))
                l
            in
            sequence branches >>= fun branches ->
            let out_ctxts =
              List.map (fun (_, (delta_out, _)) -> delta_out) branches
            in
            if not (all_equal out_ctxts) then Choice.fail
            else
              match out_ctxts with
              | [] -> Choice.fail
              | delta_out :: _ ->
                  return
                    ( delta_out,
                      Case
                        ( x,
                          List.map
                            (fun (label, (_, tm)) -> (label, tm))
                            branches ) ))
        | TyEnd ->
            inversionL gamma delta_in xs t psi zeta (ident + 1)
            >>= fun (delta_out, e1) -> return (delta_out, Wait (x, e1))
        | TySharedToLinear t1 ->
            let x1 = fresh_channel_id () in
            inversionL ((x1, t1) :: gamma) delta_in xs t psi zeta (ident + 1)
            >>= fun (delta_out, e1) -> return (delta_out, Release (x, e1))
        | TyLinearToShared _ ->
            inversionL ((x, ty) :: gamma) delta_in xs t psi zeta (ident + 1)
        | _ -> inversionL gamma ((x, ty) :: delta_in) xs t psi zeta (ident + 1)
      in
      tm

and all_equal ctxts =
  match ctxts with
  | [] -> true
  | ctxt1 :: xs -> List.for_all (fun ctxt2 -> ctxt2 = ctxt1) xs

and decideFocus gamma delta_in t psi zeta ident =
  mplus
    (focusR gamma delta_in t psi zeta ident)
    (mplus
       (focusL gamma delta_in t psi zeta ident)
       (focusGamma gamma delta_in t psi zeta ident))

and focusGamma gamma delta_in t psi zeta ident =
  let focus_options = of_list gamma in

  focus_options >>= fun (id, ty) ->
  Printf.printf "%s< focusGamma: %s\n" (String.make ident ' ') (print_type ty);
  let gamma' = removeWithId id ty gamma in

  let tm =
    match ty with
    | TyFunc ((_, argList), tRet) ->
        let resolved_tArgList =
          List.map (fun (_, t1) -> resolve_type t1) argList
        in

        inversionR gamma' ((id, ty) :: delta_in) []
          (TyApp (ty, resolved_tArgList))
          psi zeta (ident + 1)
        >>= fun (delta', cutL) ->
        let cut_dirs =
          List.map
            (fun (id, ty) ->
              if List.exists (fun (id', ty') -> id = id' && ty = ty') delta'
              then R
              else L)
            delta_in
        in

        let x1 = fresh_binder_id () in

        inversionL gamma' delta' [ (x1, tRet) ] t psi zeta (ident + 1)
        >>= fun (delta_out, cutR) ->
        return (delta_out, Cut (cut_dirs, cutL, (x1, cutR)))
    | _ ->
        focusL' gamma' delta_in id ty t psi zeta (ident + 1)
        >>= fun (delta_out, e) -> return (delta_out, e)
  in
  tm

and focusR gamma delta_in t psi zeta ident =
  Printf.printf "%s< FocusR: %s\n" (String.make ident ' ') (print_type t);

  let tm =
    match t with
    | TyInternalChoice l ->
        let choices = of_list l in

        choices >>= fun (label, t1) ->
        focusR gamma delta_in t1 psi zeta (ident + 1) >>= fun (delta_out, e) ->
        return (delta_out, Offer (label, e))
    | TySendChannel (t1, t2) -> (
        try
          let id, ctxt_out = searchAndRemove t1 delta_in in
          focusR gamma ctxt_out t2 psi zeta (ident + 1)
          >>= fun (delta_out, e1) -> return (delta_out, SendChannelFrom (id, e1))
        with Fail -> Choice.fail)
    | TySendValue (tau, t2) -> (
        try
          let id, ctxt_out = search (TyPrimitive tau) gamma in
          focusR ctxt_out delta_in t2 psi zeta (ident + 1)
          >>= fun (delta_out, e1) -> return (delta_out, SendValue (Var id, e1))
        with Fail -> Choice.fail)
    | TySharedToLinear t ->
        if delta_in <> [] then Choice.fail
        else
          focusR gamma delta_in t psi zeta (ident + 1)
          >>= fun (delta_out, e1) -> return (delta_out, Detach e1)
    | TyLinearToShared t ->
        if delta_in <> [] then Choice.fail
        else
          decideFocus gamma delta_in t psi zeta (ident + 1)
          >>= fun (delta_out, e1) -> return (delta_out, Accept e1)
    | TyEnd ->
        if delta_in <> [] then Choice.fail
        else (
          Printf.printf "%s success\n" (String.make ident ' ');
          return (delta_in, Terminate))
    | TyAtomic _ -> (
        try
          let id, ctxt_out = searchAndRemove t delta_in in
          Printf.printf "%s success\n" (String.make ident ' ');
          return (ctxt_out, Forward id)
        with Fail -> Choice.fail)
    | TyPrimitive _ -> (
        try
          let id, ctxt_out = searchAndRemove t delta_in in
          Printf.printf "%s success\n" (String.make ident ' ');
          return (ctxt_out, Var id)
        with Fail -> Choice.fail)
    | _ -> inversionR gamma delta_in [] t psi zeta (ident + 1)
  in
  tm

and searchAndRemove t = function
  | [] -> raise Fail
  | (id, t1) :: xs ->
      if t1 = t then (id, xs)
      else
        let id', rest = searchAndRemove t xs in
        (id', (id, t1) :: rest)

and search t = function
  | [] -> raise Fail
  | (id, t1) :: xs ->
      if t1 = t then (id, (id, t1) :: xs)
      else
        let id', rest = searchAndRemove t xs in
        (id', (id, t1) :: rest)

and removeWithId id t = function
  | [] -> raise Fail
  | (id1, t1) :: xs ->
      if t1 = t && id1 = id then xs
      else
        let rest = removeWithId id t xs in
        (id1, t1) :: rest

and searchFuncType t = function
  | [] -> raise Fail
  | (_, TyFunc ((func_id, argList), retType)) :: rest ->
      if retType = TySession t then ((func_id, argList), retType)
      else searchFuncType t rest
  | _ -> raise Fail

and searchZeta t = function
  | [] -> false
  | ((t1, _), _) :: rest -> if t1 = t then true else searchActiveZeta t rest

and searchActiveZeta t = function
  | [] -> false
  | ((t1, _), isActive) :: rest ->
      if t1 = t then isActive else searchActiveZeta t rest

and changeActiveZeta t acc = function
  | [] -> raise Fail
  | ((t1, timesUsed), isActive) :: rest ->
      if t1 = t then acc @ (((t1, timesUsed), not isActive) :: rest)
      else changeActiveZeta t acc rest

and searchTimesUsedZeta t = function
  | [] -> raise Fail
  | ((t1, timesUsed), _) :: rest ->
      if t1 = t then timesUsed else searchTimesUsedZeta t rest

and incTimesUsedZeta t acc = function
  | [] -> raise Fail
  | ((t1, timesUsed), isActive) :: rest ->
      if t1 = t then acc @ (((t1, timesUsed + 1), isActive) :: rest)
      else changeActiveZeta t acc rest

and focusL gamma delta_in t psi zeta ident =
  let focus_options = of_list delta_in in

  focus_options >>= fun (id, ty) ->
  let delta_in' = removeWithId id ty delta_in in
  focusL' gamma delta_in' id ty t psi zeta ident

and focusL' gamma delta_in id foc t psi zeta ident =
  Printf.printf "%s< focusL: %s\n" (String.make ident ' ') (print_type foc);

  let tm =
    match foc with
    | TyAtomic _ ->
        if foc = t && delta_in = [] then (
          Printf.printf "%s success\n" (String.make ident ' ');
          return (delta_in, Forward id))
        else Choice.fail
    | TyPrimitive _ ->
        if foc = t && delta_in <> [] then (
          Printf.printf "%s success\n" (String.make ident ' ');
          return (delta_in, Var id))
        else Choice.fail
    | TySession t1 ->
        let x1 = fresh_binder_id () in
        inversionR gamma delta_in [ (x1, t1) ] t psi zeta (ident + 1)
        >>= fun (delta_out, e) ->
        let cut_dirs = List.map (fun (_, _) -> R) delta_in in
        return (delta_out, Cut ([ L ] @ cut_dirs, Var id, (x1, e)))
    | TyRec _ ->
        let zeta =
          if searchZeta foc zeta then zeta else ((foc, 0), false) :: zeta
        in
        if searchActiveZeta foc zeta then Choice.fail
        else if searchTimesUsedZeta foc zeta >= 5 then Choice.fail
        else
          let unfolded_foc = unfold foc in
          let try_no_unfolding =
            focusL' gamma delta_in id unfolded_foc t psi
              (changeActiveZeta foc [] zeta)
              ident
          in
          if is_empty try_no_unfolding then
            focusL' gamma delta_in id unfolded_foc t psi
              (incTimesUsedZeta foc [] zeta)
              ident
            >>= fun (delta_out, e) -> return (delta_out, Unfix (id, e))
          else
            try_no_unfolding >>= fun (delta_out, e) ->
            return (delta_out, Unfix (id, e))
    | TyReceiveChannel (tChan, tCont) ->
        let possible_channels =
          List.filter (fun (_, ty) -> ty = tChan) delta_in
        in
        of_list possible_channels >>= fun (x, ty) ->
        inversionL gamma
          (removeWithId x ty delta_in)
          [ (id, tCont) ]
          t psi zeta (ident + 1)
        >>= fun (delta_out, e1) ->
        return (delta_out, SendChannelTo ((id, x), e1))
    | TyExternalChoice l ->
        let branches = of_list l in
        branches >>= fun (label, ty) ->
        inversionR gamma delta_in [ (id, ty) ] t psi zeta (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, Choose (id, (label, e1)))
    | TyReceiveValue (t1, t2) ->
        let possible_values =
          List.filter (fun (_, ty) -> ty = TyPrimitive t1) delta_in
        in
        of_list possible_values >>= fun (x, ty) ->
        focusL' gamma (removeWithId x ty delta_in) id t2 t psi zeta (ident + 1)
        >>= fun (delta_out, e1) ->
        return (delta_out, SendValueTo ((id, Var x), e1))
    | TyLinearToShared t1 ->
        let x1 = fresh_binder_id () in
        decideFocus gamma ((x1, t1) :: delta_in) t psi zeta (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, Accquire (id, (x1, e1)))
    | _ -> inversionL gamma delta_in [ (id, foc) ] t psi zeta (ident + 1)
  in
  tm
