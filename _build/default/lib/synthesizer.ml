open Mini_ast
open Printf
open Choice
open Stdlib

let debug_enabled = true
let debug_out = if debug_enabled then Some (open_out "debug.log") else None
let stopper = ref 0

let log fmt =
  match debug_out with
  | None -> Printf.printf fmt
  | Some ch -> Printf.fprintf ch fmt

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
  | TyFixShared -> t
  | TySession t -> TySession (resolve_type t)
  | TyFunc (((name, argList), tRet), funcs) ->
      TyFunc
        ( ( ( name,
              List.map
                (fun (argName, argType) -> (argName, resolve_type argType))
                argList ),
            resolve_type tRet ),
          funcs )
  | TyApp (func_name, tyArgs) ->
      TyApp (func_name, (List.map (fun tyArg -> resolve_type tyArg)) tyArgs)
  | TyRec t -> TyRec (resolve_type t)
  | TyZ _ -> t

let rec rev_resolve_type t =
  match rev_resolve_atomic t !type_ctxt with
  | Some name -> TyPrimitive name
  | None -> (
      match t with
      | TyInternalChoice l ->
          TyInternalChoice
            (List.map (fun (label, ty) -> (label, rev_resolve_type ty)) l)
      | TyExternalChoice l ->
          TyExternalChoice
            (List.map (fun (label, ty) -> (label, rev_resolve_type ty)) l)
      | TySendChannel (t1, t2) ->
          TySendChannel (rev_resolve_type t1, rev_resolve_type t2)
      | TyReceiveChannel (t1, t2) ->
          TyReceiveChannel (rev_resolve_type t1, rev_resolve_type t2)
      | TySendValue (v, t1) -> TySendValue (v, rev_resolve_type t1)
      | TyReceiveValue (v, t1) -> TyReceiveValue (v, rev_resolve_type t1)
      | TySharedToLinear t1 -> TySharedToLinear (rev_resolve_type t1)
      | TyLinearToShared t1 -> TyLinearToShared (rev_resolve_type t1)
      | TySession t1 -> TySession (rev_resolve_type t1)
      | TyApp (func_name, tyArgs) ->
          TyApp (func_name, List.map rev_resolve_type tyArgs)
      | TyRec t1 -> TyRec (rev_resolve_type t1)
      | _ -> t)

and rev_resolve_atomic t ctxt =
  match ctxt with
  | [] -> None
  | (name, ty) :: xs -> if ty = t then Some name else rev_resolve_atomic t xs

exception Fail

