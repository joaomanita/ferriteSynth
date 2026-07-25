
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
    | RAW of (
# 5 "lib/parser.mly"
       (string)
# 37 "lib/parser.ml"
  )
    | MINUS
    | LT
    | LSQUARE
    | LPAR
    | LINEARTOSHARED
    | LBRACE
    | INTERNALCHOICE
    | ID of (
# 6 "lib/parser.mly"
       (string)
# 49 "lib/parser.ml"
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
# 65 "lib/parser.ml"
  )
    | AT
    | ACQUIRE
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast

# 78 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ACQUIRE ->
          40
      | AT ->
          39
      | ATOMIC _ ->
          38
      | COLON ->
          37
      | COMMA ->
          36
      | DEFINE_CHOICE ->
          35
      | EITHER ->
          34
      | END ->
          33
      | EOF ->
          32
      | EQ ->
          31
      | EXCLAMATION ->
          30
      | EXTERNALCHOICE ->
          29
      | FUNC ->
          28
      | GT ->
          27
      | ID _ ->
          26
      | INTERNALCHOICE ->
          25
      | LBRACE ->
          24
      | LINEARTOSHARED ->
          23
      | LPAR ->
          22
      | LSQUARE ->
          21
      | LT ->
          20
      | MINUS ->
          19
      | RAW _ ->
          18
      | RBRACE ->
          17
      | REC ->
          16
      | RECEIVECHANNEL ->
          15
      | RECEIVEVALUE ->
          14
      | RELEASE ->
          13
      | RPAR ->
          12
      | RSQUARE ->
          11
      | S ->
          10
      | SEMICOLON ->
          9
      | SENDCHANNEL ->
          8
      | SENDVALUE ->
          7
      | SESSION ->
          6
      | SHAREDTOLINEAR ->
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
# 182 "lib/parser.ml"
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
# 210 "lib/parser.ml"
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
# 230 "lib/parser.ml"
          ))
      | RBRACE ->
          Obj.repr ()
      | REC ->
          Obj.repr ()
      | RECEIVECHANNEL ->
          Obj.repr ()
      | RECEIVEVALUE ->
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
      | SYNTHESIZE ->
          Obj.repr ()
      | TYPE_KEYWORD ->
          Obj.repr ()
      | USE ->
          Obj.repr ()
      | Z ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000:\000\000\000\000\000\000\000\000\000\000\000\000\000;*\000\000\000\000\000\000\000\000\000\000\000\000\000\028\000\000\024\000\000\000\029\000\027$\025+)\000\000\000\004\000\026\000&\000(\000\000\000\031\000\"\000\000\000#\000\000\000\030\000 \000\000\000!\000'\000%\0006\b\000\000\000\000\000/,\000\000\000\000\000\003\002\022\000\000\000\000\000\000\000\018\000\000\000\000\000\0001\0009\000\000-\000\007\000\0003\000\000\000\000\000\000\000\000\000\000\000\000\016\000\006\000\000\000\000\000\0007\000\000\000\000\000\000\000\005\000\015\000\0005\012\t\014\001\000\023\011\n\000\020\r")
  
  and error =
    (41, "\016\000 \b\144\000\000\000\016\000\000\000\000\000@\b\244\240,\136P\000\000\000\000\000\000\000@\000\001\030\158\005\145\n\000\000\016\000\000G\167\129dB\128\000\004\000\000\000\000\000\b\000\128\000\000\000\001\004zx\022D(\000\000@\000\001\030\158\005\145\n\000\000\016\000\000@ \000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\001\000\016\000\000\000\000 \143O\002\200\133\000\000\b\000\000#\211\192\178!@\000\002\000\000\b\244\240,\136P\000\000\128\000\002=<\011\"\020\000\000 \000\000\000\000\000@@\000\000\000\016\000\000\000\000\000\000\000\000\002\000\000\b\244\240,\136P\000\000\000\000\000\000\000@\000\000\000\000\000\128\128\000\000\000 \000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016G\167\129dB\128\000\000\b\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\004\017\233\224Y\016\160\000\000\002\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\016G\167\129dB\128\000\000\b\000\000\000\000\000\000\000\000\000\000\001\004zx\022D(\000\000\000\128\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\004\017\233\224Y\016\160\000\000\002\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000P\000\000\000\000\000\000\b\000\000\000 \016\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000 \000\000\000@\001\000\000\000\000\000\000\016\143O\002\200\133\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\001\000\000\000\000\000\000\128\001\030\158\005\145\n\000\000\001\000\000\000\000`\000\001\000\0000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000@\000\001\000\128\000\000\000\000\000\000\128\000\000\128\000\000\016\000\000\000 \000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\004\000\000\004\000\000\000\b\000\000\000\000\000\000\000\000\128\002\000\000\000@\000\000\000\000\000B\000\000\000\000\000 \000G\167\129dB\128\000\000@\000\000\000\024\000\000A\000\000\000\000\000\000\000@\000\001\000\128\000\000\000\000@\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000 \128\000\000\000\000\000\000 \000\000\128@\000\000\000\000 \000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\016\000\000\000\000\002\000\000\002\000\000\000\000\000\000\000\128\000\000\000\000\000\bG\167\129dB\128\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\004\000\000\128\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000@\017 \000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\005\031\152\003\000p\003\162\003|$\172\0032\003X\003\132\000\000\150\016\136\003\176\003\144\003\186\003\190\007\180\000\200\003\000\2081\198\0008\000\000\000\000\000@\003Z\000d\000\158\000~\000`\003v\000\134\000x\003\142\000\138\003\152\000\150\000\128\003\140\000\164\000\168\000\164\000\000~:\152\028\152\000\000lt\"\158\003\000\000\000~\200X\003\194\006\006\000~ZH\194\003\194\000d\000\228P\000J\000\019\"\000\"t:>\003\188\002pPHf\190\000\186\0004\168\156H\152r\000Nv^\140vR\003\000F\000\000v\000\000\000\000\000>\000\000\000\005\000\000"), (16, "\000\018\000\006\000\158\000\197\000\022\000\030\000&\0006\000\189\000>\000\138\000\n\000N\000R\000b\000j\001N\000\205\000A\001\166\000A\001\166\000r\000\130\000z\000\146\001R\001\234\000\150\000Q\000I\000\138\000\174\002J\000Z\001\194\002v\000\178\001\186\000\182\002\014\000\181\001\174\001z\000.\000:\000\254\000\221\001\254\001Z\001b\001\242\002n\002.\001\226\000\170\001&\001\218\002\002\001\206\002\018\002\022\002\030\002\147\000B\0022\001\182\001\178\000\194\002N\001\250\001\154\000\202\002V\002F\001\146\000\026\000\210\002b\002Z\001v\001r\000*\002R\000\234\002^\000\242\002B\0026\001V\000\226\001J\000n\000J\000\250\000V\001\002\0012\001\n\002:\001*\000\"\001\"\001\026\000^\001\018\000\218\000\014\000f\001:\002*\001B\002\"\000v\001^\000~\001~\000\134\002\n\001\150\000\142\001\162\0002\001\190\000\154\001\214\000\162"))
  
  and lhs =
    (8, "\000\023\022\021\020\019\019\018\018\018\018\018\018\018\017\016\015\015\014\014\r\r\012\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\n\t\b\b\007\007\006\006\005\005\004\003\002\002\001\001")
  
  and goto =
    ((8, "\007\000\000\130\000\0002\000V\000\000\0000\000\138\000\002\000\000\000\000\000\000L\000p\000J\000H\000t\000\000\000t\000\0002\000\000\000\000\000\000\000\000\000.\000\000\000\000\000\000\000\000\000f\000\000\000\000\000T\000\000\000~\000\000\000\000\000X\000\000\000\000\000\000\000\000\000\000\000n\000\134\000\000\000\000\007\000$\000\000\000\000\000\000r\000t~\000\000\000\150\130\000\128\000\000\000\000\000\000\000\000\000\005\000\003\000\000\000b\000\015\000\000\158\000\000\000\000\000\000\000\000\n\000\000\000\000\000\000\000H\000d\000\000\000\000,\000\000\000\000\000\000\000\000\000\028\000\000"), (8, "\160\161\018c|c\162\144\138\163d\164~\166\167\168\170\160\161/zzz\162///\159\169a\166\167\168\1702HP///b\155\157///*68>///BNL\157///\130\154<[/\\/:h0/rsxFZRuk4D\135"))
  
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
# 313 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 175 "lib/parser.mly"
                                       ( (arg_name, t) )
