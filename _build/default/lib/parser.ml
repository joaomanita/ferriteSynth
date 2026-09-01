
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
    | USE
    | TYPE_KEYWORD
    | SYNTHESIZE
    | SUGGEST
    | SHAREDTOLINEAR
    | SESSION
    | SENDVALUE
    | SENDCHANNEL
    | SEMICOLON
    | S
    | RSQUARE
    | RPAR
    | RELEASE
    | REC_FUNC
    | RECEIVEVALUE
    | RECEIVECHANNEL
    | REC
    | RBRACE
    | RAW of (
# 5 "lib/parser.mly"
       (string)
# 39 "lib/parser.ml"
  )
    | MINUS
    | LT
    | LSQUARE
    | LPAR
    | LINEARTOSHARED
    | LBRACE
    | INTERNALCHOICE
    | INT of (
# 8 "lib/parser.mly"
       (int)
# 51 "lib/parser.ml"
  )
    | ID of (
# 6 "lib/parser.mly"
       (string)
# 56 "lib/parser.ml"
  )
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
    | ATOMIC of (
# 7 "lib/parser.mly"
       (string)
# 72 "lib/parser.ml"
  )
    | AT
    | ACQUIRE
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast

# 85 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ACQUIRE ->
          43
      | AT ->
          42
      | ATOMIC _ ->
          41
      | COLON ->
          40
      | COMMA ->
          39
      | DEFINE_CHOICE ->
          38
      | EITHER ->
          37
      | END ->
          36
      | EOF ->
          35
      | EQ ->
          34
      | EXCLAMATION ->
          33
      | EXTERNALCHOICE ->
          32
      | FUNC ->
          31
      | GT ->
          30
      | ID _ ->
          29
      | INT _ ->
          28
      | INTERNALCHOICE ->
          27
      | LBRACE ->
          26
      | LINEARTOSHARED ->
          25
      | LPAR ->
          24
      | LSQUARE ->
          23
      | LT ->
          22
      | MINUS ->
          21
      | RAW _ ->
          20
      | RBRACE ->
          19
      | REC ->
          18
      | RECEIVECHANNEL ->
          17
      | RECEIVEVALUE ->
          16
      | REC_FUNC ->
          15
      | RELEASE ->
          14
      | RPAR ->
          13
      | RSQUARE ->
          12
      | S ->
          11
      | SEMICOLON ->
          10
      | SENDCHANNEL ->
          9
      | SENDVALUE ->
          8
      | SESSION ->
          7
      | SHAREDTOLINEAR ->
          6
      | SUGGEST ->
          5
      | SYNTHESIZE ->
          4
      | TYPE_KEYWORD ->
          3
      | USE ->
          2
      | Z ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | ACQUIRE ->
          Obj.repr ()
      | AT ->
          Obj.repr ()
      | ATOMIC _v ->
          Obj.repr (_v : (
# 7 "lib/parser.mly"
       (string)
# 195 "lib/parser.ml"
          ))
      | COLON ->
          Obj.repr ()
      | COMMA ->
          Obj.repr ()
      | DEFINE_CHOICE ->
          Obj.repr ()
      | EITHER ->
          Obj.repr ()
      | END ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | EXCLAMATION ->
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
# 223 "lib/parser.ml"
          ))
      | INT _v ->
          Obj.repr (_v : (
# 8 "lib/parser.mly"
       (int)
# 229 "lib/parser.ml"
          ))
      | INTERNALCHOICE ->
          Obj.repr ()
      | LBRACE ->
          Obj.repr ()
      | LINEARTOSHARED ->
          Obj.repr ()
      | LPAR ->
          Obj.repr ()
      | LSQUARE ->
          Obj.repr ()
      | LT ->
          Obj.repr ()
      | MINUS ->
          Obj.repr ()
      | RAW _v ->
          Obj.repr (_v : (
# 5 "lib/parser.mly"
       (string)
# 249 "lib/parser.ml"
          ))
      | RBRACE ->
          Obj.repr ()
      | REC ->
          Obj.repr ()
      | RECEIVECHANNEL ->
          Obj.repr ()
      | RECEIVEVALUE ->
          Obj.repr ()
      | REC_FUNC ->
          Obj.repr ()
      | RELEASE ->
          Obj.repr ()
      | RPAR ->
          Obj.repr ()
      | RSQUARE ->
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
      | SUGGEST ->
          Obj.repr ()
      | SYNTHESIZE ->
          Obj.repr ()
      | TYPE_KEYWORD ->
          Obj.repr ()
      | USE ->
          Obj.repr ()
      | Z ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000?\000\000\000\000\000\000\000\000\000\000\000\000\000@/\000\000\000\000\000\000\000\000\000\000\000\000\000!\000\000\029\000\000\000\"\000 )\0300.\000\000\000\006\000\031\000+\000-\000\000\000$\000'\000\000\000(\000\000\000#\000%\000\000\000&\000,\000*\000=\t\000\000\000\000\00041\000\000\000\000\000\003\000\000\025\002\023\000\000\000\000\000\000\000\000\005\000\000\000\000\0006\000\028\000\000\000<\000\0002\000\0008\000\000\000\000\000\000\000\000\019\000\000\000\000\000\000\000\017\000\b\000\000\000\000\000\000\000\000>\000\000\000\000\000\000\000\007\000\016\000\000:\r\n\015\001\000\026\012\011\000\021\014")
  
  and error =
    (44, "\016\000\b\001\018\000\000\000\000@\000\000\000\000\000 \004=.\005H\133\000\000\000\000\000\000\000\000 \000\000C\210\224T\136P\000\000 \000\000C\210\224T\136P\000\000 \000\000\000\000\000\004\000@\000\000\000\000\016C\210\224T\136P\000\000 \000\000C\210\224T\136P\000\000 \000\000@\016\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000@\004\000\000\000\000\001\004=.\005H\133\000\000\002\000\000\004=.\005H\133\000\000\002\000\000\004=.\005H\133\000\000\002\000\000\004=.\005H\133\000\000\002\000\000\000\000\000\000@@\000\000\000\002\000\000\000\000\000\000\000\000\000\002\000\000\004=.\005H\133\000\000\000\000\000\000\000\000 \000\000\000\000\000\004\004\000\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016C\210\224T\136P\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\016C\210\224T\136P\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\016C\210\224T\136P\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\016C\210\224T\136P\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\016C\210\224T\136P\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000(\000\000\000\000\000\000\000@\000\000\000 \016\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\128\000\000\000@\000@\000\000\000\000\000\000\132=.\005H\133\000\000\000\000\000\000\000@\000\000\024\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000@\000\000\000\000\000\002\000\004=.\005H\133\000\000\000 \000\000\000\000\000\000\002\b\000\000\000\000\000\000\016\016\000\000\000\000\000\000\000\000\000\000\016\000\000$\b\000\000\000\000\000\000\000@\000\000 \000\000\001\000\000\000\000@\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000@\128\000\000\000\000\000\000\004\000\000\002\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\004\000\000\001\000\000\000\000@\000\000\000\000\000\000\000\000@\000@\000\000\004\000\000\000\000\000\000B\000\000\000\000\000\002\000\004=.\005H\133\000\000\000 \000\000\000\001\128\000\002\000\000\024\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\016\016\000\000\000\000\001\000\000\002@\128\000\000\000\004\b\000\000\000\000\000\128\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000 \128\000\000\000\000\000\001\001\000\000\000\000\000\016\000\000$\b\000\000\000\000@\128\000\000\000\000\b\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000 \000\000\000\000\000@\000\000 \000\000\000\000\000\000\000@\000\000\000\000\000\000\132=.\005H\133\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\001\000\000\016\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\b\001\018\000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\0050\162\003\000n\003\182\003\146\"\182\003D\003Z\003f\000\000\150\019\134\003\188\003\164\003\196\003\200\024\190\000\210\003\000\218\020\206\000>\000\000\000\000\000>\003T\000t\000n\000\156\000\174\003:\000\132\000x\003\140\000\136\003\160\000\168\000\146\003\162\000\174\000\176\000\186\000\000\146\003\160\030\160\000\000\128\138F\166\003\000\005\192\000\000\000\142\214j\003\206J\148:\000h\014\206R\206\000v\000L\206Z\000ZR\000\019F\000Fb\002B\003N##\000\210:Z\014L\214\172\000h\000>\194:j\014L\158\146\000b~t\160rD\003\000\158\000\011r\000\000\000\000\000>\000\000\000\005\000\000"), (16, "\000\018\000\006\000E\002\"\000\217\000\022\000\030\000&\0006\001\198\000>\000]\000i\000N\000\225\000R\000b\000j\001N\000i\000Z\001Z\002\018\002\006\000r\002*\000z\002R\000\146\001R\001\254\000\150\000\254\000M\002\162\000\174\002v\000]\001\138\000\158\000\178\000\130\000\182\001\226\001\186\000\201\000.\000\138\000U\000\138\000\233\000\209\000\r\000\n\001b\001\234\000:\001\242\001&\000\242\001\246\000\170\002\014\002\022\001z\002\030\002\191\000B\0026\001\218\000\194\002N\000\202\002V\002\142\001\194\002b\000\026\001\182\001\178\001\206\000J\002z\001\166\001\158\000\218\002\138\002\130\000\210\002~\002\134\002n\002r\001v\001r\000*\000\250\000V\002\154\001\002\001\n\002Z\001V\001J\000n\002F\000^\001\018\000\226\002.\001\026\0012\001*\000\"\001\"\000\014\000f\001:\001B\002B\000v\001^\000~\001~\001\142\000\134\000\234\000\142\001\162\001\174\0002\000\154\001\202\000\162"))
  
  and lhs =
    (8, "\000\026\025\024\024\023\022\021\020\020\020\020\020\020\020\019\018\017\017\016\016\015\015\014\014\r\012\012\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\n\t\b\b\007\007\006\006\005\005\004\004\003\002\001\001")
  
  and goto =
    ((8, "\005\000\000\132\000\0006\000B\000\000\000b\000P\000\n\000\000\000\000\000\000L\000n\000j\000F\000x\000\000\000@\000\000z\000\000\000\000\000\000\000\000\000h\000\000\000\000\000\000\000\000\000f\000\000\000\000\000\128\000\000\000x\000\000\000\000\000H\000\000\000\000\000\000\000\000\000\000\000\r\000\156\000\000\000\000\007\000(\000\136\000\000\000\000\000\000\000t\000\000\000z\000\000\138\146\000\162\000\000\000\166\144\000\000\000\000\000\000:\000\028\000\000\000>\000nv\000\000b\000t\128\000\000\000\000\000\000\000l\000\005\002\000\000\000\000\000\000\000h\000^\000\000\000\000\016\000\000\000\000\000\000\000\000\000\012\000\000"), (8, "\171\172[f\\\155\018\173\171\172\154\174g\170\175\173\177\178\179\181f/\180\127\177\178\179\181/\131\168a///\129//P/\127/\1350Nb6L/>/D///\127/\166\165/H/<28/:/\144k\143F\147\141\168B\138R\152zvxe4*pZ|u"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = count;
          MenhirLib.EngineTypes.startp = _startpos_count_;
          MenhirLib.EngineTypes.endp = _endpos_count_;
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
                MenhirLib.EngineTypes.semv = arg_name;
                MenhirLib.EngineTypes.startp = _startpos_arg_name_;
                MenhirLib.EngineTypes.endp = _endpos_arg_name_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let count : (int option) = Obj.magic count in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _2 : unit = Obj.magic _2 in
        let arg_name : (
# 6 "lib/parser.mly"
       (string)
# 343 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_count_ in
        let _v : ((string * Mini_ast.ty) * int) = 
# 194 "lib/parser.mly"
    (
      ((arg_name, t), Option.value count ~default:0)
    )
# 353 "lib/parser.ml"
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
# 199 "lib/parser.mly"
                ( t )
# 378 "lib/parser.ml"
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
        let _v : (bool) = 
# 134 "<standard.mly>"
    ( false )
# 396 "lib/parser.ml"
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
        let _v : (bool) = 
# 137 "<standard.mly>"
    ( true )
# 421 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = t2;
            MenhirLib.EngineTypes.startp = _startpos_t2_;
            MenhirLib.EngineTypes.endp = _endpos_t2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = t1;
                MenhirLib.EngineTypes.startp = _startpos_t1_;
                MenhirLib.EngineTypes.endp = _endpos_t1_;
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
        let t2 : (Mini_ast.ty) = Obj.magic t2 in
        let _4 : unit = Obj.magic _4 in
        let t1 : (Mini_ast.ty) = Obj.magic t1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.choice) = 
# 90 "lib/parser.mly"
      ( (TyEither (t1, t2)) )
# 481 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = ty;
          MenhirLib.EngineTypes.startp = _startpos_ty_;
          MenhirLib.EngineTypes.endp = _endpos_ty_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = lbl;
              MenhirLib.EngineTypes.startp = _startpos_lbl_;
              MenhirLib.EngineTypes.endp = _endpos_lbl_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let ty : (Mini_ast.ty) = Obj.magic ty in
        let _2 : unit = Obj.magic _2 in
        let lbl : (
# 6 "lib/parser.mly"
       (string)
# 516 "lib/parser.ml"
        ) = Obj.magic lbl in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_lbl_ in
        let _endpos = _endpos_ty_ in
        let _v : (string * Mini_ast.ty) = 
# 94 "lib/parser.mly"
    (
      (lbl, ty)
    )
# 526 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _11;
          MenhirLib.EngineTypes.startp = _startpos__11_;
          MenhirLib.EngineTypes.endp = _endpos__11_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = body;
            MenhirLib.EngineTypes.startp = _startpos_body_;
            MenhirLib.EngineTypes.endp = _endpos_body_;
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
          };
        } = _menhir_stack in
        let _11 : unit = Obj.magic _11 in
        let body : (string list) = Obj.magic body in
        let _9 : unit = Obj.magic _9 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 616 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__11_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 626 "lib/parser.ml"
           in
          (
# 159 "lib/parser.mly"
    (
      ClosedFunction(
        (TyFunc((name, List.map fst ars), ret),
         String.concat "" body)
      )
    )
# 636 "lib/parser.ml"
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
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = text;
          MenhirLib.EngineTypes.startp = _startpos_text_;
          MenhirLib.EngineTypes.endp = _endpos_text_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let text : (
# 5 "lib/parser.mly"
       (string)
# 658 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 55 "lib/parser.mly"
               ( Raw(text) )
# 666 "lib/parser.ml"
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
# 56 "lib/parser.mly"
                    ( tdef )
# 691 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = cdef;
          MenhirLib.EngineTypes.startp = _startpos_cdef_;
          MenhirLib.EngineTypes.endp = _endpos_cdef_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let cdef : (Mini_ast.choice) = Obj.magic cdef in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_cdef_ in
        let _endpos = _endpos_cdef_ in
        let _v : (Mini_ast.decl) = 
# 57 "lib/parser.mly"
                         ( ChoiceDef(cdef) )
# 716 "lib/parser.ml"
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
# 58 "lib/parser.mly"
             ( f )
# 741 "lib/parser.ml"
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
# 59 "lib/parser.mly"
                      ( f )
# 766 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = closed_f;
          MenhirLib.EngineTypes.startp = _startpos_closed_f_;
          MenhirLib.EngineTypes.endp = _endpos_closed_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let closed_f : (Mini_ast.decl) = Obj.magic closed_f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_closed_f_ in
        let _endpos = _endpos_closed_f_ in
        let _v : (Mini_ast.decl) = 
# 60 "lib/parser.mly"
                           ( closed_f )
# 791 "lib/parser.ml"
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
# 61 "lib/parser.mly"
                    ( f )
# 816 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _7;
          MenhirLib.EngineTypes.startp = _startpos__7_;
          MenhirLib.EngineTypes.endp = _endpos__7_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = branches;
            MenhirLib.EngineTypes.startp = _startpos_branches_;
            MenhirLib.EngineTypes.endp = _endpos_branches_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _5;
              MenhirLib.EngineTypes.startp = _startpos__5_;
              MenhirLib.EngineTypes.endp = _endpos__5_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = name;
                MenhirLib.EngineTypes.startp = _startpos_name_;
                MenhirLib.EngineTypes.endp = _endpos_name_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _3;
                  MenhirLib.EngineTypes.startp = _startpos__3_;
                  MenhirLib.EngineTypes.endp = _endpos__3_;
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
          };
        } = _menhir_stack in
        let _7 : unit = Obj.magic _7 in
        let branches : ((string * Mini_ast.ty) list) = Obj.magic branches in
        let _5 : unit = Obj.magic _5 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 876 "lib/parser.ml"
        ) = Obj.magic name in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Mini_ast.choice) = 
