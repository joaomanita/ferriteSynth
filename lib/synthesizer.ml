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

type index =
  | Z
  | S of index

type lens = index
type prism = index

let rec print_type t = 
  match t with
  | Value a -> a
  | TyPrimitive t -> print_type t
  | TyInternalChoice 
