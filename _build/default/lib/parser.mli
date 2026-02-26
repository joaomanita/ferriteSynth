
(* The type of tokens. *)

type token = 
  | TYPE_KEYWORD
  | SHAREDTOLINEAR
  | SENDVALUE
  | SENDCHANNEL
  | RPAR
  | RECEIVEVALUE
  | RECEIVECHANNEL
  | MINUS
  | LT
  | LPAR
  | LINEARTOSHARED
  | INTERNALCHOICE
  | ID of (string)
  | GT
  | FUNC
  | EXTERNALCHOICE
  | EQ
  | EOF
  | END
  | COMMA
  | COLON

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Mini_ast.decl list)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
  (* The indexed type of terminal symbols. *)
  
  type _ terminal = 
    | T_error : unit terminal
    | T_TYPE_KEYWORD : unit terminal
    | T_SHAREDTOLINEAR : unit terminal
    | T_SENDVALUE : unit terminal
    | T_SENDCHANNEL : unit terminal
    | T_RPAR : unit terminal
    | T_RECEIVEVALUE : unit terminal
    | T_RECEIVECHANNEL : unit terminal
    | T_MINUS : unit terminal
    | T_LT : unit terminal
    | T_LPAR : unit terminal
    | T_LINEARTOSHARED : unit terminal
    | T_INTERNALCHOICE : unit terminal
    | T_ID : (string) terminal
    | T_GT : unit terminal
    | T_FUNC : unit terminal
    | T_EXTERNALCHOICE : unit terminal
    | T_EQ : unit terminal
    | T_EOF : unit terminal
    | T_END : unit terminal
    | T_COMMA : unit terminal
    | T_COLON : unit terminal
  
  (* The indexed type of nonterminal symbols. *)
  
  type _ nonterminal = 
    | N_type_defs : (Mini_ast.decl list) nonterminal
    | N_type_def : (Mini_ast.type_def) nonterminal
    | N_separated_nonempty_list_COMMA_arg_ : ((string * Mini_ast.ty) list) nonterminal
    | N_s_type : (Mini_ast.ty) nonterminal
    | N_prog : (Mini_ast.decl list) nonterminal
    | N_opt_type_defs : (Mini_ast.decl list) nonterminal
    | N_loption_separated_nonempty_list_COMMA_arg__ : ((string * Mini_ast.ty) list) nonterminal
    | N_labeled_type : (string * Mini_ast.ty) nonterminal
    | N_funcs : (Mini_ast.decl list) nonterminal
    | N_func : (Mini_ast.decl) nonterminal
    | N_choice_list : (Mini_ast.hlist) nonterminal
    | N_arg_type : (Mini_ast.ty) nonterminal
    | N_arg : (string * Mini_ast.ty) nonterminal
  
  (* The inspection API. *)
  
  include MenhirLib.IncrementalEngine.INSPECTION
    with type 'a lr1state := 'a lr1state
    with type production := production
    with type 'a terminal := 'a terminal
    with type 'a nonterminal := 'a nonterminal
    with type 'a env := 'a env
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val prog: Lexing.position -> (Mini_ast.decl list) MenhirInterpreter.checkpoint
  
end
