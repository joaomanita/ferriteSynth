{
open Lexing
open Parser

exception SyntaxError of string
}

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule read =
  parse
  | white               { read lexbuf }
  | newline             { new_line lexbuf; read lexbuf }
  | '<'                 { LT }
  | '>'                 { GT }
  | '('                 { LPAR }
  | ')'                 { RPAR }
  | ':'                 { COLON }
  | '='                 { EQ }
  | '-'                 { MINUS }
  | ','                 { COMMA }
  | "type"              { TYPE_KEYWORD }
  | "InternalChoice"    { INTERNALCHOICE }
  | "ExternalChoice"    { EXTERNALCHOICE }
  | "SendChannel"       { SENDCHANNEL }
  | "ReceiveChannel"    { RECEIVECHANNEL }
  | "SendValue"         { SENDVALUE }
  | "ReceiveValue"      { RECEIVEVALUE }
  | "SharedToLinear"    { SHAREDTOLINEAR }
  | "LinearToShared"    { LINEARTOSHARED }
  | "End"               { END }
  | "fn"                { FUNC }
  | id                  { ID (Lexing.lexeme lexbuf) }
  | eof                 { EOF }
  | _                   { read lexbuf } (* Other rust tokens are skipped *)