# 321 "lib/parser.ml"
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
# 178 "lib/parser.mly"
                ( t )
# 346 "lib/parser.ml"
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
# 87 "lib/parser.mly"
      ( (TyEither (t1, t2)) )
# 406 "lib/parser.ml"
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
# 441 "lib/parser.ml"
        ) = Obj.magic lbl in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_lbl_ in
        let _endpos = _endpos_ty_ in
        let _v : (string * Mini_ast.ty) = 
# 91 "lib/parser.mly"
    (
      (lbl, ty)
    )
# 451 "lib/parser.ml"
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
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 541 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__11_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 551 "lib/parser.ml"
           in
          (
# 137 "lib/parser.mly"
                                                                                                                            ( ClosedFunction((TyFunc(((name, ars), ret), []), String.concat "" body)) )
# 556 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _14;
          MenhirLib.EngineTypes.startp = _startpos__14_;
          MenhirLib.EngineTypes.endp = _endpos__14_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = body;
            MenhirLib.EngineTypes.startp = _startpos_body_;
            MenhirLib.EngineTypes.endp = _endpos_body_;
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
        } = _menhir_stack in
        let _14 : unit = Obj.magic _14 in
        let body : (string list) = Obj.magic body in
        let _12 : unit = Obj.magic _12 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let tList : (Mini_ast.ty list) = Obj.magic tList in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 668 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 678 "lib/parser.ml"
           in
          (
# 145 "lib/parser.mly"
    (
      ClosedFunction
        ((TySchemeFunc
           (tList,
            (((name, ars), ret), []))), String.concat "" body)
    )
# 688 "lib/parser.ml"
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
# 710 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 52 "lib/parser.mly"
               ( Raw(text) )
# 718 "lib/parser.ml"
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
# 53 "lib/parser.mly"
                    ( tdef )
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
# 54 "lib/parser.mly"
                         ( ChoiceDef(cdef) )
# 768 "lib/parser.ml"
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
# 55 "lib/parser.mly"
             ( f )
# 793 "lib/parser.ml"
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
# 56 "lib/parser.mly"
                      ( f )
# 818 "lib/parser.ml"
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
# 57 "lib/parser.mly"
                           ( closed_f )
# 843 "lib/parser.ml"
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
# 868 "lib/parser.ml"
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
# 928 "lib/parser.ml"
        ) = Obj.magic name in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Mini_ast.choice) = 
