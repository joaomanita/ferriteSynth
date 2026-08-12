open Mini_ast
open Printf
open Choice
open Stdlib
open Utils
open Memo

let debug_enabled = true
let debug_out = if debug_enabled then Some (open_out "debug.log") else None

let log fmt =
  match debug_out with
  | Some ch -> Printf.fprintf ch fmt
  | None -> Printf.ifprintf stdout fmt

exception Fail

type id = string

let fn_ctxt = ref []
let type_ctxt = ref []
let append_type_ctxt name t = type_ctxt := (name, t) :: !type_ctxt
let define_choice_ctxt = ref []

let append_define_choice cdef =
  define_choice_ctxt := cdef :: !define_choice_ctxt

let rec lookup_type name ctxt =
  match ctxt with
  | [] -> None
  | (n, t) :: xs -> if n = name then Some t else lookup_type name xs

let rec lookup_define_choice name ctxt =
  match ctxt with
  | [] -> raise Fail
  | c :: xs -> (
      match c with
      | TyDefineChoice (id, _) ->
          if id = name then c else lookup_define_choice name xs
      | _ -> raise Fail)

let apply_func_choice c f =
  match c with
  | TyDefineChoice (name, l) ->
      TyDefineChoice (name, List.map (fun (label, ty) -> (label, f ty)) l)
  | TyEither (t1, t2) -> TyEither (f t1, f t2)

