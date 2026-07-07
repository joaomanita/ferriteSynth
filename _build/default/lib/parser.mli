
(* The type of tokens. *)

type token = 
  | Z
  | USE
  | TYPE_KEYWORD
  | SYNTHESIZE
  | SHAREDTOLINEAR
  | SESSION
  | SENDVALUE
  | SENDCHANNEL
  | SEMICOLON
  | S
  | RSQUARE
  | RPAR
  | RELEASE
  | RECEIVEVALUE
  | RECEIVECHANNEL
  | REC
  | RBRACE
  | RAW of (string)
  | MINUS
  | LT
  | LSQUARE
  | LPAR
  | LINEARTOSHARED
  | LBRACE
  | INTERNALCHOICE
  | ID of (string)
  | GT
  | FUNC
  | EXTERNALCHOICE
  | EXCLAMATION
  | EQ
  | EOF
  | END
  | EITHER
  | DEFINE_CHOICE
  | COMMA
  | COLON
  | ATOMIC of (string)
  | AT
  | ACQUIRE

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
    | T_Z : unit terminal
    | T_USE : unit terminal
    | T_TYPE_KEYWORD : unit terminal
    | T_SYNTHESIZE : unit terminal
    | T_SHAREDTOLINEAR : unit terminal
    | T_SESSION : unit terminal
    | T_SENDVALUE : unit terminal
    | T_SENDCHANNEL : unit terminal
    | T_SEMICOLON : unit terminal
    | T_S : unit terminal
    | T_RSQUARE : unit terminal
    | T_RPAR : unit terminal
    | T_RELEASE : unit terminal
    | T_RECEIVEVALUE : unit terminal
    | T_RECEIVECHANNEL : unit terminal
    | T_REC : unit terminal
    | T_RBRACE : unit terminal
    | T_RAW : (string) terminal
    | T_MINUS : unit terminal
    | T_LT : unit terminal
    | T_LSQUARE : unit terminal
    | T_LPAR : unit terminal
    | T_LINEARTOSHARED : unit terminal
    | T_LBRACE : unit terminal
    | T_INTERNALCHOICE : unit terminal
    | T_ID : (string) terminal
    | T_GT : unit terminal
    | T_FUNC : unit terminal
    | T_EXTERNALCHOICE : unit terminal
    | T_EXCLAMATION : unit terminal
    | T_EQ : unit terminal
    | T_EOF : unit terminal
    | T_END : unit terminal
    | T_EITHER : unit terminal
    | T_DEFINE_CHOICE : unit terminal
    | T_COMMA : unit terminal
    | T_COLON : unit terminal
    | T_ATOMIC : (string) terminal
    | T_AT : unit terminal
    | T_ACQUIRE : unit terminal
  
  (* The indexed type of nonterminal symbols. *)
  
  type _ nonterminal = 
    | N_z_type : (int) nonterminal
    | N_used_funcs : (string list) nonterminal
    | N_unit_ret_func : (Mini_ast.decl) nonterminal
    | N_type_def : (Mini_ast.decl) nonterminal
    | N_separated_nonempty_list_COMMA_choice_branch_ : ((string * Mini_ast.ty) list) nonterminal
    | N_separated_nonempty_list_COMMA_arg_ : ((string * Mini_ast.ty) list) nonterminal
    | N_separated_nonempty_list_COMMA_ID_ : (string list) nonterminal
    | N_separated_nonempty_list_COMMA_ATOMIC_ : (string list) nonterminal
    | N_scheme_func : (Mini_ast.decl) nonterminal
    | N_scheme_args : (Mini_ast.ty list) nonterminal
    | N_s_type : (Mini_ast.ty) nonterminal
    | N_prog : (Mini_ast.decl list) nonterminal
    | N_loption_separated_nonempty_list_COMMA_arg__ : ((string * Mini_ast.ty) list) nonterminal
    | N_list_decl_ : (Mini_ast.decl list) nonterminal
    | N_list_RAW_ : (string list) nonterminal
    | N_func : (Mini_ast.decl) nonterminal
    | N_define_choice : (Mini_ast.choice) nonterminal
    | N_decl : (Mini_ast.decl) nonterminal
    | N_closed_func : (Mini_ast.decl) nonterminal
    | N_choice_branch : (string * Mini_ast.ty) nonterminal
    | N_choice : (Mini_ast.choice) nonterminal
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