# 100 "lib/parser.mly"
    (
      (TyDefineChoice (name, branches))
    )
# 941 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _15;
          MenhirLib.EngineTypes.startp = _startpos__15_;
          MenhirLib.EngineTypes.endp = _endpos__15_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _14;
            MenhirLib.EngineTypes.startp = _startpos__14_;
            MenhirLib.EngineTypes.endp = _endpos__14_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = funcs;
              MenhirLib.EngineTypes.startp = _startpos_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_funcs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _12;
                MenhirLib.EngineTypes.startp = _startpos__12_;
                MenhirLib.EngineTypes.endp = _endpos__12_;
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
        } = _menhir_stack in
        let _15 : unit = Obj.magic _15 in
        let _14 : unit = Obj.magic _14 in
        let funcs : (string list) = Obj.magic funcs in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
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
# 1059 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__15_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 1069 "lib/parser.ml"
           in
          (
# 114 "lib/parser.mly"
    (
      Function (TyFunc (((name, ars), ret), funcs))
    )
# 1076 "lib/parser.ml"
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
# 1123 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1131 "lib/parser.ml"
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
# 1149 "lib/parser.ml"
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
# 1181 "lib/parser.ml"
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
# 1199 "lib/parser.ml"
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
# 1224 "lib/parser.ml"
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
# 49 "lib/parser.mly"
                        ( d )
# 1256 "lib/parser.ml"
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
# 1277 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 64 "lib/parser.mly"
                                                                         ( TyPrimitive(id) )
# 1285 "lib/parser.ml"
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
# 1306 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 65 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 1314 "lib/parser.ml"
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
# 66 "lib/parser.mly"
                                                                         ( TyInternalChoice(c) )
# 1360 "lib/parser.ml"
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
# 67 "lib/parser.mly"
                                                                         ( TyExternalChoice(c) )
# 1406 "lib/parser.ml"
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
# 1446 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 68 "lib/parser.mly"
                                                                         ( TyInternalChoiceId(id) )
# 1456 "lib/parser.ml"
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
# 1496 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 69 "lib/parser.mly"
                                                                         ( TyExternalChoiceId(id) )
# 1506 "lib/parser.ml"
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
# 70 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
# 1566 "lib/parser.ml"
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
# 71 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 1626 "lib/parser.ml"
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
# 1680 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 72 "lib/parser.mly"
                                                                         ( TySendValue(TyPrimitive id, cont) )
# 1690 "lib/parser.ml"
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
# 1744 "lib/parser.ml"
        ) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 73 "lib/parser.mly"
                                                                         ( TySendValue(TyAtomic a, cont) )