(* Resolves type aliases into their real representations *)
let rec resolve_type t =
  match t with
  | TyPrimitive s -> (
      match lookup_type s !type_ctxt with
      | Some real_t -> resolve_type real_t
      | None -> t)
  | TyAtomic _ -> t
  | TyExistential _ -> t
  | TyInternalChoice c -> TyInternalChoice (apply_func_choice c resolve_type)
  | TyExternalChoice c -> TyExternalChoice (apply_func_choice c resolve_type)
  | TyInternalChoiceId id ->
      TyInternalChoice
        (apply_func_choice
           (lookup_define_choice id !define_choice_ctxt)
           resolve_type)
  | TyExternalChoiceId id ->
      TyExternalChoice
        (apply_func_choice
           (lookup_define_choice id !define_choice_ctxt)
           resolve_type)
  | TySendChannel (t1, t2) -> TySendChannel (resolve_type t1, resolve_type t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (resolve_type t1, resolve_type t2)
  | TySendValue (t1, t2) -> TySendValue (resolve_type t1, resolve_type t2)
  | TyReceiveValue (t1, t2) -> TyReceiveValue (resolve_type t1, resolve_type t2)
  | TyEnd -> t
  | TySharedToLinear (t, counter) -> TySharedToLinear (resolve_type t, counter)
  | TyLinearToShared (t, counter) -> TyLinearToShared (resolve_type t, counter)
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
  | TyApp ty -> TyApp (resolve_type ty)
  | TyRec t -> TyRec (resolve_type t)
  | TyZ _ -> t
  | TyUnitRetFunc ((name, argList), funcs) ->
      TyUnitRetFunc
        ( ( name,
            List.map
              (fun (argName, argType) -> (argName, resolve_type argType))
              argList ),
          funcs )
  | TyScheme (tList, tau) -> TyScheme (tList, resolve_type tau)
  | TySchemeFunc (tList, (((name, argList), tRet), funcs)) ->
      TySchemeFunc
        ( tList,
          ( ( ( name,
                List.map
                  (fun (argName, argType) -> (argName, resolve_type argType))
                  argList ),
              resolve_type tRet ),
            funcs ) )

(* Replaces types with their aliases if they are defined *)
let rec rev_resolve_type t =
  match rev_resolve_atomic t !type_ctxt with
  | Some name -> TyPrimitive name
  | None -> (
      match t with
      | TyInternalChoice c ->
          TyInternalChoice (apply_func_choice c rev_resolve_type)
      | TyExternalChoice c ->
          TyExternalChoice (apply_func_choice c rev_resolve_type)
      | TySendChannel (t1, t2) ->
          TySendChannel (rev_resolve_type t1, rev_resolve_type t2)
      | TyReceiveChannel (t1, t2) ->
          TyReceiveChannel (rev_resolve_type t1, rev_resolve_type t2)
      | TySendValue (t1, t2) ->
          TySendValue (rev_resolve_type t1, rev_resolve_type t2)
      | TyReceiveValue (t1, t2) ->
          TyReceiveValue (rev_resolve_type t1, rev_resolve_type t2)
      | TySharedToLinear (t1, counter) ->
          TySharedToLinear (rev_resolve_type t1, counter)
      | TyLinearToShared (t1, counter) ->
          TyLinearToShared (rev_resolve_type t1, counter)
      | TySession t1 -> TySession (rev_resolve_type t1)
      | TyApp ty -> TyApp (rev_resolve_type ty)
      | TyRec t1 -> TyRec (rev_resolve_type t1)
      | _ -> t)

and rev_resolve_atomic t ctxt =
  match ctxt with
  | [] -> None
  | (name, ty) :: xs -> if ty = t then Some name else rev_resolve_atomic t xs

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
  | UnitRetFunc of (id * (id * ty) list) * tm
  | RunSession of tm
  | ApplyChannel of tm * tm
  | SchemeFunc of ty list * ((id * (id * ty) list) * (ty * tm))

and side = L | R

let print_side = function L -> "L" | R -> "R"

let print_fail func_name ident =
  log "%s< %s: fail\n" (String.make ident ' ') func_name

let print_func_entry func_name t ident =
  log "%s< %s: %s\n" (String.make ident ' ') func_name (print_type t)

let print_func_entry_withgoal func_name t ident goal =
  log "%s< %s: %s with goal %s \n" (String.make ident ' ') func_name
    (print_type t) (print_type goal)

let print_ctxts_with_ident gamma delta ident =
  log "%s< [%s] [%s]\n" (String.make ident ' ') (print_ctxt_gamma gamma)
    (print_ctxt_delta delta)

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
  | UnitRetFunc ((name, argList), tm) ->
      let args_str =
        argList
        |> List.map (fun (n, ty) -> n ^ ": " ^ print_type ty)
        |> String.concat ", "
      in
      sprintf "fn %s(%s) { %s }" name args_str (print_exp tm)
  | RunSession tm -> sprintf "run_session(%s).await()" (print_exp tm)
  | ApplyChannel (tm1, tm2) ->
      sprintf "apply_channel(%s, %s)" (print_exp tm1) (print_exp tm2)
  | SchemeFunc (tList, ((name, argList), (t, tm))) ->
      let args_str =
        argList
        |> List.map (fun (n, ty) -> n ^ ": " ^ print_type ty)
        |> String.concat ", "
      in
      sprintf "fn %s<%s>(%s) -> %s { %s }" name
        (String.concat ", " (List.map print_type tList))
        args_str (print_type t) (print_exp tm)

(* Substitutes x in type t1 with replacement *)
let rec substT x replacement t1 =
  if equal_type x t1 then replacement
  else
    match t1 with
    | TyAtomic a -> if TyAtomic a = x then replacement else t1
    | TyInternalChoice c ->
        TyInternalChoice (apply_func_choice c (substT x replacement))
    | TyExternalChoice c ->
        TyExternalChoice (apply_func_choice c (substT x replacement))
    | TySendChannel (t1, t2) ->
        TySendChannel (substT x replacement t1, substT x replacement t2)
    | TyReceiveChannel (t1, t2) ->
        TyReceiveChannel (substT x replacement t1, substT x replacement t2)
    | TySendValue (t1, t2) ->
        TySendValue (substT x replacement t1, substT x replacement t2)
    | TyReceiveValue (t1, t2) ->
        TyReceiveValue (substT x replacement t1, substT x replacement t2)
    | TySharedToLinear (t, counter) ->
        TySharedToLinear (substT x replacement t, counter)
    | TyLinearToShared (t, counter) ->
        TyLinearToShared (substT x replacement t, counter)
    | TySession t -> TySession (substT x replacement t)
    | TyRec t -> TyRec (substT x replacement t)
    | TyFunc (((n, args), ret), fs) ->
        TyFunc
          ( ( (n, List.map (fun (l, t) -> (l, substT x replacement t)) args),
              substT x replacement ret ),
            fs )
    | TyScheme (ts, tau) -> TyScheme (ts, substT x replacement tau)
    | TySchemeFunc (ts, (((n, args), ret), fs)) ->
        TySchemeFunc
          ( ts,
            ( ( (n, List.map (fun (l, t) -> (l, substT x replacement t)) args),
                substT x replacement ret ),
              fs ) )
    | _ -> t1

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
  | Acquire (chan, (binder, tm)) ->
      if x <> binder then Acquire (chan, (binder, subst tm x e2)) else e1
  | Forward chan -> if chan = x then e2 else e1
  | Cut (sideList, session_tm, (binder, tm)) ->
      if x <> binder then Cut (sideList, session_tm, (binder, subst tm x e2))
      else e1
  | Func ((name, argList), (t, tm)) ->
      let binders = List.map fst argList in
      if List.mem x binders then e1
      else Func ((name, argList), (t, subst tm x e2))
  | App (func_tm, arg_tmList) ->
      App (subst func_tm x e2, List.map (fun tm -> subst tm x e2) arg_tmList)
  | Fix tm -> Fix (subst tm x e2)
  | Unfix (id, tm) ->
      if x <> id then Unfix (id, subst tm x e2) else Unfix (id, tm)
  | RunSession tm -> RunSession (subst tm x e2)
  | ApplyChannel (tm1, tm2) -> ApplyChannel (subst tm1 x e2, subst tm2 x e2)
  | _ -> e1

(* Shift the depth of TyZ for unfolding nested recursive types*)
let rec shift d t =
  match t with
  | TyZ k -> TyZ (k + d)
  | TyRec t1 -> TyRec (shift d t1)
  | TyInternalChoice c -> TyInternalChoice (apply_func_choice c (shift d))
  | TyExternalChoice c -> TyExternalChoice (apply_func_choice c (shift d))
  | TySendChannel (t1, t2) -> TySendChannel (shift d t1, shift d t2)
  | TyReceiveChannel (t1, t2) -> TyReceiveChannel (shift d t1, shift d t2)
  | TySendValue (t1, t2) -> TySendValue (shift d t1, shift d t2)
  | TyReceiveValue (t1, t2) -> TyReceiveValue (shift d t1, shift d t2)
  | TySharedToLinear (t1, counter) -> TySharedToLinear (shift d t1, counter)
  | TyLinearToShared (t1, counter) -> TyLinearToShared (shift d t1, counter)
  | TySession t1 -> TySession (shift d t1)
  | _ -> t

(* Helper for recursive unfold *)
let rec substRec k replacement t =
  match t with
  | TyZ n -> if n = k then replacement else if n > k then TyZ (n - 1) else TyZ n
  | TyRec t1 -> TyRec (substRec (k + 1) replacement t1)
  | TyInternalChoice c ->
      TyInternalChoice (apply_func_choice c (substRec k replacement))
  | TyExternalChoice c ->
      TyExternalChoice (apply_func_choice c (substRec k replacement))
  | TySendChannel (t1, t2) ->
      TySendChannel (substRec k replacement t1, substRec k replacement t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (substRec k replacement t1, substRec k replacement t2)
  | TySendValue (t1, t2) ->
      TySendValue (substRec k replacement t1, substRec k replacement t2)
  | TyReceiveValue (t1, t2) ->
      TyReceiveValue (substRec k replacement t1, substRec k replacement t2)
  | TySharedToLinear (t1, counter) ->
      TySharedToLinear (substRec k replacement t1, counter)
  | TyLinearToShared (t1, counter) ->
      TyLinearToShared (substRec k replacement t1, counter)
  | TySession t1 -> TySession (substRec k replacement t1)
  | _ -> t

let unfold t = match t with TyRec t1 -> substRec 0 (TyRec t1) t1 | _ -> t

let unfoldShared t =
  match t with
  | TyLinearToShared (TySharedToLinear (t1, _), counter) ->
      TySharedToLinear (t1, counter + 1)
  | TySharedToLinear (TyLinearToShared (t1, _), counter) ->
      TyLinearToShared (t1, counter + 1)
  | TyLinearToShared (t1, counter) ->
      substT TyFixShared (TySharedToLinear (t, counter + 1)) t1
  | TySharedToLinear (t1, counter) ->
      substT TyFixShared (TyLinearToShared (t, counter + 1)) t1
  | _ -> t

(* Helper for unifyT *)
let rec contains_type target ty =
  equal_type target ty
  ||
  match ty with
  | TyInternalChoice c | TyExternalChoice c -> (
      match c with
      | TyDefineChoice (_, l) ->
          List.exists (fun (_, t) -> contains_type target t) l
      | TyEither (t1, t2) -> contains_type target t1 || contains_type target t2)
  | TySendChannel (t1, t2) | TyReceiveChannel (t1, t2) ->
      contains_type target t1 || contains_type target t2
  | TySendValue (_, t1)
  | TyReceiveValue (_, t1)
  | TySharedToLinear (t1, _)
  | TyLinearToShared (t1, _)
  | TySession t1
  | TyRec t1 ->
      contains_type target t1
  | TyApp ty -> contains_type target ty
  | TyFunc (((_, _), tRet), _) -> contains_type target tRet
  | TyUnitRetFunc ((_, argList), _) ->
      List.exists (fun (_, t1) -> contains_type target t1) argList
  | _ -> false

let rec uses_typeR target ty =
  match ty with
  | TyInternalChoice c | TyExternalChoice c -> (
      match c with
      | TyDefineChoice (_, l) ->
          List.exists (fun (_, t) -> uses_typeR target t) l
      | TyEither (t1, t2) -> uses_typeR target t1 || uses_typeR target t2)
  | TySendChannel (t1, t2) -> equal_type target t1 || uses_typeR target t2
  | TyReceiveChannel (_, t2) -> uses_typeR target t2
  | TySendValue (t1, t2) -> equal_type target t1 || uses_typeR target t2
  | TyReceiveValue (_, t1)
  | TySharedToLinear (t1, _)
  | TyLinearToShared (t1, _)
  | TySession t1
  | TyRec t1 ->
      uses_typeR target t1
  | TyApp t1 -> uses_typeR target t1
  | TyFunc (((_, _), tRet), _) -> uses_typeR target tRet
  | TyUnitRetFunc ((_, argList), _) ->
      List.exists (fun (_, t1) -> uses_typeR target t1) argList
  | TyAtomic _ | TyPrimitive _ -> equal_type target ty
  | TyEnd -> contains_type TyEnd target
  | _ -> false

let rec uses_typeL target ty =
  match ty with
  | TyInternalChoice c | TyExternalChoice c -> (
      match c with
      | TyDefineChoice (_, l) ->
          List.exists (fun (_, t) -> uses_typeL target t) l
      | TyEither (t1, t2) -> uses_typeL target t1 || uses_typeL target t2)
  | TySendChannel (_, t2) -> uses_typeL target t2
  | TyReceiveChannel (t1, t2) -> equal_type target t1 || uses_typeL target t2
  | TySendValue (_, t1) -> uses_typeL target t1
  | TyReceiveValue (t1, t2) -> equal_type target t1 || uses_typeL target t2
  | TySharedToLinear (t1, _)
  | TyLinearToShared (t1, _)
  | TySession t1
  | TyRec t1 ->
      uses_typeL target t1
  | TyApp t1 -> uses_typeL target t1
  | TyFunc (((_, _), tRet), _) -> uses_typeL target tRet
  | TyUnitRetFunc ((_, argList), _) ->
      List.exists (fun (_, t1) -> uses_typeL target t1) argList
  | TyAtomic _ | TyPrimitive _ -> equal_type target ty
  | TyEnd -> contains_type TyEnd target
  | _ -> false

let uses_typeDelta target delta =
  List.exists (fun (_, ty) -> uses_typeL target ty) delta

(* Deletes recursive continuations from a type *)
let rec prune_recursive_choices target ty =
  match ty with
  | TyInternalChoice c ->
      TyInternalChoice (apply_func_choice c (prune_recursive_choices target))
  | TyExternalChoice c -> (
      match c with
      | TyDefineChoice (name, l) ->
          TyExternalChoice
            (TyDefineChoice
               ( name,
                 List.filter_map
                   (fun (label, t) ->
                     if contains_type target t then None
                     else Some (label, prune_recursive_choices target t))
                   l ))
      | TyEither (t1, t2) -> (
          match (contains_type target t1, contains_type target t2) with
          | true, true -> raise Fail
          | true, false -> prune_recursive_choices target t2
          | false, true -> prune_recursive_choices target t1
          | false, false ->
              TyExternalChoice
                (TyEither
                   ( prune_recursive_choices target t1,
                     prune_recursive_choices target t2 ))))
  | TySendChannel (t1, t2) ->
      TySendChannel
        (prune_recursive_choices target t1, prune_recursive_choices target t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel
        (prune_recursive_choices target t1, prune_recursive_choices target t2)
  | TySendValue (v, t1) -> TySendValue (v, prune_recursive_choices target t1)
  | TyReceiveValue (v, t1) ->
      TyReceiveValue (v, prune_recursive_choices target t1)
  | TySharedToLinear (t1, counter) ->
      TySharedToLinear (prune_recursive_choices target t1, counter)
  | TyLinearToShared (t1, counter) ->
      TyLinearToShared (prune_recursive_choices target t1, counter)
  | TySession t1 -> TySession (prune_recursive_choices target t1)
  | TyRec t1 -> TyRec (prune_recursive_choices target t1)
  | TyApp t1 -> TyApp (prune_recursive_choices target t1)
  | _ -> ty

let rec apply_all_subst ty l =
  match l with
  | [] -> ty
  | (old_t, fresh_t) :: xs -> apply_all_subst (substT old_t fresh_t ty) xs

let fresh_instantiation vars =
  List.map (fun tv -> (tv, TyExistential (fresh_existential_id ()))) vars

(* Replaces polymorphic variables in a scheme with a unique TyExistential *)
let rec instantiate ty =
  match ty with
  | TyScheme (tList, tau) ->
      let subst = fresh_instantiation tList in
      instantiate (apply_all_subst tau subst)
  | TySchemeFunc (tList, (((name, argList), tRet), funcs)) ->
      let subst = fresh_instantiation tList in
      let argList =
        List.map
          (fun (id, ty) -> (id, instantiate (apply_all_subst ty subst)))
          argList
      in
      let tRet = instantiate (apply_all_subst tRet subst) in
      TyFunc (((name, argList), tRet), funcs)
  | TySendChannel (t1, t2) -> TySendChannel (instantiate t1, instantiate t2)
  | TyReceiveChannel (t1, t2) ->
      TyReceiveChannel (instantiate t1, instantiate t2)
  | TySendValue (t1, t2) -> TySendValue (instantiate t1, instantiate t2)
  | TyReceiveValue (t1, t2) -> TyReceiveValue (instantiate t1, instantiate t2)
  | TyInternalChoice c -> TyInternalChoice (apply_func_choice c instantiate)
  | TyExternalChoice c -> TyExternalChoice (apply_func_choice c instantiate)
  | TySharedToLinear (t, counter) -> TySharedToLinear (instantiate t, counter)
  | TyLinearToShared (t, counter) -> TyLinearToShared (instantiate t, counter)
  | TySession t -> TySession (instantiate t)
  | TyRec t -> TyRec (instantiate t)
  | TyFunc (((name, argList), tRet), funcs) ->
      TyFunc
        ( ( (name, List.map (fun (id, ty) -> (id, instantiate ty)) argList),
            instantiate tRet ),
          funcs )
  | TyUnitRetFunc ((name, argList), funcs) ->
      TyUnitRetFunc
        ((name, List.map (fun (id, ty) -> (id, instantiate ty)) argList), funcs)
  | TyApp t1 -> TyApp (instantiate t1)
  | _ -> ty

let instantiateSubst subst ty = apply_all_subst ty subst

exception CannotUnify

(* Helper for unifyT *)
let rec unify_choice subst c1 c2 =
  match (c1, c2) with
  | TyEither (l1, r1), TyEither (l2, r2) ->
      let subst = unifyT subst l1 l2 in
      unifyT subst r1 r2
  | TyDefineChoice (_, l1), TyDefineChoice (_, l2) ->
      if List.length l1 <> List.length l2 then raise CannotUnify;

      List.fold_left2
        (fun subst (_, ty1) (_, ty2) -> unifyT subst ty1 ty2)
        subst l1 l2
  | _ -> raise CannotUnify

(* Unifies t1 and t2 returning a list of substitutions*)
and unifyT subst t1 t2 =
  let t1 = apply_all_subst t1 subst in
  let t2 = apply_all_subst t2 subst in

  if equal_type t1 t2 then subst
  else
    match (t1, t2) with
    | TyExistential x, t | t, TyExistential x ->
        if contains_type (TyExistential x) t then raise CannotUnify
        else (TyExistential x, t) :: subst
    | TyPrimitive a, TyPrimitive b when a = b -> subst
    | TyAtomic a, TyAtomic b when a = b -> subst
    | TySession a, TySession b -> unifyT subst a b
    | TyRec a, TyRec b -> unifyT subst a b
    | TySendChannel (a1, a2), TySendChannel (b1, b2)
    | TyReceiveChannel (a1, a2), TyReceiveChannel (b1, b2)
    | TySendValue (a1, a2), TySendValue (b1, b2)
    | TyReceiveValue (a1, a2), TyReceiveValue (b1, b2) ->
        let subst = unifyT subst a1 b1 in
        unifyT subst a2 b2
    | TySharedToLinear (a, _), TySharedToLinear (b, _)
    | TyLinearToShared (a, _), TyLinearToShared (b, _) ->
        unifyT subst a b
    | TyInternalChoice c1, TyInternalChoice c2 -> unify_choice subst c1 c2
    | TyExternalChoice c1, TyExternalChoice c2 -> unify_choice subst c1 c2
    | _ -> raise CannotUnify

(* Checks if a substitution is compatible with previous ones in context theta*)
let unify constr theta =
  let existential, real = constr in
  if
    List.exists
      (fun (e, r) -> if e = existential && r <> real then true else false)
      theta
  then raise Fail
  else if
    List.exists (fun (e, _) -> if e = existential then true else false) theta
  then theta
  else constr :: theta

let process_closed_function closed =
  match closed with
  | TyFunc (((name, argList), tRet), funcs), body ->
      let t_resolved = resolve_type (TyFunc (((name, argList), tRet), funcs)) in
      fn_ctxt := (name, t_resolved) :: !fn_ctxt;
      Func ((name, argList), (tRet, RawText body))
  | TySchemeFunc (tList, (((name, argList), tRet), funcs)), body ->
      let t_resolved =
        resolve_type (TySchemeFunc (tList, (((name, argList), tRet), funcs)))
      in
      fn_ctxt := (name, t_resolved) :: !fn_ctxt;
      SchemeFunc (tList, ((name, argList), (tRet, RawText body)))
  | _ -> raise Fail

let rec synthesize t =
  match t with
  | TyFunc (((name, _), _), required_funcs)
  | TyUnitRetFunc ((name, _), required_funcs)
  | TySchemeFunc (_, (((name, _), _), required_funcs)) ->
      let delta_in =
        List.filter (fun (name, _) -> List.mem name required_funcs) !fn_ctxt
      in
      let t_resolved = resolve_type t in
      fn_ctxt := (name, t_resolved) :: !fn_ctxt;
      let programs =
        inversionR [] delta_in [] t_resolved [] [] [] [] 0
        >>= fun ((delta_out, theta_out), e) ->
        if delta_out <> [] then (
          print_fail "synthesize" 0;
          Choice.fail)
        else return ((delta_out, theta_out), e)
      in
      run_all programs
  | _ -> raise Fail

(* Apply all invertible/asynchronous rules to the goal t*)
and inversionR gamma delta_in omega t psi zeta theta focus_ctx ident =
  print_func_entry "InversionR" t ident;

  let tm =
    match t with
    | TyFunc (((name, argList), tRet), _) ->
        (* let rec_func =
          match tRet with
          | TySession (TyRec _) | TySession (TyLinearToShared _) ->
              [ (name, t) ]
          | _ -> []
        in *)
        let argListCounted = List.map (fun (id, ty) -> ((id, ty), 0)) argList in
        inversionR
          ([ ((name, t), 0) ] @ argListCounted @ gamma)
          delta_in omega tRet psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e) ->
        return
          ( (delta_out, theta_out),
            Func ((name, argList), (rev_resolve_type tRet, e)) )
    | TySchemeFunc (tList, (((name, argList), tRet), funcs)) -> (
        let _tList =
          List.map
            (function
              | TyAtomic a -> (TyAtomic a, TyAtomic (fresh_atomic_id a ()))
              | _ -> failwith "Scheme parameters must be atomic")
            tList
        in
        let _argList =
          List.map (fun (id, ty) -> (id, apply_all_subst ty _tList)) argList
        in
        let _tRet = apply_all_subst tRet _tList in
        inversionR gamma delta_in omega
          (TyFunc (((name, _argList), _tRet), funcs))
          psi zeta theta focus_ctx ident
        >>= fun ((delta_out, theta_out), e) ->
        match e with
        | Func ((_, _), (_, e1)) ->
            return
              ( (delta_out, theta_out),
                SchemeFunc (tList, ((name, argList), (tRet, e1))) )
        | _ -> raise Fail)
    | TyUnitRetFunc ((name, argList), _) ->
        let argListCounted = List.map (fun (id, ty) -> ((id, ty), 0)) argList in
        inversionR (argListCounted @ gamma) delta_in [] TyEnd psi zeta theta
          focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e) ->
        return
          ((delta_out, theta_out), UnitRetFunc ((name, argList), RunSession e))
        (* ( of_list delta_in >>= fun (_, ty) ->
            try
              let _, delta_in' = searchAndRemoveFuncType ty delta_in in
              match ty with
              | TyFunc
                  ( ( (name, argList),
                      TySession (TyReceiveChannel (tChan, TyEnd)) ),
                    _ ) ->
                  let ((name2, argList2), _), delta_in'' =
                    searchAndRemoveFuncType tChan delta_in'
                  in
                  inversionR gamma delta_in'' omega
                    (TyApp (name, List.map snd argList))
                    psi zeta theta ident
                  >>= fun ((delta_out, theta_out), e1) ->
                  inversionR gamma delta_out omega
                    (TyApp (name2, List.map snd argList2))
                    psi zeta theta_out ident
                  >>= fun ((delta_out2, theta_out2), e2) ->
                  return
                    ( (delta_out2, theta_out2),
                      UnitRetFunc
                        ((name, argList), RunSession (ApplyChannel (e1, e2))) )
              | TyFunc _ -> Choice.fail
              | _ -> Choice.fail
            with Fail -> Choice.fail ) *)
    | TyApp ty ->
        let name, tyArgList =
          match ty with
          | TyFunc (((name, argList), _), _)
          | TySchemeFunc (_, (((name, argList), _), _)) ->
              (name, argList)
          | _ -> raise Fail
        in
        let tyArgList = List.map (fun (_, t1) -> t1) tyArgList in
        let rec synth_args delta theta = function
          | [] -> return ((delta, theta), [])
          | t :: rest ->
              let res =
                try
                  let id, delta_out = searchAndRemove t delta in
                  return ((delta_out, theta), Var id)
                with Fail ->
                  inversionR gamma delta omega t psi zeta theta focus_ctx
                    (ident + 1)
              in
              res >>= fun ((delta', theta'), arg_tm) ->
              synth_args delta' theta' rest
              >>= fun ((delta'', theta''), arg_tms) ->
              return ((delta'', theta''), arg_tm :: arg_tms)
        in
        synth_args delta_in theta tyArgList
        >>= fun ((delta_after_args, theta_out), arg_tm_list) ->
        return ((delta_after_args, theta_out), App (Var name, arg_tm_list))
    | TySession t ->
        inversionR gamma delta_in omega t psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e) ->
        if delta_out <> [] then (
          print_fail "InversionR" ident;
          Choice.fail)
        else return ((delta_out, theta_out), e)
    | TyReceiveChannel (tChan, tCont) ->
        let x = fresh_channel_id () in
        inversionR gamma delta_in ((x, tChan) :: omega) tCont psi zeta theta
          focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e1) ->
        return ((delta_out, theta_out), ReceiveChannel (x, e1))
    | TyReceiveValue (tau, tCont) ->
        let x = fresh_val_id () in
        inversionR
          (((x, tau), 0) :: gamma)
          delta_in omega tCont psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e1) ->
        return ((delta_out, theta_out), ReceiveValue (x, e1))
    | TyExternalChoice c -> (
        let l = choice_to_list c in
        let branches =
          List.map
            (fun (label, t) ->
              inversionR gamma delta_in omega t psi zeta theta focus_ctx
                (ident + 1)
              >>= fun res -> Choice.return (label, res))
            l
        in
        sequence branches >>= fun branches ->
        let out_ctxts =
          List.map
            (fun (_, ((delta_out, theta_out), _)) -> (delta_out, theta_out))
            branches
        in
        if not (all_equal out_ctxts) then (
          print_fail "InversionR" ident;
          Choice.fail)
        else
          match out_ctxts with
          | [] ->
              print_fail "InversionR" ident;
              Choice.fail
          | (delta_out, theta_out) :: _ ->
              let choices =
                List.map (fun (label, (_, tm)) -> (label, tm)) branches
              in
              Choice.return ((delta_out, theta_out), OfferChoice choices))
    | _ -> inversionL gamma delta_in omega t psi zeta theta focus_ctx (ident + 1)
  in
  tm

