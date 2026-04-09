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

let rec print_ctxt ctxt =
  match ctxt with
  | [] -> ""
  | (id, t) :: xs -> sprintf "(%s, %s), %s" id (print_type t) (print_ctxt xs)

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

(* Substitutes name x in expression e1 with expression e2 *)
let rec subst e1 x e2 =
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

let rec synthesize t =
  let programs = inversionR [] [] [] t in
  run_all programs

(* Apply all invertible/asynchronous rules to the goal t*)
and inversionR gamma delta_in omega t =
  match t with
  | TyReceiveChannel (tChan, tCont) ->
      let x = fresh_channel_id () in
      inversionR gamma delta_in ((x, tChan) :: omega) tCont
      >>= fun (delta_out, e1) -> return (delta_out, ReceiveChannel (x, e1))
  | TyReceiveValue (tau, tCont) ->
      let x = fresh_val_id () in
      inversionR ((x, TyPrimitive tau) :: gamma) delta_in omega tCont
      >>= fun (delta_out, e1) -> return (delta_out, ReceiveValue (x, e1))
  | TyExternalChoice l -> (
      let branches =
        List.map
          (fun (label, t) ->
            inversionR gamma delta_in omega t >>= fun res ->
            Choice.return (label, res))
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
  | _ -> inversionL gamma delta_in omega t

and sequence lst =
  match lst with
  | [] -> Choice.return []
  | x :: xs ->
      x >>= fun v ->
      sequence xs >>= fun vs -> Choice.return (v :: vs)

and inversionL gamma delta_in omega t =
  match omega with
  | [] -> decideFocus gamma delta_in t
  | (x, ty) :: xs -> (
      match ty with
      | TySendChannel (tyChan, tyCont) ->
          let binder = fresh_binder_id () in
          inversionL gamma delta_in ((x, tyCont) :: (binder, tyChan) :: xs) t
          >>= fun (delta_out, e1) ->
          return (delta_out, ReceiveChannelFrom (x, (binder, e1)))
      | TySendValue (tau, tyCont) ->
          let binder = fresh_binder_id () in
          inversionL
            ((binder, TyPrimitive tau) :: gamma)
            delta_in ((x, tyCont) :: xs) t
          >>= fun (delta_out, e1) ->
          return (delta_out, ReceiveValueFrom ((x, binder), e1))
      | TyInternalChoice l -> (
          let branches =
            List.map
              (fun (label, t1) ->
                inversionL gamma delta_in ((x, t1) :: xs) t >>= fun res ->
                Choice.return (label, res))
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
                        List.map (fun (label, (_, tm)) -> (label, tm)) branches
                      ) ))
      | TyEnd ->
          inversionL gamma delta_in xs t >>= fun (delta_out, e1) ->
          return (delta_out, Wait (x, e1))
      | TySharedToLinear t1 ->
          let x1 = fresh_channel_id () in
          inversionL ((x1, t1) :: gamma) delta_in xs t
          >>= fun (delta_out, e1) -> return (delta_out, Release (x, e1))
      | TyLinearToShared _ -> inversionL ((x, ty) :: gamma) delta_in xs t
      | _ -> inversionL gamma ((x, ty) :: delta_in) xs t)

and all_equal ctxts =
  match ctxts with
  | [] -> true
  | ctxt1 :: xs -> List.for_all (fun ctxt2 -> ctxt2 = ctxt1) xs

and decideFocus gamma delta_in t =
  print_endline (print_ctxt gamma);
  mplus (focusR gamma delta_in t)
    (mplus (focusL gamma delta_in t) (focusGamma gamma delta_in t))

and focusGamma gamma delta_in t =
  match gamma with
  | [] -> Choice.fail
  | (id, ty) :: xs -> focusL' xs delta_in id ty t

and focusR gamma delta_in t =
  match t with
  | TyInternalChoice l ->
      let choices = of_list l in
      choices >>= fun (label, t1) ->
      focusR gamma delta_in t1 >>= fun (delta_out, e) ->
      return (delta_out, Offer (label, e))
  | TySendChannel (t1, t2) -> (
      try
        let id, ctxt_out = searchAndRemove t1 delta_in in
        focusR gamma ctxt_out t2 >>= fun (delta_out, e1) ->
        return (delta_out, SendChannelFrom (id, e1))
      with Fail -> Choice.fail)
  | TySendValue (tau, t2) -> (
      try
        let id, ctxt_out = search (TyPrimitive tau) gamma in
        focusR ctxt_out delta_in t2 >>= fun (delta_out, e1) ->
        return (delta_out, SendValue (Var id, e1))
      with Fail -> Choice.fail)
  | TySharedToLinear t ->
      if delta_in <> [] then Choice.fail
      else
        focusR gamma delta_in t >>= fun (delta_out, e1) ->
        return (delta_out, Detach e1)
  | TyLinearToShared t ->
      if delta_in <> [] then Choice.fail
      else
        decideFocus gamma delta_in t >>= fun (delta_out, e1) ->
        return (delta_out, Accept e1)
  | TyEnd -> if delta_in <> [] then Choice.fail else return (delta_in, Terminate)
  | TyAtomic _ -> (
      try
        let id, ctxt_out = searchAndRemove t delta_in in
        return (ctxt_out, Forward id)
      with Fail -> Choice.fail)
  | TyPrimitive _ -> (
      try
        let id, ctxt_out = searchAndRemove t delta_in in
        return (ctxt_out, Var id)
      with Fail -> Choice.fail)
  | _ -> inversionR gamma delta_in [] t

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

and focusL gamma delta_in t =
  let focus_options = of_list delta_in in
  focus_options >>= fun (id, ty) ->
  let delta_in' = removeWithId id ty delta_in in
  focusL' gamma delta_in' id ty t

and focusL' gamma delta_in id foc t =
  match foc with
  | TyAtomic _ -> if foc = t then return (delta_in, Forward id) else Choice.fail
  | TyPrimitive _ -> if foc = t then return (delta_in, Var id) else Choice.fail
  | TyReceiveChannel (tChan, tCont) ->
      let possible_channels =
        List.filter (fun (_, ty) -> ty = tChan) delta_in
      in
      of_list possible_channels >>= fun (x, ty) ->
      focusL' gamma (removeWithId x ty delta_in) id tCont t
      >>= fun (delta_out, e1) -> return (delta_out, SendChannelTo ((id, x), e1))
  | TyExternalChoice l ->
      let branches = of_list l in
      branches >>= fun (label, ty) ->
      focusL' gamma delta_in id ty t >>= fun (delta_out, e1) ->
      return (delta_out, Choose (id, (label, e1)))
  | TyReceiveValue (t1, t2) ->
      let possible_values =
        List.filter (fun (_, ty) -> ty = TyPrimitive t1) delta_in
      in
      of_list possible_values >>= fun (x, ty) ->
      focusL' gamma (removeWithId x ty delta_in) id t2 t
      >>= fun (delta_out, e1) ->
      return (delta_out, SendValueTo ((id, Var x), e1))
  | TyLinearToShared t1 ->
      let x1 = fresh_binder_id () in
      decideFocus gamma ((x1, t1) :: delta_in) t >>= fun (delta_out, e1) ->
      return (delta_out, Accquire (id, (x1, e1)))
  | _ -> inversionL gamma delta_in [ (id, foc) ] t
