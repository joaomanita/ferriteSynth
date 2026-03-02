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
  | Case of id * (label * tm) list
  | OfferChoice of (label * tm) list
  | Choose of (id * label) * tm
  | SendChannelFrom of tm * tm
  | ReceiveChannelFrom of id * tm
  | ReceiveChannel of tm
  | SendChannelTo of (id * tm) * tm
  | SendValue of tm * tm
  | SendValueTo of (id * tm) * tm
  | ReceiveValueFrom of id * tm
  | ReceiveValue of tm
  | Terminate
  | Wait of id * tm
  | Detach of tm
  | Release of id * tm
  | Accept of tm
  | Accquire of id * tm

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
  | TySendChannel (t1, t2) ->
      "SendChannel<" ^ print_type t1 ^ print_type t2 ^ ">"
  | TyReceiveChannel (t1, t2) ->
      "ReceiveChannel<" ^ print_type t1 ^ print_type t2 ^ ">"
  | TySendValue (t1, t2) -> "SendValue<" ^ t1 ^ print_type t2 ^ ">"
  | TyReceiveValue (t1, t2) -> "ReceiveValue<" ^ t1 ^ print_type t2 ^ ">"
  | TyEnd -> "End"
  | TySharedToLinear t -> "SharedToLinear<" ^ print_type t ^ ">"
  | TyLinearToShared t -> "LinearToShared<" ^ print_type t ^ ">"

open Printf

let rec print_exp e =
  match e with
  | Var a -> a
  | Offer (label, tm) -> sprintf "offer_case!(%s, %s)" label (print_exp tm)
  | Case (chan, choices) ->
      sprintf "case!{ %s ; %s }" chan (print_labeled_choices choices)
  | OfferChoice choices ->
      sprintf "offer_choice!{ %s }" (print_labeled_choices choices)
  | Choose ((chan, label), tm) ->
      sprintf "choose!(%s, %s, %s)" chan label (print_exp tm)
  | SendChannelFrom (chan_exp, tm) ->
      sprintf "send_channel_from(%s, %s)" (print_exp chan_exp) (print_exp tm)
  | ReceiveChannelFrom (chan, tm) ->
      sprintf "receive_channel_from(%s, %s)" chan (print_exp tm)
  | ReceiveChannel tm -> sprintf "receive_channel(%s)" (print_exp tm)
  | SendChannelTo ((chan, chan_exp), tm) ->
      sprintf "send_channel_to(%s, %s, %s)" chan (print_exp chan_exp)
        (print_exp tm)
  | SendValue (v, tm) ->
      sprintf "send_value(%s, %s)" (print_exp v) (print_exp tm)
  | SendValueTo ((chan, v), tm) ->
      sprintf "send_value_to(%s, %s, %s)" chan (print_exp v) (print_exp tm)
  | ReceiveValueFrom (chan, tm) ->
      sprintf "receive_value_from(%s, %s)" chan (print_exp tm)
  | ReceiveValue tm -> sprintf "receive_value(%s)" (print_exp tm)
  | Terminate -> "terminate ()"
  | Wait (chan, tm) -> sprintf "wait(%s, %s)" chan (print_exp tm)
  | Detach tm -> sprintf "detach_shared_session(%s)" (print_exp tm)
  | Release (chan, tm) ->
      sprintf "release_shared_session(%s, %s)" chan (print_exp tm)
  | Accept tm -> sprintf "accept_shared_session(%s)" (print_exp tm)
  | Accquire (chan, tm) ->
      sprintf "acquire_shared_session(%s, %s)" chan (print_exp tm)

and print_labeled_choices l =
  match l with
  | [] -> ""
  | (label, tm) :: t ->
      label ^ " => " ^ print_exp tm ^ " " ^ print_labeled_choices t