and sequence lst =
  match lst with
  | [] -> Choice.return []
  | x :: xs ->
      x >>= fun v ->
      sequence xs >>= fun vs -> Choice.return (v :: vs)

and inversionL gamma delta_in omega t psi zeta theta focus_ctx ident =
  match omega with
  | [] ->
      print_func_entry_withgoal "inversionL" (TyPrimitive "Empty") ident t;
      print_ctxts_with_ident gamma delta_in ident;
      let tm =
        decideFocus gamma delta_in t psi zeta theta focus_ctx (ident + 1)
      in
      tm
  | (x, ty) :: xs ->
      print_func_entry_withgoal "inversionL" ty ident t;
      let tm =
        match ty with
        | TyPrimitive _ ->
            inversionL gamma ((x, ty) :: delta_in) xs t psi zeta theta focus_ctx
              (ident + 1)
        | TySendChannel (tyChan, tyCont) ->
            let binder = fresh_binder_id () in
            inversionL gamma delta_in
              ((x, tyCont) :: (binder, tyChan) :: xs)
              t psi zeta theta focus_ctx (ident + 1)
            >>= fun ((delta_out, theta_out), e1) ->
            return ((delta_out, theta_out), ReceiveChannelFrom (x, (binder, e1)))
        | TySendValue (tau, tyCont) ->
            print_ctxts_with_ident gamma delta_in ident;
            let binder = fresh_binder_id () in
            inversionL
              (((binder, tau), 0) :: gamma)
              delta_in ((x, tyCont) :: xs) t psi zeta theta focus_ctx (ident + 1)
            >>= fun ((delta_out, theta_out), e1) ->
            return ((delta_out, theta_out), ReceiveValueFrom ((x, binder), e1))
        | TyInternalChoice c -> (
            let l = choice_to_list c in
            let branches =
              List.map
                (fun (label, t1) ->
                  inversionL gamma delta_in ((x, t1) :: xs) t psi zeta theta
                    focus_ctx (ident + 1)
                  >>= fun res -> Choice.return (label, res))
                l
            in
            sequence branches >>= fun branches ->
            let out_ctxts =
              List.map
                (fun (_, ((delta_out, theta_out), _)) -> (delta_out, theta_out))
                branches
            in
            if not (all_equal out_ctxts) then (
              print_fail "InversionL" ident;
              Choice.fail)
            else
              match out_ctxts with
              | [] ->
                  print_fail "InversionL" ident;
                  Choice.fail
              | (delta_out, theta_out) :: _ ->
                  return
                    ( (delta_out, theta_out),
                      Case
                        ( x,
                          List.map
                            (fun (label, (_, tm)) -> (label, tm))
                            branches ) ))
        | TyEnd ->
            inversionL gamma delta_in xs t psi zeta theta focus_ctx (ident + 1)
            >>= fun ((delta_out, theta_out), e1) ->
            return ((delta_out, theta_out), Wait (x, e1))
        | TyZ _ -> Choice.fail (* If a TyZ has't been unfolded it should fail *)
        | _ ->
            inversionL gamma ((x, ty) :: delta_in) xs t psi zeta theta focus_ctx
              (ident + 1)
      in
      tm

and all_equal ctxts =
  match ctxts with
  | [] -> true
  | ctxt1 :: xs -> List.for_all (fun ctxt2 -> ctxt2 = ctxt1) xs

and decideFocus gamma delta_in t psi zeta theta focus_ctx ident =
  print_func_entry "decideFocus" t ident;
  print_ctxts_with_ident gamma delta_in ident;

  let append a b = Choice.of_list (Choice.to_list a @ Choice.to_list b) in

  let r =
    delay (fun () ->
        focusR gamma delta_in t psi zeta theta focus_ctx (ident + 1))
  in
  let l =
    delay (fun () ->
        focusL gamma delta_in t psi zeta theta focus_ctx (ident + 1))
  in
  let g =
    delay (fun () ->
        focusGamma gamma delta_in t psi zeta theta focus_ctx (ident + 1))
  in

  append (append l r) g

and focusing_candidate target ty =
  match target with
  | TyFunc (((_, _), TySession retType), _)
  | TySchemeFunc (_, (((_, _), TySession retType), _)) ->
      focusing_candidate_aux retType ty
  | _ -> focusing_candidate_aux target ty

and focusing_candidate_aux target ty =
  match ty with
  | TyInternalChoice c | TyExternalChoice c -> (
      equal_type target ty
      ||
      match c with
      | TyDefineChoice (_, l) ->
          List.exists (fun (_, t) -> focusing_candidate_aux target t) l
      | TyEither (t1, t2) ->
          focusing_candidate_aux target t1 || focusing_candidate_aux target t2)
  | TySendChannel (t1, _) -> equal_type target ty || equal_type target t1
  | TyReceiveChannel (_, t1) ->
      equal_type target ty || focusing_candidate_aux target t1
  | TySendValue (t1, _) -> equal_type target ty || equal_type target t1
  | TyReceiveValue (_, t1) ->
      equal_type target ty || focusing_candidate_aux target t1
  | TySharedToLinear (t1, _) | TyLinearToShared (t1, _) ->
      equal_type target t1 || focusing_candidate_aux target t1
  | TySession t1 | TyRec t1 ->
      equal_type target ty || focusing_candidate_aux target t1
  | TyApp t1 -> focusing_candidate_aux target t1
  | TyAtomic _ | TyPrimitive _ -> equal_type target ty
  | _ -> false

and can_add_focus_ctx focus_ctx t =
  match focus_ctx with
  | [] -> true
  | (_, ty) :: [] -> (
      match ty with TyReceiveChannel (t1, _) -> equal_type t1 t | _ -> false)
  | _ -> false

and focusGamma gamma delta_in t psi zeta theta focus_ctx ident =
  let filtered_gamma =
    let rec aux seen = function
      | [] -> []
      | ((id, ty), timesUsed) :: xs ->
          if
            timesUsed >= 2
            || List.exists (fun seenT -> equal_type seenT ty) seen
          then aux seen xs
          else ((id, ty), timesUsed) :: aux (ty :: seen) xs
    in
    aux [] gamma
  in
  let key = (t, filtered_gamma, delta_in) in
  let focus_options =
    match Table.find_opt cacheGamma key with
    | Some true -> of_list filtered_gamma
    | Some false ->
        print_fail "focusGamma" ident;
        of_list []
    | None ->
        Table.replace cacheGamma key false;
        of_list filtered_gamma
  in
  let r =
    delay (fun () ->
        of_list
          (run_n 2
             ( focus_options >>= fun ((id, ty), _) ->
               log "%s< focusGamma: %s\n" (String.make ident ' ')
                 (print_type ty);
               print_ctxts_with_ident filtered_gamma delta_in ident;
               if List.exists (fun (_, t1) -> equal_type ty t1) delta_in then (
                 print_fail "focusGamma: Already in delta" (ident + 1);
                 Choice.fail)
               else if not (can_add_focus_ctx focus_ctx ty) then Choice.fail
               else
                 let gamma' = incTimesUsedGamma id [] filtered_gamma in
                 let gamma'' =
                   match ty with
                   | TyFunc _ | TySchemeFunc _ | TyLinearToShared _
                   | TySharedToLinear _ ->
                       removeWithIdGamma id ty gamma'
                   | _ -> gamma'
                 in
                 inversionR gamma'' ((id, ty) :: delta_in) [] t psi zeta theta
                   ((id, ty) :: focus_ctx) (ident + 1) )))
  in
  if not (is_empty r) then (
    Table.replace cacheGamma key true;
    r)
  else r

and focusR gamma delta_in t psi zeta theta focus_ctx ident =
  print_func_entry "FocusR" t ident;

  let tm =
    match t with
    | TyInternalChoice c ->
        let l = choice_to_list c in
        let choices = of_list l in

        choices >>= fun (label, t1) ->
        focusR gamma delta_in t1 psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e) ->
        return ((delta_out, theta_out), Offer (label, e))
    | TySendChannel (t1, t2) -> (
        try
          let id, ctxt_out = searchAndRemove t1 delta_in in
          let focus_ctx' = searchAndRemoveFocusCtx focus_ctx id t1 in
          decideFocus gamma ctxt_out t2 psi zeta theta focus_ctx' (ident + 1)
          >>= fun ((delta_out, theta_out), e1) ->
          return ((delta_out, theta_out), SendChannelFrom (id, e1))
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)
    | TySendValue (tau, t2) ->
        decideFocus gamma delta_in tau psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out1, theta_out1), e1) ->
        inversionR gamma delta_out1 [] t2 psi zeta theta_out1 focus_ctx
          (ident + 1)
        >>= fun ((delta_out2, theta_out2), e2) ->
        return ((delta_out2, theta_out2), SendValue (e1, e2))
    | TyRec _ ->
        if List.mem t psi then
          try
            let (id, func_ty), delta_in' = searchAndRemoveFuncType t delta_in in
            let focus_ctx' = searchAndRemoveFocusCtx focus_ctx id func_ty in
            inversionR gamma delta_in' [] (TyApp func_ty) psi zeta theta
              focus_ctx' (ident + 1)
          with Fail -> Choice.fail
        else
          let unfolded_t = unfold t in
          inversionR gamma delta_in [] unfolded_t (t :: psi) zeta theta
            focus_ctx (ident + 1)
          >>= fun ((delta_out, theta_out), e) ->
          return ((delta_out, theta_out), Fix e)
    | TySharedToLinear (t1, counter) ->
        let t2 = unfoldShared t in
        let result =
          if counter = 0 then
            inversionR gamma delta_in [] t2 psi zeta theta focus_ctx (ident + 1)
          else
            try
              let (id, func_ty), delta_in' =
                searchAndRemoveFuncType t1 delta_in
              in
              let focus_ctx' = searchAndRemoveFocusCtx focus_ctx id func_ty in
              if delta_in' <> [] then (
                print_fail "focusR" ident;
                Choice.fail)
              else
                inversionR gamma delta_in' [] (TyApp func_ty) psi zeta theta
                  focus_ctx' (ident + 1)
            with Fail -> Choice.fail
        in
        result >>= fun (delta_out, e1) -> return (delta_out, Detach e1)
    | TyLinearToShared (t1, counter) ->
        let t2 = unfoldShared t in
        let result =
          if counter = 0 then
            inversionR gamma delta_in [] t2 psi zeta theta focus_ctx (ident + 1)
          else
            try
              let (id, func_ty), delta_in' =
                searchAndRemoveFuncType t1 delta_in
              in
              let focus_ctx' = searchAndRemoveFocusCtx focus_ctx id t1 in
              if delta_in' <> [] then (
                print_fail "focusR" ident;
                Choice.fail)
              else
                inversionR gamma delta_in' [] (TyApp func_ty) psi zeta theta
                  focus_ctx' (ident + 1)
            with Fail -> Choice.fail
        in
        result >>= fun (delta_out, e1) -> return (delta_out, Accept e1)
    | TyEnd ->
        if delta_in <> [] then (
          print_fail "focusR" ident;
          Choice.fail)
        else (
          log "%s success\n" (String.make ident ' ');
          return ((delta_in, theta), Terminate))
    | TyAtomic _ ->
        Choice.fail
        (*try
          let id, ctxt_out = searchAndRemove t delta_in in
          log "%s success\n" (String.make ident ' ');
          return ((ctxt_out, theta), Forward id)
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)*)
    | TyPrimitive _ ->
        (*(
        try
          let id, ctxt_out = searchAndRemove t delta_in in
          log "%s success\n" (String.make ident ' ');
          return ((ctxt_out, theta), Var id)
        with Fail ->
          print_fail "focusR" ident;
          Choice.fail)*)
        Choice.fail
    | TyExistential _ ->
        (*let options = of_list delta_in in
        options >>= fun (id, ty) ->
        let theta_out = unify (t, ty) theta in
        log "%s success\n" (String.make ident ' ');
        return ((delta_in, theta_out), Forward id)*)
        Choice.fail
    | _ -> inversionR gamma delta_in [] t psi zeta theta focus_ctx (ident + 1)
  in
  tm

