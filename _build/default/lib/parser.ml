
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20250912

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Z
    | TYPE_KEYWORD
    | SHAREDTOLINEAR
    | SESSION
    | SENDVALUE
    | SENDCHANNEL
    | SEMICOLON
    | S
    | RPAR
    | RECEIVEVALUE
    | RECEIVECHANNEL
    | REC
    | RBRACE
    | RAW of (
# 5 "lib/parser.mly"
       (string)
# 33 "lib/parser.ml"
  )
    | MINUS
    | LT
    | LPAR
    | LINEARTOSHARED
    | LBRACE
    | INTERNALCHOICE
    | ID of (
# 6 "lib/parser.mly"
       (string)
# 44 "lib/parser.ml"
  )
    | GT
    | FUNC
    | EXTERNALCHOICE
    | EQ
    | EOF
    | END
    | COMMA
    | COLON
    | ATOMIC of (
# 7 "lib/parser.mly"
       (string)
# 57 "lib/parser.ml"
  )
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast

# 68 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ATOMIC _ ->
          30
      | COLON ->
          29
      | COMMA ->
          28
      | END ->
          27
      | EOF ->
          26
      | EQ ->
          25
      | EXTERNALCHOICE ->
          24
      | FUNC ->
          23
      | GT ->
          22
      | ID _ ->
          21
      | INTERNALCHOICE ->
          20
      | LBRACE ->
          19
      | LINEARTOSHARED ->
          18
      | LPAR ->
          17
      | LT ->
          16
      | MINUS ->
          15
      | RAW _ ->
          14
      | RBRACE ->
          13
      | REC ->
          12
      | RECEIVECHANNEL ->
          11
      | RECEIVEVALUE ->
          10
      | RPAR ->
          9
      | S ->
          8
      | SEMICOLON ->
          7
      | SENDCHANNEL ->
          6
      | SENDVALUE ->
          5
      | SESSION ->
          4
      | SHAREDTOLINEAR ->
          3
      | TYPE_KEYWORD ->
          2
      | Z ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | ATOMIC _v ->
          Obj.repr (_v : (
# 7 "lib/parser.mly"
       (string)
# 148 "lib/parser.ml"
          ))
      | COLON ->
          Obj.repr ()
      | COMMA ->
          Obj.repr ()
      | END ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | EXTERNALCHOICE ->
          Obj.repr ()
      | FUNC ->
          Obj.repr ()
      | GT ->
          Obj.repr ()
      | ID _v ->
          Obj.repr (_v : (
# 6 "lib/parser.mly"
       (string)
# 170 "lib/parser.ml"
          ))
      | INTERNALCHOICE ->
          Obj.repr ()
      | LBRACE ->
          Obj.repr ()
      | LINEARTOSHARED ->
          Obj.repr ()
      | LPAR ->
          Obj.repr ()
      | LT ->
          Obj.repr ()
      | MINUS ->
          Obj.repr ()
      | RAW _v ->
          Obj.repr (_v : (
# 5 "lib/parser.mly"
       (string)
# 188 "lib/parser.ml"
          ))
      | RBRACE ->
          Obj.repr ()
      | REC ->
          Obj.repr ()
      | RECEIVECHANNEL ->
          Obj.repr ()
      | RECEIVEVALUE ->
          Obj.repr ()
      | RPAR ->
          Obj.repr ()
      | S ->
          Obj.repr ()
      | SEMICOLON ->
          Obj.repr ()
      | SENDCHANNEL ->
          Obj.repr ()
      | SENDVALUE ->
          Obj.repr ()
      | SESSION ->
          Obj.repr ()
      | SHAREDTOLINEAR ->
          Obj.repr ()
      | TYPE_KEYWORD ->
          Obj.repr ()
      | Z ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000#\000\000\000\000\000\000\000\000\000\000\000\000\000$\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\014\000\019\000\000!\024\017\029\b\000\018\000\026\000\028\000\000\000\021\000\023\000\000\000\020\000\022\000\027\000\025\000\"\004\000\000\000\000\000\003\002\012\000\000\000\000\000\000\007\000\000\031\005\001\000\015\006\000\n")
  
  and error =
    (31, " \002\001 \000\000\b\000\000\000\001\002\245\193d\144\000\000\000\000\000\016\000\023\174\011$\128\000@\000^\184,\146\000\001\000\000\000\000\016\000\000\000\000E\235\130\201 \000\016\000\023\174\011$\128\000@\000@\128\000\000\000\000\004\000\000\000\000\000\000\004\000\000\000\000@\000\000\000\001\023\174\011$\128\000@\000^\184,\146\000\001\000\001z\224\178H\000\004\000\005\235\130\201 \000\016\000\000\000\001\128\000\000\000\002^\184,\146\000\000\000\000\000\002\000\000\000\0000\000\000\000\000\000\000\000@\000\000\000\000\000\000\001\004\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\139\215\005\146@\000\000\128\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\"\245\193d\144\000\000 \000\000\000\000\000\000\000\128\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000@\000\000\128\b\000\000\000\000\018\245\193d\144\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\001\000\000\000\000\004\001z\224\178H\000\000\128\000\000@\000\000\000\000\000\000\016\000\002\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\b\000\128H\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\003\0066\003\0006\003b\003XV:\003\004\003,\0030\000@:\004\003N\003L\003V\003\n\015\b\003\000d\015\000Z\000!\015\000\000\000\000\000\026\000$\000.\000\028\003&\0002\000*\003\024\000\020\000:\000P\000\\\000\000P\\\0146\003\000\000\000b,\018\00324\000\003\014\000\000\000\020\000\000\003\000"), (16, "\000\018\000\006\000\022\000\030\000&\0006\000}\000>\000u\000N\000^\000f\000\162\001\026\000~\0001\000)\000n\000:\000v\000\134\000z\001\030\000\138\000\n\000!\000\170\001^\001*\000\174\000Z\001J\000\254\000\130\000\246\000\190\001s\001F\000B\001V\000\198\000\222\000\214\000\026\001R\000\206\000J\000\230\000R\000\238\000V\001\006\000\014\001\022\000j\000b\001.\0002\001B\000r\000*\001\"\001\014\001&\000.\000\"\000\142\000\154"))
  
  and lhs =
    (4, "\014\220\204\186\153\136weUUUUUUTC2\017")
  
  and goto =
    ((8, "\005\000\000\002\000\000J\0008\000\000\000Z\0002\000\004\000\000\000\000\000T\000X\000>\000d\000\030\000^\000\000\020\000\000\000\000\005\000\000\000\000\000\000\000\000\000\000\000\000H\000\000\000\000\000N\000\000\000\000\000\000\000\000\000\000\000\000\000(\000$\000\000\000\000\000\000D\000\000\000\000\014\000\000\000\000\000\000\006\000"), (8, "Z*-\018[ZE\\(^_Y`%^_\000&%-(W/MO(-\000P-;N-AW-3--T-7C-=--9-5?-.\000\0001"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = arg_name;
              MenhirLib.EngineTypes.startp = _startpos_arg_name_;
              MenhirLib.EngineTypes.endp = _endpos_arg_name_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let arg_name : (
# 6 "lib/parser.mly"
       (string)
# 263 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 72 "lib/parser.mly"
                                       ( (arg_name, t) )
# 271 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_t_ in
        let _endpos = _endpos_t_ in
        let _v : (Mini_ast.ty) = 
# 75 "lib/parser.mly"
                ( t )
# 296 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = text;
          MenhirLib.EngineTypes.startp = _startpos_text_;
          MenhirLib.EngineTypes.endp = _endpos_text_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let text : (
# 5 "lib/parser.mly"
       (string)
# 317 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 42 "lib/parser.mly"
               ( Raw(text) )
# 325 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = tdef;
          MenhirLib.EngineTypes.startp = _startpos_tdef_;
          MenhirLib.EngineTypes.endp = _endpos_tdef_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let tdef : (Mini_ast.decl) = Obj.magic tdef in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_tdef_ in
        let _endpos = _endpos_tdef_ in
        let _v : (Mini_ast.decl) = 
# 43 "lib/parser.mly"
                    ( tdef )
# 350 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (Mini_ast.decl) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v : (Mini_ast.decl) = 
# 44 "lib/parser.mly"
             ( f )
# 375 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _10;
          MenhirLib.EngineTypes.startp = _startpos__10_;
          MenhirLib.EngineTypes.endp = _endpos__10_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _9;
            MenhirLib.EngineTypes.startp = _startpos__9_;
            MenhirLib.EngineTypes.endp = _endpos__9_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = ret;
              MenhirLib.EngineTypes.startp = _startpos_ret_;
              MenhirLib.EngineTypes.endp = _endpos_ret_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _7;
                MenhirLib.EngineTypes.startp = _startpos__7_;
                MenhirLib.EngineTypes.endp = _endpos__7_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _6;
                  MenhirLib.EngineTypes.startp = _startpos__6_;
                  MenhirLib.EngineTypes.endp = _endpos__6_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _5;
                    MenhirLib.EngineTypes.startp = _startpos__5_;
                    MenhirLib.EngineTypes.endp = _endpos__5_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = xs;
                      MenhirLib.EngineTypes.startp = _startpos_xs_;
                      MenhirLib.EngineTypes.endp = _endpos_xs_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _3;
                        MenhirLib.EngineTypes.startp = _startpos__3_;
                        MenhirLib.EngineTypes.endp = _endpos__3_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = name;
                          MenhirLib.EngineTypes.startp = _startpos_name_;
                          MenhirLib.EngineTypes.endp = _endpos_name_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _menhir_s;
                            MenhirLib.EngineTypes.semv = _1;
                            MenhirLib.EngineTypes.startp = _startpos__1_;
                            MenhirLib.EngineTypes.endp = _endpos__1_;
                            MenhirLib.EngineTypes.next = _menhir_stack;
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 458 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__10_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 468 "lib/parser.ml"
           in
          (
# 69 "lib/parser.mly"
                                                                                                         ( Function(TyFunc((name, ars), ret)) )
# 473 "lib/parser.ml"
           : (Mini_ast.decl))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = label;
              MenhirLib.EngineTypes.startp = _startpos_label_;
              MenhirLib.EngineTypes.endp = _endpos_label_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let label : (
# 6 "lib/parser.mly"
       (string)
# 509 "lib/parser.ml"
        ) = Obj.magic label in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_label_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 66 "lib/parser.mly"
                                  ( (label, t) )
# 517 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Mini_ast.decl list) = 
# 216 "<standard.mly>"
    ( [] )
# 535 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Mini_ast.decl list) = Obj.magic xs in
        let x : (Mini_ast.decl) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Mini_ast.decl list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 567 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((string * Mini_ast.ty) list) = 
# 145 "<standard.mly>"
    ( [] )
# 585 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((string * Mini_ast.ty) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 148 "<standard.mly>"
    ( x )
# 610 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((string * Mini_ast.ty) list) = 
# 145 "<standard.mly>"
    ( [] )
# 628 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((string * Mini_ast.ty) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 148 "<standard.mly>"
    ( x )
# 653 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = d;
            MenhirLib.EngineTypes.startp = _startpos_d_;
            MenhirLib.EngineTypes.endp = _endpos_d_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let d : (Mini_ast.decl list) = Obj.magic d in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_d_ in
        let _endpos = _endpos__2_ in
        let _v : (Mini_ast.decl list) = 
# 39 "lib/parser.mly"
                        ( d )
# 685 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = id;
          MenhirLib.EngineTypes.startp = _startpos_id_;
          MenhirLib.EngineTypes.endp = _endpos_id_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let id : (
# 6 "lib/parser.mly"
       (string)
# 706 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 50 "lib/parser.mly"
                                                                         ( TyPrimitive(id) )
# 714 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = uppercaseid;
          MenhirLib.EngineTypes.startp = _startpos_uppercaseid_;
          MenhirLib.EngineTypes.endp = _endpos_uppercaseid_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let uppercaseid : (
# 7 "lib/parser.mly"
       (string)
# 735 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 51 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 743 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let xs = 
# 241 "<standard.mly>"
    ( xs )
# 790 "lib/parser.ml"
           in
          (
# 52 "lib/parser.mly"
                                                                         ( TyInternalChoice(xs) )
# 795 "lib/parser.ml"
           : (Mini_ast.ty))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let xs = 
# 241 "<standard.mly>"
    ( xs )
# 843 "lib/parser.ml"
           in
          (
# 53 "lib/parser.mly"
                                                                         ( TyExternalChoice(xs) )
# 848 "lib/parser.ml"
           : (Mini_ast.ty))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = cont;
            MenhirLib.EngineTypes.startp = _startpos_cont_;
            MenhirLib.EngineTypes.endp = _endpos_cont_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = t;
                MenhirLib.EngineTypes.startp = _startpos_t_;
                MenhirLib.EngineTypes.endp = _endpos_t_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 54 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
# 909 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = cont;
            MenhirLib.EngineTypes.startp = _startpos_cont_;
            MenhirLib.EngineTypes.endp = _endpos_cont_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = t;
                MenhirLib.EngineTypes.startp = _startpos_t_;
                MenhirLib.EngineTypes.endp = _endpos_t_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 55 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 969 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = cont;
            MenhirLib.EngineTypes.startp = _startpos_cont_;
            MenhirLib.EngineTypes.endp = _endpos_cont_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = v;
                MenhirLib.EngineTypes.startp = _startpos_v_;
                MenhirLib.EngineTypes.endp = _endpos_v_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let v : (
# 6 "lib/parser.mly"
       (string)
# 1023 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 56 "lib/parser.mly"
                                                                         ( TySendValue(v, cont) )
# 1033 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = cont;
            MenhirLib.EngineTypes.startp = _startpos_cont_;
            MenhirLib.EngineTypes.endp = _endpos_cont_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = v;
                MenhirLib.EngineTypes.startp = _startpos_v_;
                MenhirLib.EngineTypes.endp = _endpos_v_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let v : (
# 6 "lib/parser.mly"
       (string)
# 1087 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 57 "lib/parser.mly"
                                                                         ( TyReceiveValue(v, cont) )
# 1097 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Mini_ast.ty) = 
# 58 "lib/parser.mly"
                                                                         ( TyEnd )
# 1122 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 59 "lib/parser.mly"
                                                                         ( TySharedToLinear(t) )
# 1168 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 60 "lib/parser.mly"
                                                                         ( TyLinearToShared(t) )
# 1214 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 61 "lib/parser.mly"
                                                                         ( TySession(t) )
# 1260 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 62 "lib/parser.mly"
                                                                         ( TyRec(t) )
# 1306 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let t : (int) = Obj.magic t in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_t_ in
        let _endpos = _endpos_t_ in
        let _v : (Mini_ast.ty) = 
# 63 "lib/parser.mly"
                                                                         ( TyZ (t) )
# 1331 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string * Mini_ast.ty) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 1356 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (string * Mini_ast.ty) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 1395 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string * Mini_ast.ty) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 1420 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (string * Mini_ast.ty) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((string * Mini_ast.ty) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 1459 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _name;
                MenhirLib.EngineTypes.startp = _startpos__name_;
                MenhirLib.EngineTypes.endp = _endpos__name_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _3 : unit = Obj.magic _3 in
        let _name : (
# 6 "lib/parser.mly"
       (string)
# 1507 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Mini_ast.decl) = 
# 47 "lib/parser.mly"
                                                        ( TypeDef({name = _name; body = t}) )
# 1516 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (int) = 
# 78 "lib/parser.mly"
      ( 0)
# 1541 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let t : (int) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (int) = 
# 79 "lib/parser.mly"
                          ( t + 1 )
# 1587 "lib/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    Some ([|
      "error";
      "Z";
      "TYPE_KEYWORD";
      "SHAREDTOLINEAR";
      "SESSION";
      "SENDVALUE";
      "SENDCHANNEL";
      "SEMICOLON";
      "S";
      "RPAR";
      "RECEIVEVALUE";
      "RECEIVECHANNEL";
      "REC";
      "RBRACE";
      "RAW";
      "MINUS";
      "LT";
      "LPAR";
      "LINEARTOSHARED";
      "LBRACE";
      "INTERNALCHOICE";
      "ID";
      "GT";
      "FUNC";
      "EXTERNALCHOICE";
      "EQ";
      "EOF";
      "END";
      "COMMA";
      "COLON";
      "ATOMIC";
      "#";
    |], [|
      "Accepting";
      "Reducing production arg -> ID COLON arg_type";
      "Reducing production arg_type -> s_type";
      "Reducing production decl -> RAW";
      "Reducing production decl -> type_def";
      "Reducing production decl -> func";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE RBRACE";
      "Reducing production labeled_type -> ID COLON s_type";
      "Reducing production list(decl) ->";
      "Reducing production list(decl) -> decl list(decl)";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) -> separated_nonempty_list(COMMA,arg)";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) -> separated_nonempty_list(COMMA,labeled_type)";
      "Reducing production prog -> list(decl) EOF";
      "Reducing production s_type -> ID";
      "Reducing production s_type -> ATOMIC";
      "Reducing production s_type -> INTERNALCHOICE LT loption(separated_nonempty_list(COMMA,labeled_type)) GT";
      "Reducing production s_type -> EXTERNALCHOICE LT loption(separated_nonempty_list(COMMA,labeled_type)) GT";
      "Reducing production s_type -> SENDCHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> RECEIVECHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> SENDVALUE LT ID COMMA s_type GT";
      "Reducing production s_type -> RECEIVEVALUE LT ID COMMA s_type GT";
      "Reducing production s_type -> END";
      "Reducing production s_type -> SHAREDTOLINEAR LT s_type GT";
      "Reducing production s_type -> LINEARTOSHARED LT s_type GT";
      "Reducing production s_type -> SESSION LT s_type GT";
      "Reducing production s_type -> REC LT s_type GT";
      "Reducing production s_type -> z_type";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg COMMA separated_nonempty_list(COMMA,arg)";
      "Reducing production separated_nonempty_list(COMMA,labeled_type) -> labeled_type";
      "Reducing production separated_nonempty_list(COMMA,labeled_type) -> labeled_type COMMA separated_nonempty_list(COMMA,labeled_type)";
      "Reducing production type_def -> TYPE_KEYWORD ID EQ s_type SEMICOLON";
      "Reducing production z_type -> Z";
      "Reducing production z_type -> S LT z_type GT";
    |])
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
  module Symbols = struct
    
    type _ terminal = 
      | T_error : unit terminal
      | T_Z : unit terminal
      | T_TYPE_KEYWORD : unit terminal
      | T_SHAREDTOLINEAR : unit terminal
      | T_SESSION : unit terminal
      | T_SENDVALUE : unit terminal
      | T_SENDCHANNEL : unit terminal
      | T_SEMICOLON : unit terminal
      | T_S : unit terminal
      | T_RPAR : unit terminal
      | T_RECEIVEVALUE : unit terminal
      | T_RECEIVECHANNEL : unit terminal
      | T_REC : unit terminal
      | T_RBRACE : unit terminal
      | T_RAW : (
# 5 "lib/parser.mly"
       (string)
# 1701 "lib/parser.ml"
    ) terminal
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_LBRACE : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_ID : (
# 6 "lib/parser.mly"
       (string)
# 1712 "lib/parser.ml"
    ) terminal
      | T_GT : unit terminal
      | T_FUNC : unit terminal
      | T_EXTERNALCHOICE : unit terminal
      | T_EQ : unit terminal
      | T_EOF : unit terminal
      | T_END : unit terminal
      | T_COMMA : unit terminal
      | T_COLON : unit terminal
      | T_ATOMIC : (
# 7 "lib/parser.mly"
       (string)
# 1725 "lib/parser.ml"
    ) terminal
    
    type _ nonterminal = 
      | N_z_type : (int) nonterminal
      | N_type_def : (Mini_ast.decl) nonterminal
      | N_separated_nonempty_list_COMMA_labeled_type_ : ((string * Mini_ast.ty) list) nonterminal
      | N_separated_nonempty_list_COMMA_arg_ : ((string * Mini_ast.ty) list) nonterminal
      | N_s_type : (Mini_ast.ty) nonterminal
      | N_prog : (Mini_ast.decl list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_labeled_type__ : ((string * Mini_ast.ty) list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_arg__ : ((string * Mini_ast.ty) list) nonterminal
      | N_list_decl_ : (Mini_ast.decl list) nonterminal
      | N_labeled_type : (string * Mini_ast.ty) nonterminal
      | N_func : (Mini_ast.decl) nonterminal
      | N_decl : (Mini_ast.decl) nonterminal
      | N_arg_type : (Mini_ast.ty) nonterminal
      | N_arg : (string * Mini_ast.ty) nonterminal
    
  end
  
  include Symbols
  
  include MenhirLib.InspectionTableInterpreter.Make (Tables) (struct
    
    include TI
    
    include Symbols
    
    include MenhirLib.InspectionTableInterpreter.Symbols (Symbols)
    
    let terminal =
      fun t ->
        match t with
        | 0 ->
            X (T T_error)
        | 1 ->
            X (T T_Z)
        | 2 ->
            X (T T_TYPE_KEYWORD)
        | 3 ->
            X (T T_SHAREDTOLINEAR)
        | 4 ->
            X (T T_SESSION)
        | 5 ->
            X (T T_SENDVALUE)
        | 6 ->
            X (T T_SENDCHANNEL)
        | 7 ->
            X (T T_SEMICOLON)
        | 8 ->
            X (T T_S)
        | 9 ->
            X (T T_RPAR)
        | 10 ->
            X (T T_RECEIVEVALUE)
        | 11 ->
            X (T T_RECEIVECHANNEL)
        | 12 ->
            X (T T_REC)
        | 13 ->
            X (T T_RBRACE)
        | 14 ->
            X (T T_RAW)
        | 15 ->
            X (T T_MINUS)
        | 16 ->
            X (T T_LT)
        | 17 ->
            X (T T_LPAR)
        | 18 ->
            X (T T_LINEARTOSHARED)
        | 19 ->
            X (T T_LBRACE)
        | 20 ->
            X (T T_INTERNALCHOICE)
        | 21 ->
            X (T T_ID)
        | 22 ->
            X (T T_GT)
        | 23 ->
            X (T T_FUNC)
        | 24 ->
            X (T T_EXTERNALCHOICE)
        | 25 ->
            X (T T_EQ)
        | 26 ->
            X (T T_EOF)
        | 27 ->
            X (T T_END)
        | 28 ->
            X (T T_COMMA)
        | 29 ->
            X (T T_COLON)
        | 30 ->
            X (T T_ATOMIC)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 14 ->
            X (N N_arg)
        | 13 ->
            X (N N_arg_type)
        | 12 ->
            X (N N_decl)
        | 11 ->
            X (N N_func)
        | 10 ->
            X (N N_labeled_type)
        | 9 ->
            X (N N_list_decl_)
        | 8 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 7 ->
            X (N N_loption_separated_nonempty_list_COMMA_labeled_type__)
        | 6 ->
            X (N N_prog)
        | 5 ->
            X (N N_s_type)
        | 4 ->
            X (N N_separated_nonempty_list_COMMA_arg_)
        | 3 ->
            X (N N_separated_nonempty_list_COMMA_labeled_type_)
        | 2 ->
            X (N N_type_def)
        | 1 ->
            X (N N_z_type)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\006,4\004\b\"\n\"\012\",:\014\"\018\"\003.\022\",:\024\"\026\"&\"*\",<,2\"\007\015.\021:\0078>\003\011\015.\011.\011.\011:\011.\011.\011:\011.\011.\011.\011.\011\016\0300,$,<\011\027\t\017\020 .\011(\028\029:\t\005\r\0196\023\025\019")
    
    and rhs =
      ((8, "\r,<\027\011\030\005\0230,$\017\020 .\011(\028,<\011\025\019\t\007\0196,>*\"\015.2\"\015.\014\"\011:\011.\024\"\011:\011.\012\",:\011.\022\",:\011.8\b\"\011.&\"\011.\n\"\011.\026\"\011.\003\029\029:\t\021\021:\007\006,4\011\016\004\018\"\003."), (8, "\000\001\004\005\006\007\b\018\021\021\023\023\024\024\025\027\028\029!%+17=>BFJNOPSTW\\]a"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_")
    
    and lr0_items =
      ((16, "\000\000\132\001\132\002\132\003\136\001`\001`\002h\001h\002T\001T\002T\003T\004L\001L\002\140\001\140\002\140\003\140\004X\001X\002X\003X\004P\001P\002l\001l\002d\001d\002D\001D\002\028\001\028\002<\001H\001H\0024\001H\003H\004\128\001|\001\128\002\128\003\\\001@\001p\001\028\003D\003D\004d\003d\004l\003l\004P\003P\004P\005P\006X\005X\006L\003L\004L\005L\006T\005T\006h\003h\004`\003`\004\132\004\132\005\012\001\024\001\024\002\024\003\004\001\004\002\b\001\004\003,\001\024\004\024\005\024\006\024\007\024\b\024\t\024\nx\001t\001x\002x\003\016\001\000\0018\0018\002\020\001$\001$\002"), (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&')*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWYZ[\\]^_`ab"))
    
    and nullable =
      "\001\192"
    
    and first =
      (31, " \002\001 \129\000\000\000\128\000\000\000\000\000 \000\000\000@\011\215\005\146H\000\128H\000\000\002\000\000\000\004\000@\004\002\000\000\000\016\000\000\000\b\002\000 \016\011\215\005\146@\000\001\000\000")
    
  end) (ET) (TI)
  
end

let prog =
  fun lexer lexbuf : (Mini_ast.decl list) ->
    Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf)

module Incremental = struct
  
  let prog =
    fun initial_position : (Mini_ast.decl list) MenhirInterpreter.checkpoint ->
      Obj.magic (MenhirInterpreter.start 0 initial_position)
  
end