# 103 "lib/parser.mly"
    (
      (TyDefineChoice (name, branches))
    )
# 889 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _17;
          MenhirLib.EngineTypes.startp = _startpos__17_;
          MenhirLib.EngineTypes.endp = _endpos__17_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _16;
            MenhirLib.EngineTypes.startp = _startpos__16_;
            MenhirLib.EngineTypes.endp = _endpos__16_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = suggested_funcs;
              MenhirLib.EngineTypes.startp = _startpos_suggested_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_suggested_funcs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = required_funcs;
                MenhirLib.EngineTypes.startp = _startpos_required_funcs_;
                MenhirLib.EngineTypes.endp = _endpos_required_funcs_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _13;
                  MenhirLib.EngineTypes.startp = _startpos__13_;
                  MenhirLib.EngineTypes.endp = _endpos__13_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = recursive;
                    MenhirLib.EngineTypes.startp = _startpos_recursive_;
                    MenhirLib.EngineTypes.endp = _endpos_recursive_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _11;
                      MenhirLib.EngineTypes.startp = _startpos__11_;
                      MenhirLib.EngineTypes.endp = _endpos__11_;
                      MenhirLib.EngineTypes.next = {
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
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _17 : unit = Obj.magic _17 in
        let _16 : unit = Obj.magic _16 in
        let suggested_funcs : (string list) = Obj.magic suggested_funcs in
        let required_funcs : (string list) = Obj.magic required_funcs in
        let _13 : unit = Obj.magic _13 in
        let recursive : (bool) = Obj.magic recursive in
        let _11 : unit = Obj.magic _11 in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 1021 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__17_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 1031 "lib/parser.ml"
           in
          (
# 119 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyFunc (((name, args), ret)), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 1040 "lib/parser.ml"
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
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (string list) = 
# 216 "<standard.mly>"
    ( [] )
# 1059 "lib/parser.ml"
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
        let xs : (string list) = Obj.magic xs in
        let x : (
# 5 "lib/parser.mly"
       (string)
# 1087 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1095 "lib/parser.ml"
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
# 1113 "lib/parser.ml"
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
# 1145 "lib/parser.ml"
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
        let _v : (((string * Mini_ast.ty) * int) list) = 
# 145 "<standard.mly>"
    ( [] )
# 1163 "lib/parser.ml"
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
        let x : (((string * Mini_ast.ty) * int) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (((string * Mini_ast.ty) * int) list) = 
# 148 "<standard.mly>"
    ( x )
# 1188 "lib/parser.ml"
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
        let _v : (int option) = 
# 111 "<standard.mly>"
    ( None )
# 1206 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (
# 8 "lib/parser.mly"
       (int)
# 1233 "lib/parser.ml"
        ) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x = 
# 188 "<standard.mly>"
    ( x )
# 1243 "lib/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 1248 "lib/parser.ml"
           : (int option))
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
# 52 "lib/parser.mly"
                        ( d )
# 1281 "lib/parser.ml"
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
        let _v : (string list) = 
# 143 "lib/parser.mly"
                                ( [] )
# 1299 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ids;
            MenhirLib.EngineTypes.startp = _startpos_ids_;
            MenhirLib.EngineTypes.endp = _endpos_ids_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let ids : (string list) = Obj.magic ids in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (string list) = 
# 145 "lib/parser.mly"
                                ( ids )
# 1338 "lib/parser.ml"
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
# 1359 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 67 "lib/parser.mly"
                                                                         ( TyPrimitive(id) )
# 1367 "lib/parser.ml"
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
# 1388 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 68 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 1396 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
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
        let c : (Mini_ast.choice) = Obj.magic c in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 69 "lib/parser.mly"
                                                                         ( TyInternalChoice(c) )
# 1442 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
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
        let c : (Mini_ast.choice) = Obj.magic c in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 70 "lib/parser.mly"
                                                                         ( TyExternalChoice(c) )
# 1488 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = id;
            MenhirLib.EngineTypes.startp = _startpos_id_;
            MenhirLib.EngineTypes.endp = _endpos_id_;
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
        let id : (
# 6 "lib/parser.mly"
       (string)
# 1528 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 71 "lib/parser.mly"
                                                                         ( TyInternalChoiceId(id) )
# 1538 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = id;
            MenhirLib.EngineTypes.startp = _startpos_id_;
            MenhirLib.EngineTypes.endp = _endpos_id_;
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
        let id : (
# 6 "lib/parser.mly"
       (string)
# 1578 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 72 "lib/parser.mly"
                                                                         ( TyExternalChoiceId(id) )
# 1588 "lib/parser.ml"
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
# 73 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
# 1648 "lib/parser.ml"
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
# 74 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 1708 "lib/parser.ml"
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
                MenhirLib.EngineTypes.semv = id;
                MenhirLib.EngineTypes.startp = _startpos_id_;
                MenhirLib.EngineTypes.endp = _endpos_id_;
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
        let id : (
# 6 "lib/parser.mly"
       (string)
# 1762 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 75 "lib/parser.mly"
                                                                         ( TySendValue(TyPrimitive id, cont) )
# 1772 "lib/parser.ml"
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
                MenhirLib.EngineTypes.semv = a;
                MenhirLib.EngineTypes.startp = _startpos_a_;
                MenhirLib.EngineTypes.endp = _endpos_a_;
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
        let a : (
# 7 "lib/parser.mly"
       (string)
# 1826 "lib/parser.ml"
        ) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 76 "lib/parser.mly"
                                                                         ( TySendValue(TyAtomic a, cont) )
# 1836 "lib/parser.ml"
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
                MenhirLib.EngineTypes.semv = id;
                MenhirLib.EngineTypes.startp = _startpos_id_;
                MenhirLib.EngineTypes.endp = _endpos_id_;
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
        let id : (
# 6 "lib/parser.mly"
       (string)
# 1890 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 77 "lib/parser.mly"
                                                                         ( TyReceiveValue(TyPrimitive id, cont) )
# 1900 "lib/parser.ml"
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
                MenhirLib.EngineTypes.semv = a;
                MenhirLib.EngineTypes.startp = _startpos_a_;
                MenhirLib.EngineTypes.endp = _endpos_a_;
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
        let a : (
# 7 "lib/parser.mly"
       (string)
# 1954 "lib/parser.ml"
        ) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 78 "lib/parser.mly"
                                                                         ( TyReceiveValue(TyAtomic a, cont) )
# 1964 "lib/parser.ml"
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
# 79 "lib/parser.mly"
                                                                         ( TyEnd )
# 1989 "lib/parser.ml"
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
# 80 "lib/parser.mly"
                                                                         ( TySharedToLinear(t, 0) )
# 2035 "lib/parser.ml"
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
# 81 "lib/parser.mly"
                                                                         ( TyLinearToShared(t, 0) )
# 2081 "lib/parser.ml"
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
# 82 "lib/parser.mly"
                                                                         ( TySession(t) )
# 2127 "lib/parser.ml"
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
# 83 "lib/parser.mly"
                                                                         ( TyRec(t) )
# 2173 "lib/parser.ml"
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
# 84 "lib/parser.mly"
                                                                         ( TyZ (t) )
# 2198 "lib/parser.ml"
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
# 85 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2223 "lib/parser.ml"
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
# 86 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2248 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = ts;
          MenhirLib.EngineTypes.startp = _startpos_ts_;
          MenhirLib.EngineTypes.endp = _endpos_ts_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let ts : (string list) = Obj.magic ts in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ts_ in
        let _endpos = _endpos_ts_ in
        let _v : (Mini_ast.ty list) = 
# 168 "lib/parser.mly"
      ( List.map (fun t -> TyAtomic t) ts )
# 2273 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _20;
          MenhirLib.EngineTypes.startp = _startpos__20_;
          MenhirLib.EngineTypes.endp = _endpos__20_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _19;
            MenhirLib.EngineTypes.startp = _startpos__19_;
            MenhirLib.EngineTypes.endp = _endpos__19_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = suggested_funcs;
              MenhirLib.EngineTypes.startp = _startpos_suggested_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_suggested_funcs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = required_funcs;
                MenhirLib.EngineTypes.startp = _startpos_required_funcs_;
                MenhirLib.EngineTypes.endp = _endpos_required_funcs_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _16;
                  MenhirLib.EngineTypes.startp = _startpos__16_;
                  MenhirLib.EngineTypes.endp = _endpos__16_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = recursive;
                    MenhirLib.EngineTypes.startp = _startpos_recursive_;
                    MenhirLib.EngineTypes.endp = _endpos_recursive_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _14;
                      MenhirLib.EngineTypes.startp = _startpos__14_;
                      MenhirLib.EngineTypes.endp = _endpos__14_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _13;
                        MenhirLib.EngineTypes.startp = _startpos__13_;
                        MenhirLib.EngineTypes.endp = _endpos__13_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _12;
                          MenhirLib.EngineTypes.startp = _startpos__12_;
                          MenhirLib.EngineTypes.endp = _endpos__12_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _;
                            MenhirLib.EngineTypes.semv = ret;
                            MenhirLib.EngineTypes.startp = _startpos_ret_;
                            MenhirLib.EngineTypes.endp = _endpos_ret_;
                            MenhirLib.EngineTypes.next = {
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
                                  MenhirLib.EngineTypes.semv = _8;
                                  MenhirLib.EngineTypes.startp = _startpos__8_;
                                  MenhirLib.EngineTypes.endp = _endpos__8_;
                                  MenhirLib.EngineTypes.next = {
                                    MenhirLib.EngineTypes.state = _;
                                    MenhirLib.EngineTypes.semv = xs;
                                    MenhirLib.EngineTypes.startp = _startpos_xs_;
                                    MenhirLib.EngineTypes.endp = _endpos_xs_;
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
                                          MenhirLib.EngineTypes.semv = tList;
                                          MenhirLib.EngineTypes.startp = _startpos_tList_;
                                          MenhirLib.EngineTypes.endp = _endpos_tList_;
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
                            };
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
        let _20 : unit = Obj.magic _20 in
        let _19 : unit = Obj.magic _19 in
        let suggested_funcs : (string list) = Obj.magic suggested_funcs in
        let required_funcs : (string list) = Obj.magic required_funcs in
        let _16 : unit = Obj.magic _16 in
        let recursive : (bool) = Obj.magic recursive in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let _12 : unit = Obj.magic _12 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let tList : (Mini_ast.ty list) = Obj.magic tList in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 2426 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__20_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2436 "lib/parser.ml"
           in
          (
# 183 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function
        (TySchemeFunc
           (tList,
            ((name, args), ret)), argcounts,  recursive, (required_funcs, suggested_funcs))
    )
# 2448 "lib/parser.ml"
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
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (
# 7 "lib/parser.mly"
       (string)
# 2470 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2478 "lib/parser.ml"
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
        let xs : (string list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 7 "lib/parser.mly"
       (string)
# 2513 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2521 "lib/parser.ml"
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
        let x : (
# 6 "lib/parser.mly"
       (string)
# 2542 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2550 "lib/parser.ml"
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
        let xs : (string list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (
# 6 "lib/parser.mly"
       (string)
# 2585 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2593 "lib/parser.ml"
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
        let x : ((string * Mini_ast.ty) * int) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (((string * Mini_ast.ty) * int) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2618 "lib/parser.ml"
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
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : ((string * Mini_ast.ty) * int) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (((string * Mini_ast.ty) * int) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2657 "lib/parser.ml"
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
# 2682 "lib/parser.ml"
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
# 2721 "lib/parser.ml"
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
        let _v : (string list) = 
# 148 "lib/parser.mly"
                                ( [] )
# 2739 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ids;
            MenhirLib.EngineTypes.startp = _startpos_ids_;
            MenhirLib.EngineTypes.endp = _endpos_ids_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let ids : (string list) = Obj.magic ids in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (string list) = 
# 150 "lib/parser.mly"
                                ( ids )
# 2778 "lib/parser.ml"
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
# 2826 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Mini_ast.decl) = 
# 64 "lib/parser.mly"
                                                        ( TypeDef({name = _name; body = t}) )
# 2835 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _14;
          MenhirLib.EngineTypes.startp = _startpos__14_;
          MenhirLib.EngineTypes.endp = _endpos__14_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _13;
            MenhirLib.EngineTypes.startp = _startpos__13_;
            MenhirLib.EngineTypes.endp = _endpos__13_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = suggested_funcs;
              MenhirLib.EngineTypes.startp = _startpos_suggested_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_suggested_funcs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = required_funcs;
                MenhirLib.EngineTypes.startp = _startpos_required_funcs_;
                MenhirLib.EngineTypes.endp = _endpos_required_funcs_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _10;
                  MenhirLib.EngineTypes.startp = _startpos__10_;
                  MenhirLib.EngineTypes.endp = _endpos__10_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = recursive;
                    MenhirLib.EngineTypes.startp = _startpos_recursive_;
                    MenhirLib.EngineTypes.endp = _endpos_recursive_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _8;
                      MenhirLib.EngineTypes.startp = _startpos__8_;
                      MenhirLib.EngineTypes.endp = _endpos__8_;
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
                };
              };
            };
          };
        } = _menhir_stack in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let suggested_funcs : (string list) = Obj.magic suggested_funcs in
        let required_funcs : (string list) = Obj.magic required_funcs in
        let _10 : unit = Obj.magic _10 in
        let recursive : (bool) = Obj.magic recursive in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 2946 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2956 "lib/parser.ml"
           in
          (
# 136 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyUnitRetFunc (name, args), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 2965 "lib/parser.ml"
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
# 202 "lib/parser.mly"
      ( 0)
# 2991 "lib/parser.ml"
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
# 203 "lib/parser.mly"
                          ( t + 1 )
# 3037 "lib/parser.ml"
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
      "USE";
      "TYPE_KEYWORD";
      "SYNTHESIZE";
      "SUGGEST";
      "SHAREDTOLINEAR";
      "SESSION";
      "SENDVALUE";
      "SENDCHANNEL";
      "SEMICOLON";
      "S";
      "RSQUARE";
      "RPAR";
      "RELEASE";
      "REC_FUNC";
      "RECEIVEVALUE";
      "RECEIVECHANNEL";
      "REC";
      "RBRACE";
      "RAW";
      "MINUS";
      "LT";
      "LSQUARE";
      "LPAR";
      "LINEARTOSHARED";
      "LBRACE";
      "INTERNALCHOICE";
      "INT";
      "ID";
      "GT";
      "FUNC";
      "EXTERNALCHOICE";
      "EXCLAMATION";
      "EQ";
      "EOF";
      "END";
      "EITHER";
      "DEFINE_CHOICE";
      "COMMA";
      "COLON";
      "ATOMIC";
      "AT";
      "ACQUIRE";
      "#";
    |], [|
      "Accepting";
      "Reducing production arg -> ID COLON arg_type option(preceded(COLON,INT))";
      "Reducing production arg_type -> s_type";
      "Reducing production boption(REC_FUNC) ->";
      "Reducing production boption(REC_FUNC) -> REC_FUNC";
      "Reducing production choice -> EITHER LT s_type COMMA s_type GT";
      "Reducing production choice_branch -> ID COLON s_type";
      "Reducing production closed_func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE list(RAW) RBRACE";
      "Reducing production decl -> RAW";
      "Reducing production decl -> type_def";
      "Reducing production decl -> define_choice";
      "Reducing production decl -> func";
      "Reducing production decl -> unit_ret_func";
      "Reducing production decl -> closed_func";
      "Reducing production decl -> scheme_func";
      "Reducing production define_choice -> DEFINE_CHOICE EXCLAMATION LBRACE ID SEMICOLON separated_nonempty_list(COMMA,choice_branch) RBRACE";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE AT SYNTHESIZE boption(REC_FUNC) LSQUARE require_funcs suggest_funcs RSQUARE RBRACE";
      "Reducing production list(RAW) ->";
      "Reducing production list(RAW) -> RAW list(RAW)";
      "Reducing production list(decl) ->";
      "Reducing production list(decl) -> decl list(decl)";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) -> separated_nonempty_list(COMMA,arg)";
      "Reducing production option(preceded(COLON,INT)) ->";
      "Reducing production option(preceded(COLON,INT)) -> COLON INT";
      "Reducing production prog -> list(decl) EOF";
      "Reducing production require_funcs ->";
      "Reducing production require_funcs -> USE separated_nonempty_list(COMMA,ID) SEMICOLON";
      "Reducing production s_type -> ID";
      "Reducing production s_type -> ATOMIC";
      "Reducing production s_type -> INTERNALCHOICE LT choice GT";
      "Reducing production s_type -> EXTERNALCHOICE LT choice GT";
      "Reducing production s_type -> INTERNALCHOICE LT ID GT";
      "Reducing production s_type -> EXTERNALCHOICE LT ID GT";
      "Reducing production s_type -> SENDCHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> RECEIVECHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> SENDVALUE LT ID COMMA s_type GT";
      "Reducing production s_type -> SENDVALUE LT ATOMIC COMMA s_type GT";
      "Reducing production s_type -> RECEIVEVALUE LT ID COMMA s_type GT";
      "Reducing production s_type -> RECEIVEVALUE LT ATOMIC COMMA s_type GT";
      "Reducing production s_type -> END";
      "Reducing production s_type -> SHAREDTOLINEAR LT s_type GT";
      "Reducing production s_type -> LINEARTOSHARED LT s_type GT";
      "Reducing production s_type -> SESSION LT s_type GT";
      "Reducing production s_type -> REC LT s_type GT";
      "Reducing production s_type -> z_type";
      "Reducing production s_type -> RELEASE";
      "Reducing production s_type -> ACQUIRE";
      "Reducing production scheme_args -> separated_nonempty_list(COMMA,ATOMIC)";
      "Reducing production scheme_func -> FUNC ID LT scheme_args GT LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE AT SYNTHESIZE boption(REC_FUNC) LSQUARE require_funcs suggest_funcs RSQUARE RBRACE";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC COMMA separated_nonempty_list(COMMA,ATOMIC)";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID COMMA separated_nonempty_list(COMMA,ID)";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg COMMA separated_nonempty_list(COMMA,arg)";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch COMMA separated_nonempty_list(COMMA,choice_branch)";
      "Reducing production suggest_funcs ->";
      "Reducing production suggest_funcs -> SUGGEST separated_nonempty_list(COMMA,ID) SEMICOLON";
      "Reducing production type_def -> TYPE_KEYWORD ID EQ s_type SEMICOLON";
      "Reducing production unit_ret_func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR LBRACE AT SYNTHESIZE boption(REC_FUNC) LSQUARE require_funcs suggest_funcs RSQUARE RBRACE";
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
      | T_USE : unit terminal
      | T_TYPE_KEYWORD : unit terminal
      | T_SYNTHESIZE : unit terminal
      | T_SUGGEST : unit terminal
      | T_SHAREDTOLINEAR : unit terminal
      | T_SESSION : unit terminal
      | T_SENDVALUE : unit terminal
      | T_SENDCHANNEL : unit terminal
      | T_SEMICOLON : unit terminal
      | T_S : unit terminal
      | T_RSQUARE : unit terminal
      | T_RPAR : unit terminal
      | T_RELEASE : unit terminal
      | T_REC_FUNC : unit terminal
      | T_RECEIVEVALUE : unit terminal
      | T_RECEIVECHANNEL : unit terminal
      | T_REC : unit terminal
      | T_RBRACE : unit terminal
      | T_RAW : (
# 5 "lib/parser.mly"
       (string)
# 3198 "lib/parser.ml"
    ) terminal
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LSQUARE : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_LBRACE : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_INT : (
# 8 "lib/parser.mly"
       (int)
# 3210 "lib/parser.ml"
    ) terminal
      | T_ID : (
# 6 "lib/parser.mly"
       (string)
# 3215 "lib/parser.ml"
    ) terminal
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
      | T_ATOMIC : (
# 7 "lib/parser.mly"
       (string)
# 3231 "lib/parser.ml"
    ) terminal
      | T_AT : unit terminal
      | T_ACQUIRE : unit terminal
    
    type _ nonterminal = 
      | N_z_type : (int) nonterminal
      | N_unit_ret_func : (Mini_ast.decl) nonterminal
      | N_type_def : (Mini_ast.decl) nonterminal
      | N_suggest_funcs : (string list) nonterminal
      | N_separated_nonempty_list_COMMA_choice_branch_ : ((string * Mini_ast.ty) list) nonterminal
      | N_separated_nonempty_list_COMMA_arg_ : (((string * Mini_ast.ty) * int) list) nonterminal
      | N_separated_nonempty_list_COMMA_ID_ : (string list) nonterminal
      | N_separated_nonempty_list_COMMA_ATOMIC_ : (string list) nonterminal
      | N_scheme_func : (Mini_ast.decl) nonterminal
      | N_scheme_args : (Mini_ast.ty list) nonterminal
      | N_s_type : (Mini_ast.ty) nonterminal
      | N_require_funcs : (string list) nonterminal
      | N_prog : (Mini_ast.decl list) nonterminal
      | N_option_preceded_COLON_INT__ : (int option) nonterminal
      | N_loption_separated_nonempty_list_COMMA_arg__ : (((string * Mini_ast.ty) * int) list) nonterminal
      | N_list_decl_ : (Mini_ast.decl list) nonterminal
      | N_list_RAW_ : (string list) nonterminal
      | N_func : (Mini_ast.decl) nonterminal
      | N_define_choice : (Mini_ast.choice) nonterminal
      | N_decl : (Mini_ast.decl) nonterminal
      | N_closed_func : (Mini_ast.decl) nonterminal
      | N_choice_branch : (string * Mini_ast.ty) nonterminal
      | N_choice : (Mini_ast.choice) nonterminal
      | N_boption_REC_FUNC_ : (bool) nonterminal
      | N_arg_type : (Mini_ast.ty) nonterminal
      | N_arg : ((string * Mini_ast.ty) * int) nonterminal
    
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
            X (T T_USE)
        | 3 ->
            X (T T_TYPE_KEYWORD)
        | 4 ->
            X (T T_SYNTHESIZE)
        | 5 ->
            X (T T_SUGGEST)
        | 6 ->
            X (T T_SHAREDTOLINEAR)
        | 7 ->
            X (T T_SESSION)
        | 8 ->
            X (T T_SENDVALUE)
        | 9 ->
            X (T T_SENDCHANNEL)
        | 10 ->
            X (T T_SEMICOLON)
        | 11 ->
            X (T T_S)
        | 12 ->
            X (T T_RSQUARE)
        | 13 ->
            X (T T_RPAR)
        | 14 ->
            X (T T_RELEASE)
        | 15 ->
            X (T T_REC_FUNC)
        | 16 ->
            X (T T_RECEIVEVALUE)
        | 17 ->
            X (T T_RECEIVECHANNEL)
        | 18 ->
            X (T T_REC)
        | 19 ->
            X (T T_RBRACE)
        | 20 ->
            X (T T_RAW)
        | 21 ->
            X (T T_MINUS)
        | 22 ->
            X (T T_LT)
        | 23 ->
            X (T T_LSQUARE)
        | 24 ->
            X (T T_LPAR)
        | 25 ->
            X (T T_LINEARTOSHARED)
        | 26 ->
            X (T T_LBRACE)
        | 27 ->
            X (T T_INTERNALCHOICE)
        | 28 ->
            X (T T_INT)
        | 29 ->
            X (T T_ID)
        | 30 ->
            X (T T_GT)
        | 31 ->
            X (T T_FUNC)
        | 32 ->
            X (T T_EXTERNALCHOICE)
        | 33 ->
            X (T T_EXCLAMATION)
        | 34 ->
            X (T T_EQ)
        | 35 ->
            X (T T_EOF)
        | 36 ->
            X (T T_END)
        | 37 ->
            X (T T_EITHER)
        | 38 ->
            X (T T_DEFINE_CHOICE)
        | 39 ->
            X (T T_COMMA)
        | 40 ->
            X (T T_COLON)
        | 41 ->
            X (T T_ATOMIC)
        | 42 ->
            X (T T_AT)
        | 43 ->
            X (T T_ACQUIRE)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 26 ->
            X (N N_arg)
        | 25 ->
            X (N N_arg_type)
        | 24 ->
            X (N N_boption_REC_FUNC_)
        | 23 ->
            X (N N_choice)
        | 22 ->
            X (N N_choice_branch)
        | 21 ->
            X (N N_closed_func)
        | 20 ->
            X (N N_decl)
        | 19 ->
            X (N N_define_choice)
        | 18 ->
            X (N N_func)
        | 17 ->
            X (N N_list_RAW_)
        | 16 ->
            X (N N_list_decl_)
        | 15 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 14 ->
            X (N N_option_preceded_COLON_INT__)
        | 13 ->
            X (N N_prog)
        | 12 ->
            X (N N_require_funcs)
        | 11 ->
            X (N N_s_type)
        | 10 ->
            X (N N_scheme_args)
        | 9 ->
            X (N N_scheme_func)
        | 8 ->
            X (N N_separated_nonempty_list_COMMA_ATOMIC_)
        | 7 ->
            X (N N_separated_nonempty_list_COMMA_ID_)
        | 6 ->
            X (N N_separated_nonempty_list_COMMA_arg_)
        | 5 ->
            X (N N_separated_nonempty_list_COMMA_choice_branch_)
        | 4 ->
            X (N N_suggest_funcs)
        | 3 ->
            X (N N_type_def)
        | 2 ->
            X (N N_unit_ret_func)
        | 1 ->
            X (N N_z_type)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\b<F\004\014.\016.\018.<P\020.\024.\003>\030\".<P$.&.4.8.<>L.<B.<>/>JTX\003\023P\023>/>\023>\023>\023P\023>\023>TP\023>\023P\023>\023>TP\023>\023>\023>\023\022*@<.TP\017\017\021>2<R\0233R:\029\r\031\028,>\0236V\n 10\006<P\015\015\022\025\012\015\022\t\026(5P\r2\031\028,>\0236*#V\n10\025\t\026(#(6V\n10\025\t\026(ND6<\022<R\023\011(-P\011\005\007\019\027!H%')!+")
    
    and rhs =
      ((8, "\027<R3\029\023 L.\023P\023><R\023@<2\031\028,>\0236#(*\007'%\005+\019ND6<\022\011(@<2\031\028,>\0236V\n10\025\t\026(*#)!\rR:!H\006\015\022<T8./>B./>8.<>B.<>\020.\023P\023>$.\023P\023>\018.<P\023>\018.TP\023>\".<P\023>\".TP\023>J\014.\023>4.\023>\016.\023>&.\023>\003\030X\017@<.\021>2\031\028,>\0236V\n10\025\t\026(TTP\017<<P\01555P\r--P\011\012\015\022\b<F\023\022@<2\031\0286V\n10\025\t\026(\004\024.\003>"), (8, "\000\001\005\006\006\007\r\016\027\028\029\030\031 !\")::<<>>??ACCFGHLPTX^djpv|}\129\133\137\141\142\143\144\145\165\166\169\170\173\174\177\178\181\181\184\189\203\204\208"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\127\128\129\130\131\132\133\134\135\136\137\138\139\140\141\142\143\144\145\146\147\148\149\150\151\152\153\154\155\156\157\158\159\160\161\162\163\164\165\166\167\168\169\170\171\172\173\174\175\176\177\178\179\180")
    
    and lr0_items =
      ((16, "\000\000\240\001\240\002\240\003\248\001\164\001\164\002\172\001\172\002\148\001\144\001\148\002\144\002\144\003\144\004\136\001\136\002\252\001\252\002\252\003\252\004\184\001\156\001\152\001\156\002\152\002\152\003\152\004\140\001\140\002\176\001\176\002\168\001\168\002\128\001x\001\128\002x\002\128\003\128\004\020\001\020\002p\001\132\001|\001\132\002|\002\132\003\132\004|\003|\004\160\001t\001\188\001\180\001\020\003\020\004\020\005\020\006x\003x\004\168\003\168\004\176\003\176\004\140\003\140\004\140\005\140\006\152\005\152\006\156\003\156\004\156\005\156\006\136\003\136\004\136\005\136\006\144\005\144\006\148\003\148\004\148\005\148\006\172\003\172\004\164\003\164\004\240\004\240\005 \001\244\001\196\001@\001\028\001\244\002\196\002@\002\028\002\196\003\204\001\200\001\204\002\204\003\192\001\196\004\196\005\196\006\004\001\004\002\b\001\004\003`\001`\002\004\004X\001\196\007\196\b\196\t\196\n\196\011\196\012\196\r\196\014\016\001\196\015\196\016l\001\212\001\208\001\212\002\212\003l\002l\003\196\017\236\001\236\002\236\003\196\018\196\019\196\020\220\001\216\001\220\002\220\003\244\003@\003\028\003\244\004@\004\028\004\244\005@\005\028\005@\006\028\006@\007\028\007@\b\028\b@\t\028\tH\001H\002@\n@\011@\012@\r@\014@\015@\016@\017\028\n\028\011\244\006\244\007\244\b\244\t\244\n\244\011\244\012\244\r\244\014<\001<\002<\003<\004<\005\024\001\024\002\024\003<\006<\007\228\001\224\001\228\002\228\0030\001$\0018\001\000\001d\001d\002,\001(\001P\001P\0024\001"), (8, "\000\001\002\003\004\005\006\007\b\t\011\r\014\015\016\017\018\019\020\021\022\024\026\027\028\029\030\031 !\"$&'()*+-/0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\`deghijklmnopqrstuvwxyz{|}~\127\128\129\131\132\133\134\135\136\137\138\139\140\141\142\144\145\146\149\152\155\157\159\161\163\164\165\166\167\168\169\170\171\172\173\174\175\176\177\178\179\180\181\182\183\184\185\186\187\188\189\190\191\192\193\194\196\197\198\199\200\201\202\203\204\205\206\207\208\209"))
    
    and nullable =
      "\b\011\192\128"
    
    and first =
      (44, "\016\000\b\001\018\004\001\000\000\000\000\000\000\000\001\000\001\000\000\000\000\000\004\000\000\000\000\000\000\000\000@\000\000\000\000\004\000\000\000\000\000@\000\000\000\000\000\000@\000\000\000\016\000\000\000\000\000\000D=.\005H\133 \000\000\000\000\001\000\000\128\017 \000\000\000\000\000\128\000\000\000@\000\016\000\b\001\002\000\000\000\128\000\000\000\000\000\001\000\000\000\000\000\000 \016\000\b\001\002\000\000\000\000\016\000\000\000\000\004\000\000\000\000\000\000@\000\001\000\000\000\004=.\005H\133\000\000\000\004\000\000")
    
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