and choice_to_list c =
  match c with
  | TyDefineChoice (_, l) -> l
  | TyEither (t1, t2) -> [ ("Left", t1); ("Right", t2) ]

and searchAndRemove t = function
  | [] -> raise Fail
  | (id, t1) :: xs ->
      if equal_type t1 t then (id, xs)
      else
        let id', rest = searchAndRemove t xs in
        (id', (id, t1) :: rest)

and search t = function
  | [] -> raise Fail
  | (id, t1) :: xs ->
      if equal_type t1 t then (id, (id, t1) :: xs)
      else
        let id', rest = search t xs in
        (id', (id, t1) :: rest)

and removeWithId id t = function
  | [] -> raise Fail
  | (id1, t1) :: xs ->
      if equal_type t1 t && id1 = id then xs
      else
        let rest = removeWithId id t xs in
        (id1, t1) :: rest

and removeWithIdGamma id t = function
  | [] -> raise Fail
  | ((id1, t1), count) :: xs ->
      if equal_type t1 t && id1 = id then xs
      else
        let rest = removeWithIdGamma id t xs in
        ((id1, t1), count) :: rest

and searchFuncType t = function
  | [] -> raise Fail
  | (_, TyFunc (((func_id, argList), retType), _)) :: rest ->
      if equal_type retType (TySession t) then ((func_id, argList), retType)
      else searchFuncType t rest
  | (_, TySchemeFunc (vars, (((name, argList), retType), _))) :: rest -> (
      let inst = fresh_instantiation vars in
      let retType = instantiateSubst inst retType in
      try
        let subst = unifyT [] retType (TySession t) in
        let argList =
          List.map
            (fun (id, ty) ->
              (id, apply_all_subst (instantiateSubst inst ty) subst))
            argList
        in
        ((name, argList), apply_all_subst retType subst)
      with CannotUnify ->
        print_endline "cannot unify";
        searchFuncType t rest)
  | _ :: rest -> searchFuncType t rest

and searchAndRemoveFuncType t delta_in =
  match delta_in with
  | [] -> raise Fail
  | ((id, TyFunc (((_, _), retType), _)) as x) :: rest ->
      if equal_type retType (TySession t) then ((id, snd x), rest)
      else
        let res, rest' = searchAndRemoveFuncType t rest in
        (res, x :: rest')
  | ((id, TySchemeFunc (vars, (((name, argList), retType), funcs))) as x)
    :: rest -> (
      let inst = fresh_instantiation vars in
      let retType = instantiateSubst inst retType in
      try
        let subst = unifyT [] retType (TySession t) in
        let argList =
          List.map
            (fun (argId, ty) ->
              (argId, apply_all_subst (instantiateSubst inst ty) subst))
            argList
        in
        let func_ty =
          TyFunc (((name, argList), apply_all_subst retType subst), funcs)
        in
        ((id, func_ty), rest)
      with CannotUnify ->
        let res, rest' = searchAndRemoveFuncType t rest in
        (res, x :: rest'))
  | x :: rest ->
      let res, rest' = searchAndRemoveFuncType t rest in
      (res, x :: rest')

and searchAndRemoveFocusCtx focus_ctx id t =
  match focus_ctx with
  | [] -> []
  | (id1, t1) :: xs ->
      if equal_type t1 t && id1 = id then xs
      else
        let res = searchAndRemoveFocusCtx xs id t in
        (id1, t1) :: res

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

and incTimesUsedGamma id acc = function
  | [] -> raise Fail
  | ((id1, t), timesUsed) :: rest ->
      if id1 = id then List.rev_append acc (((id1, t), timesUsed + 1) :: rest)
      else incTimesUsedGamma id (((id1, t), timesUsed) :: acc) rest

and swapIdZeta id_old id_new = function
  | [] -> []
  | (id, timesUsed) :: rest ->
      let id' = if id = id_old then id_new else id in
      (id', timesUsed) :: swapIdZeta id_old id_new rest

and focusL gamma delta_in t psi zeta theta focus_ctx ident =
  let filtered_delta =
    List.filter
      (fun (_, ty) ->
        match ty with
        | TySharedToLinear (_, timesUsed) | TyLinearToShared (_, timesUsed) ->
            timesUsed < 1
        | _ -> true)
      delta_in
  in
  let key = (t, gamma, filtered_delta) in
  let focus_options =
    match Table.find_opt cacheDelta key with
    | Some true -> of_list filtered_delta
    | Some false ->
        print_fail "focusL" ident;
        of_list []
    | None ->
        Table.replace cacheDelta key false;
        of_list filtered_delta
  in
  print_func_entry "focusL" t ident;
  print_ctxts_with_ident gamma filtered_delta ident;
  let r =
    delay (fun () ->
        of_list
          (run_n 2
             ( focus_options >>= fun (id, ty) ->
               let delta_in' = removeWithId id ty filtered_delta in
               focusL' gamma delta_in' id ty t psi zeta theta focus_ctx
                 (ident + 1) )))
  in
  if not (is_empty r) then (
    Table.replace cacheDelta key true;
    r)
  else r

and focusL' gamma delta_in id foc t psi zeta theta focus_ctx ident =
  print_func_entry "FocusL'" foc ident;

  let tm =
    match foc with
    | TyAtomic _ ->
        if equal_type foc t && delta_in = [] then (
          log "%s success\n" (String.make ident ' ');
          return ((delta_in, theta), Forward id))
        else (
          print_fail "focusL" ident;
          Choice.fail)
    | TyExistential _ -> (
        try
          let theta_out = unify (foc, t) theta in
          focusL' gamma delta_in id t t psi zeta theta_out focus_ctx ident
        with Fail -> Choice.fail)
    | TyPrimitive _ ->
        if equal_type foc t && delta_in = [] then (
          log "%s success\n" (String.make ident ' ');
          return ((delta_in, theta), Var id))
        else (
          print_fail "focusL" ident;
          Choice.fail)
    | TySession t1 ->
        let x1 = fresh_binder_id () in
        inversionR gamma delta_in
          [ (x1, t1) ]
          t psi zeta theta focus_ctx (ident + 1)
        >>= fun (delta_out, e) ->
        let cut_dirs = List.map (fun (_, _) -> R) delta_in in
        return (delta_out, Cut ([ L ] @ cut_dirs, Var id, (x1, e)))
    | TyFunc (((_, _), TySession tRet), _) ->
        if equal_type tRet t then
          inversionR gamma delta_in [] (TyApp foc) psi zeta theta focus_ctx
            (ident + 1)
        else if uses_typeR tRet t || uses_typeDelta tRet delta_in then
          inversionR gamma delta_in [] (TyApp foc) psi zeta theta focus_ctx
            (ident + 1)
          >>= fun ((delta', theta'), cutL) ->
          let cut_dirs =
            List.map
              (fun (id, ty) ->
                if
                  List.exists
                    (fun (id', ty') -> id = id' && equal_type ty ty')
                    delta'
                then R
                else L)
              delta_in
          in

          let x1 = fresh_binder_id () in

          inversionL gamma delta'
            [ (x1, tRet) ]
            t psi zeta theta' focus_ctx (ident + 1)
          >>= fun ((delta_out, theta_out), cutR) ->
          return ((delta_out, theta_out), Cut (cut_dirs, cutL, (x1, cutR)))
        else Choice.fail
    | TySchemeFunc _ ->
        focusL' gamma delta_in id (instantiate foc) t psi zeta theta focus_ctx
          ident
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
            theta focus_ctx (ident + 1)
          >>= fun ((delta_out, theta_out), e) ->
          return ((delta_out, theta_out), Unfix (id, e))
        else
          let unfolded_foc = unfold foc in

          let pruned_foc = prune_recursive_choices foc unfolded_foc in

          let did_prune = not (equal_type pruned_foc unfolded_foc) in

          let zeta_for_pruned =
            if did_prune then zeta else incTimesUsedZeta id [] zeta
          in

          let try_no_unfolding =
            focusL' gamma delta_in id pruned_foc t psi zeta_for_pruned theta
              focus_ctx (ident + 1)
          in

          if is_empty try_no_unfolding then
            focusL' gamma delta_in id unfolded_foc t psi
              (incTimesUsedZeta id [] zeta)
              theta focus_ctx (ident + 1)
            >>= fun ((delta_out, theta_out), e) ->
            return ((delta_out, theta_out), Unfix (id, e))
          else
            try_no_unfolding >>= fun ((delta_out, theta_out), e) ->
            return ((delta_out, theta_out), Unfix (id, e))
    | TyReceiveChannel (tChan, tCont) -> (
        try
          let id_chan, delta_in' = searchAndRemove tChan delta_in in
          let focus_ctx' = searchAndRemoveFocusCtx focus_ctx id_chan tChan in
          inversionL gamma delta_in'
            [ (id, tCont) ]
            t psi zeta theta focus_ctx' (ident + 1)
          >>= fun ((delta_out, theta_out), e1) ->
          return ((delta_out, theta_out), SendChannelTo ((id, id_chan), e1))
        with Fail -> Choice.fail)
    | TyExternalChoice c ->
        let l = choice_to_list c in
        print_ctxts_with_ident gamma delta_in ident;
        let branches = of_list l in
        branches >>= fun (label, ty) ->
        inversionR gamma delta_in
          [ (id, ty) ]
          t psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out, theta_out), e1) ->
        return ((delta_out, theta_out), Choose (id, (label, e1)))
    | TyReceiveValue (t1, t2) ->
        print_ctxts_with_ident gamma delta_in ident;
        decideFocus gamma delta_in t1 psi zeta theta focus_ctx (ident + 1)
        >>= fun ((delta_out1, theta_out1), e1) ->
        focusL' gamma delta_out1 id t2 t psi zeta theta_out1 focus_ctx
          (ident + 1)
        >>= fun ((delta_out2, theta_out2), e2) ->
        return ((delta_out2, theta_out2), SendValueTo ((id, e1), e2))
    | TySharedToLinear (_, counter) ->
        if counter > 1 then (
          print_fail "inversionL" ident;
          Choice.fail)
        else
          let t2 = unfoldShared foc in
          let x1 = fresh_channel_id () in
          if List.exists (fun ((_, ty), _) -> equal_type ty t2) gamma then
            Choice.fail
          else
            inversionR
              (((x1, t2), counter) :: gamma)
              delta_in [] t psi zeta theta focus_ctx (ident + 1)
            >>= fun ((delta_out, theta_out), e1) ->
            return ((delta_out, theta_out), Release (id, e1))
    | TyLinearToShared (_, counter) ->
        if counter > 1 then (
          print_fail "focusL" ident;
          Choice.fail)
        else
          let t2 = unfoldShared foc in
          let x1 = fresh_channel_id () in
          inversionR gamma delta_in
            [ (x1, t2) ]
            t psi zeta theta focus_ctx (ident + 1)
          >>= fun ((delta_out, theta_out), e1) ->
          return ((delta_out, theta_out), Acquire (id, (x1, e1)))
    | _ ->
        inversionL gamma delta_in
          [ (id, foc) ]
          t psi zeta theta focus_ctx (ident + 1)
  in
  tm

and print_zeta zeta =
  let elems = List.map (fun (id, n) -> Printf.sprintf "(%s, %d)" id n) zeta in
  log "[%s]\n" (String.concat "; " elems)

and print_psi psi =
  let elems = List.map (fun t -> Printf.sprintf "(%s)" (print_type t)) psi in
  log "[%s]\n" (String.concat "; " elems)