# 1754 "lib/parser.ml"
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
# 1808 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 74 "lib/parser.mly"
                                                                         ( TyReceiveValue(TyPrimitive id, cont) )
# 1818 "lib/parser.ml"
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
# 1872 "lib/parser.ml"
        ) = Obj.magic a in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 75 "lib/parser.mly"
                                                                         ( TyReceiveValue(TyAtomic a, cont) )
# 1882 "lib/parser.ml"
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
# 76 "lib/parser.mly"
                                                                         ( TyEnd )
# 1907 "lib/parser.ml"
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
# 77 "lib/parser.mly"
                                                                         ( TySharedToLinear(t, 0) )
# 1953 "lib/parser.ml"
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
# 78 "lib/parser.mly"
                                                                         ( TyLinearToShared(t, 0) )
# 1999 "lib/parser.ml"
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
# 79 "lib/parser.mly"
                                                                         ( TySession(t) )
# 2045 "lib/parser.ml"
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
                                                                         ( TyRec(t) )
# 2091 "lib/parser.ml"
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
# 81 "lib/parser.mly"
                                                                         ( TyZ (t) )
# 2116 "lib/parser.ml"
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
# 82 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2141 "lib/parser.ml"
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
# 83 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2166 "lib/parser.ml"
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
# 154 "lib/parser.mly"
      ( List.map (fun t -> TyAtomic t) ts )
