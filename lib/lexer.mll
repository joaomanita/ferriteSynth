{
open Lexing
open Parser

exception SyntaxError of string

type mode =
  | Raw
  | TypeMode
  | Func

let current_mode = ref Raw
}

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let id = ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']*
let uppercaseid = ['A'-'Z']+

rule read = parse
  | white   { match !current_mode with | Raw -> RAW (Lexing.lexeme lexbuf) | _ -> read lexbuf }
  | newline { new_line lexbuf; match !current_mode with | Raw -> RAW (Lexing.lexeme lexbuf) | _ -> read lexbuf }

  (* ---- MODE SWITCH ---- *)
  | "type" {
      current_mode := TypeMode;
      TYPE_KEYWORD
    }

  | "fn" {
      current_mode := Func;
      FUNC
    }

  (* ---- SEMICOLON ---- *)
  | ';' {
      (match !current_mode with
       | TypeMode -> current_mode := Raw; SEMICOLON
       | Func -> SEMICOLON
       | Raw -> RAW ";");
    }

  (* ---- BRACES ---- *)
  | '{' {
      (match !current_mode with
       | Raw -> RAW "{"
       | _ -> LBRACE);
    }

  | '}' {
    match !current_mode with
    | Raw ->
        RAW "}"

    | Func ->
        current_mode := Raw;
        RBRACE

    | _ ->
        RBRACE
  }

  (* ---- STRUCTURED TOKENS ---- *)
  | '<'   { match !current_mode with | Raw -> RAW "<" | _ -> LT }
  | '>'   { match !current_mode with | Raw -> RAW ">" | _ -> GT }
  | '('   { match !current_mode with | Raw -> RAW "(" | _ -> LPAR }
  | ')'   { match !current_mode with | Raw -> RAW ")" | _ -> RPAR }
  | ':'   { match !current_mode with | Raw -> RAW ":" | _ -> COLON }
  | '='   { match !current_mode with | Raw -> RAW "=" | _ -> EQ }
  | ','   { match !current_mode with | Raw -> RAW "," | _ -> COMMA }
  | '-'   { match !current_mode with | Raw -> RAW "-" | _ -> MINUS }
  | '@'   { match !current_mode with | Raw -> RAW "@" | _ -> AT }
  | '['   { match !current_mode with | Raw -> RAW "[" | _ -> LSQUARE }
  | ']'   { match !current_mode with | Raw -> RAW "]" | _ -> RSQUARE }
  | "use" { match !current_mode with | Raw -> RAW "use" | _ -> USE }

  (* ---- KEYWORDS ---- *)
  | "Session"        { SESSION }
  | "InternalChoice" { INTERNALCHOICE }
  | "ExternalChoice" { EXTERNALCHOICE }
  | "SendChannel"    { SENDCHANNEL }
  | "ReceiveChannel" { RECEIVECHANNEL }
  | "SendValue"      { SENDVALUE }
  | "ReceiveValue"   { RECEIVEVALUE }
  | "SharedToLinear" { SHAREDTOLINEAR }
  | "LinearToShared" { LINEARTOSHARED }
  | "Release"        { RELEASE }
  | "Acquire"        { ACQUIRE}
  | "End"            { END }
  | "Rec"            { REC }
  | "Z"              { Z }
  | "S"              { S }
  | "SYNTHESIZE"     { SYNTHESIZE }

  (* ---- IDENTIFIERS ---- *)
  | uppercaseid as id_s {
      match !current_mode with
      | Raw -> RAW id_s
      | _   -> ATOMIC id_s
    }

  | id as id_s {
      match !current_mode with
      | Raw -> RAW id_s
      | _   -> ID id_s
    }

  (* ---- RAW FALLBACK ---- *)
  | _ as c {
      match !current_mode with
      | Raw -> RAW (String.make 1 c)
      | Func -> RAW (String.make 1 c)
      | _   -> raise (SyntaxError ("unknown character" ^ (String.make 1 c) ^ "in type mode"))   (* unknown chars in structured mode *)
    }

  | eof { EOF }
