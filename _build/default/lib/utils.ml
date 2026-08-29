open Mini_ast
open Printf

exception Fail

let debug_enabled = true
let debug_out = if debug_enabled then Some (open_out "debug.log") else None

let log fmt =
  match debug_out with
  | Some ch -> Printf.fprintf ch fmt
  | None -> Printf.ifprintf stdout fmt

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

let fresh_atomic_id id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    id ^ "_" ^ string_of_int !unique

let fresh_existential_id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    string_of_int !unique

let rec print_labeled_choices l print_func =
  match l with
  | [] -> ""
  | (label, tx) :: [] -> label ^ ": " ^ print_func tx
  | (label, tx) :: xs ->
      label ^ ": " ^ print_func tx ^ ", " ^ print_labeled_choices xs print_func

let rec print_choice c =
  match c with
  (*| TyDefineChoice (name, options) ->
      let opts =
        options
        |> List.map (fun (lbl, ty) -> lbl ^ ": " ^ print_type ty)
        |> String.concat ", "
      in
      name ^ "{" ^ opts ^ "}" *)
  | TyDefineChoice (name, _) -> name
  | TyEither (t1, t2) -> "Either<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"

and print_type t =
  match t with
  | TyPrimitive t -> t
  | TyAtomic a -> a
  | TyExistential a -> "?" ^ a
  | TyInternalChoice c -> "InternalChoice<" ^ print_choice c ^ ">"
  | TyExternalChoice c -> "ExternalChoice<" ^ print_choice c ^ ">"
  | TyInternalChoiceId _ -> "TyInternalChoiceId"
  | TyExternalChoiceId _ -> "TyExternalChoiceId"
  | TySendChannel (t1, t2) ->
      "SendChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveChannel (t1, t2) ->
      "ReceiveChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TySendValue (t1, t2) ->
      "SendValue<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveValue (t1, t2) ->
      "ReceiveValue<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyEnd -> "End"
  | TySharedToLinear (t, _) -> "SharedToLinear<" ^ print_type t ^ ">"
  | TyLinearToShared (t, _) -> "LinearToShared<" ^ print_type t ^ ">"
  | TyFixShared -> "Release"
  | TySession t -> "Session<" ^ print_type t ^ ">"
  | TyFunc (((name, tyArgs), tyRet), _) ->
      "FN<<" ^ name ^ ", "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"
  | TyApp func_ty -> "App<" ^ print_type func_ty ^ ">"
  | TyRec t -> "Rec<" ^ print_type t ^ ">"
  | TyZ i -> print_peano i
  | TyUnitRetFunc ((name, argList), _) ->
      "FN<<" ^ name ^ ", " ^ print_labeled_choices argList print_type ^ ">, >"
  | TyScheme (tList, tau) ->
      "Scheme<<"
      ^ String.concat ", " (List.map print_type tList)
      ^ ">, " ^ print_type tau ^ ">"
  | TySchemeFunc (tList, (((name, tyArgs), tyRet), _)) ->
      "SCHEMEFN<<" ^ name ^ "<"
      ^ String.concat ", " (List.map print_type tList)
      ^ ">, "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"

and print_type_internal t =
  match t with
  | TyPrimitive t -> t
  | TyAtomic a -> a
  | TyExistential a -> "?" ^ a
  | TyInternalChoice c -> "TyInternalChoice<" ^ print_choice c ^ ">"
  | TyExternalChoice c -> "TyExternalChoice<" ^ print_choice c ^ ">"
  | TyInternalChoiceId _ -> "TyInternalChoiceId"
  | TyExternalChoiceId _ -> "TyExternalChoiceId"
  | TySendChannel (t1, t2) ->
      "SendChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveChannel (t1, t2) ->
      "ReceiveChannel<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TySendValue (t1, t2) ->
      "SendValue<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyReceiveValue (t1, t2) ->
      "ReceiveValue<" ^ print_type t1 ^ ", " ^ print_type t2 ^ ">"
  | TyEnd -> "End"
  | TySharedToLinear (t, _) -> "SharedToLinear<" ^ print_type t ^ ">"
  | TyLinearToShared (t, _) -> "LinearToShared<" ^ print_type t ^ ">"
  | TyFixShared -> "FixShared"
  | TySession t -> "Session<" ^ print_type t ^ ">"
  | TyFunc (((name, tyArgs), tyRet), _) ->
      "FN<<" ^ name ^ ", "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"
  | TyApp func_ty -> "App<" ^ print_type func_ty ^ ">"
  | TyRec t -> "Rec<" ^ print_type t ^ ">"
  | TyZ i -> print_peano i
  | TyUnitRetFunc ((name, argList), _) ->
      "FN<<" ^ name ^ ", " ^ print_labeled_choices argList print_type ^ ">, >"
  | TyScheme (tList, tau) ->
      "Scheme<<"
      ^ String.concat ", " (List.map print_type tList)
      ^ ">, " ^ print_type tau ^ ">"
  | TySchemeFunc (tList, (((name, tyArgs), tyRet), _)) ->
      "SCHEMEFN<<" ^ name ^ "<"
      ^ String.concat ", " (List.map print_type tList)
      ^ ">, "
      ^ print_labeled_choices tyArgs print_type
      ^ ">, " ^ print_type tyRet ^ ">"

