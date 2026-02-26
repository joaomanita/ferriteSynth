open Mini_ast

type id = string

let fresh_id =
  let unique = ref (-1) in
  fun () ->
    incr unique;
    "x_" ^ string_of_int !unique

(* For context see Table 2 of https://web.tecnico.ulisboa.pt/bernardo.toninho/papers/ecoop22-ferrite.pdf*)
type tm =
  | Var of id
  | Offer of label * tm
  | Case of tm * tm list
  | OfferChoice of tm list
  | Choose of (tm * label) * tm
  | SendChannelFrom of tm * tm
  | ReceiveChannelFrom of (tm * tm) * tm
  | ReceiveChannel of tm
  | SendChannelTo of (tm * tm) * tm
  | SendValue of tm * tm
  | SendValueTo of (tm * tm) * tm
  | ReceiveValueFrom of (tm * tm) * tm
  | ReceiveValue of tm
  | Terminate
  | Wait of tm * tm
  | Detach of tm
  | Release of tm * tm
  | Accept of tm
  | Accquire of tm * tm

type index = Z | S of index
type lens = index
type prism = index

let rec print_hlist l =
  match l with
  | HNil -> "()"
  | HCons (t, rest) ->
      "(" ^ fst t ^ ":" ^ print_type (snd t) ^ "," ^ print_hlist rest ^ ")"

and print_type t =
  match t with
  | TyPrimitive t -> t
  | TyInternalChoice l -> "InternalChoice<" ^ print_hlist l ^ ">"
  | TyExternalChoice l -> "ExternalChoice<" ^ print_hlist l ^ ">"
  | TySendChannel t ->
      "SendChannel<" ^ print_type (fst t) ^ print_type (snd t) ^ ">"
  | TyReceiveChannel t ->
      "ReceiveChannel<" ^ print_type (fst t) ^ print_type (snd t) ^ ">"
  | TySendValue t -> "SendValue<" ^ fst t ^ print_type (snd t) ^ ">"
  | TyReceiveValue t -> "ReceiveValue<" ^ fst t ^ print_type (snd t) ^ ">"
  | TyEnd -> "End"
  | TySharedToLinear t -> "SharedToLinear<" ^ print_type t ^ ">"
  | TyLinearToShared t -> "LinearToShared<" ^ print_type t ^ ">"