(* For context see Table 2 of https://web.tecnico.ulisboa.pt/bernardo.toninho/papers/ecoop22-ferrite.pdf*)
type tm =
  | RawText of string
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
  | Acquire of id * (id * tm)
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
  | TyFixShared -> "FixShared"
  | TySession t -> "Session<" ^ print_type t ^ ">"
  | TyFunc (((name, tyArgs), tyRet), _) ->
      "FN<<" ^ name ^ ", "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"
  | TyApp (func_name, tyArgs) ->
      "App<" ^ func_name ^ ", "
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

let print_fail func_name ident =
  log "%s< %s: fail\n" (String.make ident ' ') func_name

let print_func_entry func_name t ident =
  log "%s< %s: %s\n" (String.make ident ' ') func_name (print_type t)

let print_func_entry_withgoal func_name t ident goal =
  log "%s< %s: %s with goal %s \n" (String.make ident ' ') func_name
    (print_type t) (print_type goal)

let print_ctxts_with_ident gamma delta ident =
  log "%s< [%s] [%s]\n" (String.make ident ' ') (print_ctxt gamma)
    (print_ctxt delta)

let rec print_exp e =
  match e with
  | RawText s -> s
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
  | Acquire (chan, (binder, tm)) ->
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
  | App (func_name, arg_tmList) ->
      sprintf "%s(%s)" (print_exp func_name)
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
  | Acquire (chan, (binder, tm)) ->
      if x <> binder then Acquire (chan, (binder, subst tm x e2)) else e1
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
  | TyRec t1 -> TyRec (subst (k + 1) replacement t1)
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

let rec substShared replacement t =
  match t with
  | TyRec t1 -> TyRec (substShared replacement t1)
  | TyInternalChoice l ->
      TyInternalChoice
        (List.map (fun (lbl, t1) -> (lbl, substShared replacement t1)) l)
  | TyExternalChoice l ->
      TyExternalChoice
        (List.map (fun (lbl, t1) -> (lbl, substShared replacement t1)) l)
  | TySendChannel (t1, t2) ->
      TySendChannel (substShared replacement t1, substShared replacement t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (substShared replacement t1, substShared replacement t2)
  | TySendValue (v, t1) -> TySendValue (v, substShared replacement t1)
  | TyReceiveValue (v, t1) -> TyReceiveValue (v, substShared replacement t1)
  | TySharedToLinear t1 -> (
      match t1 with
      | TyFixShared -> TySharedToLinear replacement
      | _ -> TySharedToLinear t1)
  | TyLinearToShared t1 -> (
      match t1 with
      | TyFixShared -> TyLinearToShared replacement
      | _ -> TyLinearToShared t1)
  | TySession t1 -> TySession (substShared replacement t1)
  | _ -> t

let unfold t = match t with TyRec t1 -> subst 0 (TyRec t1) t1 | _ -> t

let unfoldShared t =
  match t with
  | TyLinearToShared t1 -> substShared t t1
  | TySharedToLinear t1 -> substShared t t1
  | _ -> t

let rec contains_type target ty =
  target = ty
  ||
  match ty with
  | TyInternalChoice l | TyExternalChoice l ->
      List.exists (fun (_, t) -> contains_type target t) l
  | TySendChannel (t1, t2) | TyReceiveChannel (t1, t2) ->
      contains_type target t1 || contains_type target t2
  | TySendValue (_, t1)
  | TyReceiveValue (_, t1)
  | TySharedToLinear t1
  | TyLinearToShared t1
  | TySession t1
  | TyRec t1 ->
      contains_type target t1
  | TyApp (_, tys) -> List.exists (contains_type target) tys
  | _ -> false

let rec prune_recursive_choices target ty =
  match ty with
  | TyInternalChoice l ->
      TyInternalChoice
        (List.map
           (fun (label, t) -> (label, prune_recursive_choices target t))
           l)
  | TyExternalChoice l ->
      TyExternalChoice
        (List.filter_map
           (fun (label, t) ->
             if contains_type target t then None
             else Some (label, prune_recursive_choices target t))
           l)
  | TySendChannel (t1, t2) ->
      TySendChannel
        (prune_recursive_choices target t1, prune_recursive_choices target t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel
        (prune_recursive_choices target t1, prune_recursive_choices target t2)
  | TySendValue (v, t1) -> TySendValue (v, prune_recursive_choices target t1)
  | TyReceiveValue (v, t1) ->
      TyReceiveValue (v, prune_recursive_choices target t1)
  | TySharedToLinear t1 -> TySharedToLinear (prune_recursive_choices target t1)
  | TyLinearToShared t1 -> TyLinearToShared (prune_recursive_choices target t1)
  | TySession t1 -> TySession (prune_recursive_choices target t1)
  | TyRec t1 -> TyRec (prune_recursive_choices target t1)
  | TyApp (f, tys) -> TyApp (f, List.map (prune_recursive_choices target) tys)
  | _ -> ty

let process_closed_function closed =
  match closed with
  | TyFunc (((name, argList), tRet), funcs), body ->
      fn_ctxt := (name, TyFunc (((name, argList), tRet), funcs)) :: !fn_ctxt;
      Func ((name, argList), (tRet, RawText body))
  | _ -> raise Fail

let rec synthesize t =
  match t with
  | TyFunc (_, allowed_funcs) ->
      let gamma =
        List.filter (fun (name, _) -> List.mem name allowed_funcs) !fn_ctxt
      in
      let programs =
        inversionR gamma [] [] (resolve_type t) [] [] 0
        >>= fun (delta_out, e) ->
        if delta_out <> [] then (
          print_fail "synthesize" 0;
          Choice.fail)
        else return (delta_out, e)
      in
      run_all programs
  | _ -> raise Fail

(* Apply all invertible/asynchronous rules to the goal t*)
and inversionR gamma delta_in omega t psi zeta ident =
  print_func_entry "InversionR" t ident;

  let tm =
    match t with
    | TyFunc (((name, argList), tRet), _) ->
        fn_ctxt := (name, t) :: !fn_ctxt;
        inversionR
          ((name, t) :: (argList @ gamma))
          delta_in [] tRet psi zeta (ident + 1)
        >>= fun (delta_out, e) ->
        return (delta_out, Func ((name, argList), (rev_resolve_type tRet, e)))
    | TyApp (func_name, tyArgList) ->
        let rec synth_args delta args =
          match args with
          | [] -> return (delta, [])
          | t :: rest ->
              inversionR gamma delta omega t psi zeta (ident + 1)
              >>= fun (delta', arg_tm) ->
              synth_args delta' rest >>= fun (delta'', arg_tms) ->
              return (delta'', arg_tm :: arg_tms)
        in
        synth_args delta_in tyArgList >>= fun (delta_after_args, arg_tm_list) ->
        return (delta_after_args, App (Var func_name, arg_tm_list))
    | TyRec _ ->
        if List.mem t psi then
          let (name, tyArgs), _ = searchFuncType t !fn_ctxt in

          let tyArgsList = List.map snd tyArgs in

          inversionR gamma delta_in omega
            (TyApp (name, tyArgsList))
            psi zeta (ident + 1)
        else
          let unfolded_t = unfold t in
          inversionR gamma delta_in omega unfolded_t (t :: psi) zeta (ident + 1)
          >>= fun (delta_out, e) -> return (delta_out, Fix e)
    | TySession t ->
        inversionR gamma delta_in omega t psi zeta (ident + 1)
        >>= fun (delta_out, e) ->
        if delta_out <> [] then (
          print_fail "InversionR" ident;
          Choice.fail)
        else return (delta_out, e)
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
        if not (all_equal out_ctxts) then (
          print_fail "InversionR" ident;
          Choice.fail)
        else
          match out_ctxts with
          | [] ->
              print_fail "InversionR" ident;
              Choice.fail
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
      print_func_entry_withgoal "inversionL" (TyPrimitive "Empty") ident t;
      print_ctxts_with_ident gamma delta_in ident;
      let tm = decideFocus gamma delta_in t psi zeta (ident + 1) in
      tm
  | (x, ty) :: xs ->
      print_func_entry_withgoal "inversionL" ty ident t;
      let tm =
        match ty with
        | TyPrimitive _ ->
            inversionL ((x, ty) :: gamma) delta_in xs t psi zeta (ident + 1)
        | TyFunc (((name, argList), tRet), _) ->
            if tRet <> t then (
              print_fail "inversionL" ident;
              Choice.fail)
            else
              let rec sequence_inversion gamma delta = function
                | [] -> return (delta, [])
                | (_, t1) :: xs ->
                    inversionR gamma delta [] t1 psi zeta (ident + 1)
                    >>= fun (delta', e) ->
                    sequence_inversion gamma delta' xs
                    >>= fun (delta'', rest) -> return (delta'', e :: rest)
              in
              sequence_inversion gamma delta_in argList
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
            print_ctxts_with_ident gamma delta_in ident;
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
            if not (all_equal out_ctxts) then (
              print_fail "InversionL" ident;
              Choice.fail)
            else
              match out_ctxts with
              | [] ->
                  print_fail "InversionL" ident;
                  Choice.fail
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
        | TySharedToLinear _ ->
            let t2 = unfoldShared ty in
            let x1 = fresh_channel_id () in
            inversionL ((x1, t2) :: gamma) delta_in xs t psi zeta (ident + 1)
            >>= fun (delta_out, e1) -> return (delta_out, Release (x, e1))
        | TyLinearToShared _ ->
            inversionL ((x, ty) :: gamma) delta_in xs t psi zeta (ident + 1)
        | TyZ _ -> Choice.fail (* If a TyZ has't been unfolded it should fail *)
        | _ -> inversionL gamma ((x, ty) :: delta_in) xs t psi zeta (ident + 1)
      in
      tm

and all_equal ctxts =
  match ctxts with
  | [] -> true
  | ctxt1 :: xs -> List.for_all (fun ctxt2 -> ctxt2 = ctxt1) xs

and used_by_delta ret_ty delta =
  List.exists
    (fun (_, ty) ->
      match ty with
      | TyReceiveChannel (tChan, _) -> tChan = ret_ty
      | TyReceiveValue (_, tCont) -> tCont = ret_ty
      | _ -> false)
    delta

and ends_in ty goal =
  ty = goal
  ||
  match ty with
  | TyReceiveValue (_, cont)
  | TySendValue (_, cont)
  | TyReceiveChannel (_, cont)
  | TySendChannel (_, cont)
  | TySession cont ->
      ends_in cont goal
  | TyExternalChoice branches | TyInternalChoice branches ->
      List.exists (fun (_, t) -> ends_in t goal) branches
  | TyRec _ -> ends_in (unfold ty) goal
  | _ -> false

and decideFocus gamma delta_in t psi zeta ident =
  print_func_entry "decideFocus" t ident;
  print_ctxts_with_ident gamma delta_in ident;

  let try_focus_gamma () =
    match t with
    | TyRec _ ->
        Choice.fail
        (* Building TyRec on the rigt is already dealt with in inversionR*)
    | _ -> (
        match focusGamma gamma delta_in t psi zeta (ident + 1) with
        | None -> Choice.fail
        | Some c -> return c)
  in

  let r = delay (fun () -> focusR gamma delta_in t psi zeta (ident + 1)) in

  if not (is_empty r) then r
  else
    let l = delay (fun () -> focusL gamma delta_in t psi zeta (ident + 1)) in

    if not (is_empty l) then l else try_focus_gamma ()

and focusGamma gamma delta_in t psi zeta ident =
  let focus_options = of_list gamma in

  run_one
    ( focus_options >>= fun (id, ty) ->
      log "%s< focusGamma: %s\n" (String.make ident ' ') (print_type ty);
      print_ctxts_with_ident gamma delta_in ident;
      let gamma' = removeWithId id ty gamma in
      let tm =
        match ty with
        | TyFunc (((name, argList), TySession tRet), _) ->
            if (not (ends_in tRet t)) && not (used_by_delta tRet delta_in) then
              Choice.fail
            else
              let tArgList = List.map (fun (_, t1) -> t1) argList in

              inversionR gamma' delta_in []
                (TyApp (name, tArgList))
                psi zeta (ident + 1)
              >>= fun (delta', cutL) ->
              let cut_dirs =
                List.map
                  (fun (id, ty) ->
                    if
                      List.exists
                        (fun (id', ty') -> id = id' && ty = ty')
                        delta'
                    then R
                    else L)
                  delta_in
              in

              let x1 = fresh_binder_id () in

              inversionL gamma' delta' [ (x1, tRet) ] t psi zeta (ident + 1)
              >>= fun (delta_out, cutR) ->
              return (delta_out, Cut (cut_dirs, cutL, (x1, cutR)))
        | TyLinearToShared _ ->
            focusL' gamma' delta_in id ty t psi zeta (ident + 1)
        | _ -> Choice.fail
      in
      tm )

and focusR gamma delta_in t psi zeta ident =
  print_func_entry "FocusR" t ident;

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
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)
    | TySendValue (tau, t2) -> (
        try
          let id, ctxt_out = search (TyPrimitive tau) gamma in
          focusR ctxt_out delta_in t2 psi zeta (ident + 1)
          >>= fun (delta_out, e1) -> return (delta_out, SendValue (Var id, e1))
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)
    | TySharedToLinear t1 ->
        if delta_in <> [] then (
          print_fail "focusR" ident;
          Choice.fail)
        else
          let t2 = unfoldShared t in
          (try
             if not (List.mem t1 psi) then raise Fail
             else
               let (name, tyArgs), _ = searchFuncType t1 !fn_ctxt in
               let tyArgsList = List.map snd tyArgs in
               inversionR gamma delta_in []
                 (TyApp (name, tyArgsList))
                 psi zeta (ident + 1)
           with Fail ->
             inversionR gamma delta_in [] t2 (t :: psi) zeta (ident + 1))
          >>= fun (delta_out, e1) -> return (delta_out, Detach e1)
    | TyLinearToShared t1 ->
        if delta_in <> [] then (
          print_fail "focusR" ident;
          Choice.fail)
        else
          let t2 = unfoldShared t in
          (try
             if not (List.mem t1 psi) then raise Fail
             else
               let (name, tyArgs), _ = searchFuncType t1 !fn_ctxt in
               let tyArgsList = List.map snd tyArgs in
               inversionR gamma delta_in []
                 (TyApp (name, tyArgsList))
                 psi zeta (ident + 1)
           with Fail ->
             inversionR gamma delta_in [] t2 (t :: psi) zeta (ident + 1))
          >>= fun (delta_out, e1) -> return (delta_out, Accept e1)
    | TyEnd ->
        if delta_in <> [] then (
          print_fail "focusR" ident;
          Choice.fail)
        else (
          log "%s success\n" (String.make ident ' ');
          return (delta_in, Terminate))
    | TyAtomic _ -> (
        try
          let id, ctxt_out = searchAndRemove t delta_in in
          log "%s success\n" (String.make ident ' ');
          return (ctxt_out, Forward id)
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)
    | TyPrimitive _ -> (
        try
          let id, _ = search t gamma in
          log "%s success\n" (String.make ident ' ');
          return (delta_in, Var id)
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)
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
        let id', rest = search t xs in
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
  | (_, TyFunc (((func_id, argList), retType), _)) :: rest ->
      if retType = TySession t then ((func_id, argList), retType)
      else searchFuncType t rest
  | _ -> raise Fail

and searchZeta id = function
  | [] -> false
  | (id1, _) :: rest -> if id1 = id then true else searchZeta id rest

and searchTimesUsedZeta id = function
  | [] -> raise Fail
  | (id1, timesUsed) :: rest ->
      if id1 = id then timesUsed else searchTimesUsedZeta id rest

and incTimesUsedZeta id acc = function
  | [] -> raise Fail
  | (id1, timesUsed) :: rest ->
      if id1 = id then List.rev_append acc ((id1, timesUsed + 1) :: rest)
      else incTimesUsedZeta id ((id1, timesUsed) :: acc) rest

and focusL gamma delta_in t psi zeta ident =
  let focus_options = of_list delta_in in

  print_func_entry "focusL" t ident;
  print_ctxts_with_ident gamma delta_in ident;
  log "%s> %d\n" (String.make ident ' ') (List.length (to_list focus_options));
  focus_options >>= fun (id, ty) ->
  let delta_in' = removeWithId id ty delta_in in
  focusL' gamma delta_in' id ty t psi zeta (ident + 1)

and focusL' gamma delta_in id foc t psi zeta ident =
  print_func_entry "FocusL'" foc ident;

  let tm =
    match foc with
    | TyAtomic _ ->
        if foc = t && delta_in = [] then (
          log "%s success\n" (String.make ident ' ');
          return (delta_in, Forward id))
        else (
          print_fail "focusL" ident;
          Choice.fail)
    | TyPrimitive _ ->
        if foc = t && delta_in <> [] then (
          log "%s success\n" (String.make ident ' ');
          return (delta_in, Var id))
        else (
          print_fail "focusL" ident;
          Choice.fail)
    | TySession t1 ->
        let x1 = fresh_binder_id () in
        inversionR gamma delta_in [ (x1, t1) ] t psi zeta (ident + 1)
        >>= fun (delta_out, e) ->
        let cut_dirs = List.map (fun (_, _) -> R) delta_in in
        return (delta_out, Cut ([ L ] @ cut_dirs, Var id, (x1, e)))
    | TyRec _ ->
        print_ctxts_with_ident gamma delta_in ident;

        let zeta = if searchZeta id zeta then zeta else (id, 0) :: zeta in

        log "%s\n" (string_of_int (searchTimesUsedZeta id zeta));

        if searchTimesUsedZeta id zeta > 2 then (
          print_fail "focusL" ident;
          Choice.fail)
        else if searchTimesUsedZeta id zeta = 0 then
          let unfolded_foc = unfold foc in
          focusL' gamma delta_in id unfolded_foc t psi
            (incTimesUsedZeta id [] zeta)
            (ident + 1)
          >>= fun (delta_out, e) -> return (delta_out, Unfix (id, e))
        else
          let unfolded_foc = unfold foc in

          let pruned_foc = prune_recursive_choices foc unfolded_foc in

          let did_prune = pruned_foc <> unfolded_foc in

          let zeta_for_pruned =
            if did_prune then zeta else incTimesUsedZeta id [] zeta
          in

          let try_no_unfolding =
            focusL' gamma delta_in id pruned_foc t psi zeta_for_pruned
              (ident + 1)
          in

          if is_empty try_no_unfolding then
            focusL' gamma delta_in id unfolded_foc t psi
              (incTimesUsedZeta id [] zeta)
              (ident + 1)
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
        print_ctxts_with_ident gamma delta_in ident;
        let branches = of_list l in
        branches >>= fun (label, ty) ->
        inversionR gamma delta_in [ (id, ty) ] t psi zeta (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, Choose (id, (label, e1)))
    | TyReceiveValue (t1, t2) ->
        print_ctxts_with_ident gamma delta_in ident;
        let possible_values =
          List.filter (fun (_, ty) -> ty = TyPrimitive t1) gamma
        in
        of_list possible_values >>= fun (x, _) ->
        focusL' gamma delta_in id t2 t psi zeta (ident + 1)
        >>= fun (delta_out, e1) ->
        return (delta_out, SendValueTo ((id, Var x), e1))
    | TyLinearToShared _ ->
        let t2 = unfoldShared foc in
        let x1 = fresh_channel_id () in
        inversionR gamma delta_in [ (x1, t2) ] t psi zeta (ident + 1)
        >>= fun (delta_out, e1) -> return (delta_out, Acquire (id, (x1, e1)))
    | _ -> inversionL gamma delta_in [ (id, foc) ] t psi zeta (ident + 1)
  in
  tm

and print_zeta zeta =
  let elems = List.map (fun (id, n) -> Printf.sprintf "(%s, %d)" id n) zeta in
  log "[%s]\n" (String.concat "; " elems)

and print_psi psi =
  let elems = List.map (fun t -> Printf.sprintf "(%s)" (print_type t)) psi in
  log "[%s]\n" (String.concat "; " elems)