and print_peano i =
  match i with 0 -> "Z" | x -> "S<" ^ print_peano (x - 1) ^ ">"

and equal_type t1 t2 =
  match (t1, t2) with
  | TyPrimitive p1, TyPrimitive p2 -> p1 = p2
  | TyAtomic a1, TyAtomic a2 -> a1 = a2
  | TyExistential a1, TyExistential a2 -> a1 = a2
  | TyExistential _, _ -> true
  | _, TyExistential _ -> true
  | TyInternalChoice c1, TyInternalChoice c2 -> equal_choice c1 c2
  | TyExternalChoice c1, TyExternalChoice c2 -> equal_choice c1 c2
  | TyInternalChoiceId id1, TyInternalChoiceId id2 -> id1 = id2
  | TyExternalChoiceId id1, TyExternalChoiceId id2 -> id1 = id2
  | TySendChannel (a1, b1), TySendChannel (a2, b2)
  | TyReceiveChannel (a1, b1), TyReceiveChannel (a2, b2)
  | TySendValue (a1, b1), TySendValue (a2, b2)
  | TyReceiveValue (a1, b1), TyReceiveValue (a2, b2) ->
      equal_type a1 a2 && equal_type b1 b2
  | TyEnd, TyEnd -> true
  (* Ignore the counters *)
  | TySharedToLinear (t1, _), TySharedToLinear (t2, _)
  | TyLinearToShared (t1, _), TyLinearToShared (t2, _) ->
      equal_type t1 t2
  | TyFixShared, TyFixShared -> true
  | TySession t1, TySession t2 -> equal_type t1 t2
  | TyFunc (((name1, args1), ret1), _), TyFunc (((name2, args2), ret2), _) ->
      name1 = name2 && equal_labeled_types args1 args2 && equal_type ret1 ret2
  | TyUnitRetFunc ((name1, args1), _), TyUnitRetFunc ((name2, args2), _) ->
      name1 = name2 && equal_labeled_types args1 args2
  | TyApp f1, TyApp f2 -> equal_type f1 f2
  | TyRec t1, TyRec t2 -> equal_type t1 t2
  | TyZ n1, TyZ n2 -> n1 = n2
  | TyScheme (ts1, tau1), TyScheme (ts2, tau2) ->
      List.length ts1 = List.length ts2
      && List.for_all2 equal_type ts1 ts2
      && equal_type tau1 tau2
  | ( TySchemeFunc (ts1, (((name1, args1), ret1), _)),
      TySchemeFunc (ts2, (((name2, args2), ret2), _)) ) ->
      List.length ts1 = List.length ts2
      && List.for_all2 equal_type ts1 ts2
      && name1 = name2
      && equal_labeled_types args1 args2
      && equal_type ret1 ret2
  | _ -> false

and equal_labeled_types l1 l2 =
  List.length l1 = List.length l2
  && List.for_all2
       (fun (lbl1, ty1) (lbl2, ty2) -> lbl1 = lbl2 && equal_type ty1 ty2)
       l1 l2

and equal_choice c1 c2 =
  match (c1, c2) with
  | TyDefineChoice (label1, tys1), TyDefineChoice (label2, tys2) ->
      label1 = label2 && equal_labeled_types tys1 tys2
  | TyEither (l1, r1), TyEither (l2, r2) -> equal_type l1 l2 && equal_type r1 r2
  | _ -> false

let rec print_ctxt_delta ctxt =
  match ctxt with
  | [] -> ""
  | (id, t) :: xs ->
      sprintf "(%s, %s), %s" id (print_type t) (print_ctxt_delta xs)

let rec print_ctxt_gamma ctxt =
  match ctxt with
  | [] -> ""
  | ((id, t), timesUsed) :: xs ->
      sprintf "((%s, %s), %s), %s" id (print_type t) (string_of_int timesUsed)
        (print_ctxt_gamma xs)

and print_zeta zeta =
  let elems = List.map (fun (id, n) -> Printf.sprintf "(%s, %d)" id n) zeta in
  log "[%s]\n" (String.concat "; " elems)

and print_psi psi =
  let elems = List.map (fun t -> Printf.sprintf "(%s)" (print_type t)) psi in
  log "[%s]\n" (String.concat "; " elems)

and searchAndRemove t = function
  | [] -> raise Fail
  | (id, t1) :: xs ->
      if equal_type t1 t then (id, xs)
      else
        let id', rest = searchAndRemove t xs in
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

and searchAndRemoveFocusCtx focus_ctx id t =
  match focus_ctx with
  | [] -> []
  | (id1, t1) :: xs ->
      if equal_type t1 t && id1 = id then xs
      else
        let res = searchAndRemoveFocusCtx xs id t in
        (id1, t1) :: res

and incTimesUsedGamma id acc = function
  | [] -> raise Fail
  | ((id1, t), timesUsed) :: rest ->
      if id1 = id then List.rev_append acc (((id1, t), timesUsed + 1) :: rest)
      else incTimesUsedGamma id (((id1, t), timesUsed) :: acc) rest

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