# 2191 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _18;
          MenhirLib.EngineTypes.startp = _startpos__18_;
          MenhirLib.EngineTypes.endp = _endpos__18_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _17;
            MenhirLib.EngineTypes.startp = _startpos__17_;
            MenhirLib.EngineTypes.endp = _endpos__17_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = funcs;
              MenhirLib.EngineTypes.startp = _startpos_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_funcs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _15;
                MenhirLib.EngineTypes.startp = _startpos__15_;
                MenhirLib.EngineTypes.endp = _endpos__15_;
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
        } = _menhir_stack in
        let _18 : unit = Obj.magic _18 in
        let _17 : unit = Obj.magic _17 in
        let funcs : (string list) = Obj.magic funcs in
        let _15 : unit = Obj.magic _15 in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let _12 : unit = Obj.magic _12 in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let tList : (Mini_ast.ty list) = Obj.magic tList in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 2330 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__18_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2340 "lib/parser.ml"
           in
          (
# 167 "lib/parser.mly"
    (
      Function
        (TySchemeFunc
           (tList,
            (((name, ars), ret), funcs)))
    )
# 2350 "lib/parser.ml"
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
# 2372 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2380 "lib/parser.ml"
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
# 2415 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2423 "lib/parser.ml"
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
# 2444 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2452 "lib/parser.ml"
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
# 2487 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2495 "lib/parser.ml"
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
# 2520 "lib/parser.ml"
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
# 2559 "lib/parser.ml"
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
# 2584 "lib/parser.ml"
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
# 2623 "lib/parser.ml"
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
# 2671 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Mini_ast.decl) = 
# 61 "lib/parser.mly"
                                                        ( TypeDef({name = _name; body = t}) )
# 2680 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _12;
          MenhirLib.EngineTypes.startp = _startpos__12_;
          MenhirLib.EngineTypes.endp = _endpos__12_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _11;
            MenhirLib.EngineTypes.startp = _startpos__11_;
            MenhirLib.EngineTypes.endp = _endpos__11_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = funcs;
              MenhirLib.EngineTypes.startp = _startpos_funcs_;
              MenhirLib.EngineTypes.endp = _endpos_funcs_;
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
        } = _menhir_stack in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let funcs : (string list) = Obj.magic funcs in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 2777 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__12_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2787 "lib/parser.ml"
           in
          (
# 127 "lib/parser.mly"
    (
      Function (TyUnitRetFunc ((name, ars), funcs))
    )
# 2794 "lib/parser.ml"
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
# 132 "lib/parser.mly"
                                ( [] )
# 2813 "lib/parser.ml"
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
# 134 "lib/parser.mly"
                                ( ids )
# 2852 "lib/parser.ml"
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
# 181 "lib/parser.mly"
      ( 0)
# 2877 "lib/parser.ml"
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
# 182 "lib/parser.mly"
                          ( t + 1 )
# 2923 "lib/parser.ml"
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
      "SHAREDTOLINEAR";
      "SESSION";
      "SENDVALUE";
      "SENDCHANNEL";
      "SEMICOLON";
      "S";
      "RSQUARE";
      "RPAR";
      "RELEASE";
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
      "Reducing production arg -> ID COLON arg_type";
      "Reducing production arg_type -> s_type";
      "Reducing production choice -> EITHER LT s_type COMMA s_type GT";
      "Reducing production choice_branch -> ID COLON s_type";
      "Reducing production closed_func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE list(RAW) RBRACE";
      "Reducing production closed_func -> FUNC ID LT scheme_args GT LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE list(RAW) RBRACE";
      "Reducing production decl -> RAW";
      "Reducing production decl -> type_def";
      "Reducing production decl -> define_choice";
      "Reducing production decl -> func";
      "Reducing production decl -> unit_ret_func";
      "Reducing production decl -> closed_func";
      "Reducing production decl -> scheme_func";
      "Reducing production define_choice -> DEFINE_CHOICE EXCLAMATION LBRACE ID SEMICOLON separated_nonempty_list(COMMA,choice_branch) RBRACE";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE AT SYNTHESIZE LSQUARE used_funcs RSQUARE RBRACE";
      "Reducing production list(RAW) ->";
      "Reducing production list(RAW) -> RAW list(RAW)";
      "Reducing production list(decl) ->";
      "Reducing production list(decl) -> decl list(decl)";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) -> separated_nonempty_list(COMMA,arg)";
      "Reducing production prog -> list(decl) EOF";
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
      "Reducing production scheme_func -> FUNC ID LT scheme_args GT LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type LBRACE AT SYNTHESIZE LSQUARE used_funcs RSQUARE RBRACE";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC COMMA separated_nonempty_list(COMMA,ATOMIC)";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID COMMA separated_nonempty_list(COMMA,ID)";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg COMMA separated_nonempty_list(COMMA,arg)";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch COMMA separated_nonempty_list(COMMA,choice_branch)";
      "Reducing production type_def -> TYPE_KEYWORD ID EQ s_type SEMICOLON";
      "Reducing production unit_ret_func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR LBRACE AT SYNTHESIZE LSQUARE used_funcs RSQUARE RBRACE";
      "Reducing production used_funcs ->";
      "Reducing production used_funcs -> USE separated_nonempty_list(COMMA,ID) SEMICOLON";
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
      | T_RAW : (
# 5 "lib/parser.mly"
       (string)
# 3074 "lib/parser.ml"
    ) terminal
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LSQUARE : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_LBRACE : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_ID : (
# 6 "lib/parser.mly"
       (string)
# 3086 "lib/parser.ml"
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
# 3102 "lib/parser.ml"
    ) terminal
      | T_AT : unit terminal
      | T_ACQUIRE : unit terminal
    
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
            X (T T_SHAREDTOLINEAR)
        | 6 ->
            X (T T_SESSION)
        | 7 ->
            X (T T_SENDVALUE)
        | 8 ->
            X (T T_SENDCHANNEL)
        | 9 ->
            X (T T_SEMICOLON)
        | 10 ->
            X (T T_S)
        | 11 ->
            X (T T_RSQUARE)
        | 12 ->
            X (T T_RPAR)
        | 13 ->
            X (T T_RELEASE)
        | 14 ->
            X (T T_RECEIVEVALUE)
        | 15 ->
            X (T T_RECEIVECHANNEL)
        | 16 ->
            X (T T_REC)
        | 17 ->
            X (T T_RBRACE)
        | 18 ->
            X (T T_RAW)
        | 19 ->
            X (T T_MINUS)
        | 20 ->
            X (T T_LT)
        | 21 ->
            X (T T_LSQUARE)
        | 22 ->
            X (T T_LPAR)
        | 23 ->
            X (T T_LINEARTOSHARED)
        | 24 ->
            X (T T_LBRACE)
        | 25 ->
            X (T T_INTERNALCHOICE)
        | 26 ->
            X (T T_ID)
        | 27 ->
            X (T T_GT)
        | 28 ->
            X (T T_FUNC)
        | 29 ->
            X (T T_EXTERNALCHOICE)
        | 30 ->
            X (T T_EXCLAMATION)
        | 31 ->
            X (T T_EQ)
        | 32 ->
            X (T T_EOF)
        | 33 ->
            X (T T_END)
        | 34 ->
            X (T T_EITHER)
        | 35 ->
            X (T T_DEFINE_CHOICE)
        | 36 ->
            X (T T_COMMA)
        | 37 ->
            X (T T_COLON)
        | 38 ->
            X (T T_ATOMIC)
        | 39 ->
            X (T T_AT)
        | 40 ->
            X (T T_ACQUIRE)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 23 ->
            X (N N_arg)
        | 22 ->
            X (N N_arg_type)
        | 21 ->
            X (N N_choice)
        | 20 ->
            X (N N_choice_branch)
        | 19 ->
            X (N N_closed_func)
        | 18 ->
            X (N N_decl)
        | 17 ->
            X (N N_define_choice)
        | 16 ->
            X (N N_func)
        | 15 ->
            X (N N_list_RAW_)
        | 14 ->
            X (N N_list_decl_)
        | 13 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 12 ->
            X (N N_prog)
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
            X (N N_type_def)
        | 3 ->
            X (N N_unit_ret_func)
        | 2 ->
            X (N N_used_funcs)
        | 1 ->
            X (N N_z_type)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\b6@\004\012*\014*\016*6J\018*\022*\0038\028\030*6J *\"*0*4*68F*6<*68+8DNR\003\023J\0238+8\0238\0238\023J\0238\0238NJ\0238\023J\0238\0238NJ\0238\0238\0238\023\020&:6*NJ\017\017\0218.6L\023-\r\027\026(8\0232&\031P\n,\0066J\015\015\020\005\024$\031$/J\r.\027\026(8\0232P\n,\005\024$\031$2P\n,\005\024$H>26\0206L\023\011$)J\011\007\t\019\025\029B!#%\029'")
    
    and rhs =
      ((8, "\0256L-\023F*\023J\02386L\023:6.\027\026(8\0232\031$:6*\0218.\027\026(8\0232\031$&\t#!\007'\019H>26\020\011$:6.\027\026(8\0232P\n,\005\024$&\031%\029\r\029B6N4*+8<*+84*68<*68\018*\023J\0238 *\023J\0238\016*6J\0238\016*NJ\0238\030*6J\0238\030*NJ\0238D\012*\02380*\0238\014*\0238\"*\0238\003\028R\017:6*\0218.\027\026(8\0232P\n,\005\024$NNJ\01766J\015//J\r))J\011\b6@\023\020:6.\027\0262P\n,\005\024$\006\015\020\004\022*\0038"), (8, "\000\001\004\005\011\014\025'()*+,-.5DDFFHHIKLMQUY]ciou{\129\130\134\138\142\146\147\148\149\150\168\169\172\173\176\177\180\181\184\189\201\201\204\205\209"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\127\128\129\130\131\132\133\134\135\136\137\138\139\140\141\142\143\144\145\146\147\148\149\150\151\152\153\154\155\156\157\158\159\160\161\162\163\164\165\166\167\168\169")
    
    and lr0_items =
      ((16, "\000\000\212\001\212\002\212\003\228\001\144\001\144\002\152\001\152\002\128\001|\001\128\002|\002|\003|\004t\001t\002\232\001\232\002\232\003\232\004\164\001\136\001\132\001\136\002\132\002\132\003\132\004x\001x\002\156\001\156\002\148\001\148\002l\001d\001l\002d\002l\003l\004\012\001\012\002\\\001p\001h\001p\002h\002p\003p\004h\003h\004\140\001`\001\168\001\160\001\012\003\012\004\012\005\012\006d\003d\004\148\003\148\004\156\003\156\004x\003x\004x\005x\006\132\005\132\006\136\003\136\004\136\005\136\006t\003t\004t\005t\006|\005|\006\128\003\128\004\128\005\128\006\152\003\152\004\144\003\144\004\212\004\212\005\028\001\216\001\176\001<\001\024\001\020\001\216\002\176\002<\002\024\002\020\002\176\003\024\003\184\001\180\001\184\002\184\003\172\001\176\004\024\004\176\005\024\005\176\006\024\006\004\001\004\002\b\001\004\003T\001\176\007\024\007\176\b\024\b\176\t\024\t\176\n\024\n\176\011\024\011\176\012\024\012D\001D\002\176\r\176\014\176\015\224\001\192\001\188\001\192\002\192\003\224\002\224\003\176\016\176\017\176\018\024\r\024\014\200\001\196\001\200\002\200\003\216\003<\003\020\003\216\004<\004\020\004\216\005<\005\020\005<\006\020\006<\007\020\007<\b\020\b<\t\020\t<\n<\011<\012<\r<\014<\015\020\n\020\011\216\006\216\007\216\b\216\t\216\n\216\011\216\0128\0018\0028\0038\0048\005\016\001\016\002\016\0038\0068\007\208\001\204\001\208\002\208\003,\001 \0014\001\000\001X\001X\002(\001$\001L\001L\0020\001"), (8, "\000\001\002\003\004\005\006\007\b\t\011\r\014\015\016\017\018\019\020\021\022\024\026\027\028\029\030\031 !\"$&'()*+-/0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\afhjklmoqstuvwxz|~\128\130\132\133\134\135\136\137\138\140\141\142\143\144\145\146\147\148\149\151\152\153\156\159\162\164\166\168\170\171\172\173\174\175\176\177\178\179\180\181\182\183\184\185\186\187\188\189\190\191\192\193\194\195\197\198\199\200\201\202\203\204\205\206\207\208\209\210"))
    
    and nullable =
      " \007\000"
    
    and first =
      (41, "\016\000 \b\144 \016\000\000\000\b\000\000\000\000\000\000\000\001\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\128\000\000\000\000@\000\000\000\000\000\002\000\000\000\004\000\000\000\000\000\000\136\244\240,\136Q\000\002\000\137\000\000\000\001\000\000@\000\128 @\000\000@\000\000\000\000\000\b\000\000\000\000\000\b\004\000\b\002\004\000\000\000\001\000\000\000\000\002\000\000\000\000\000\001\001\030\158\005\145\n\000\000\000@\000")
    
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
