
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
    | WHERE
    | USE
    | TYPE_KEYWORD
    | SYNTHESIZE
    | SUGGEST
    | STRING_T
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
# 6 "lib/parser.mly"
       (string)
# 41 "lib/parser.ml"
  )
    | PROTOCOL
    | MINUS
    | LT
    | LSQUARE
    | LPAR
    | LINEARTOSHARED
    | LBRACE
    | INT_T
    | INTERNALCHOICE
    | INT of (
# 9 "lib/parser.mly"
       (int)
# 55 "lib/parser.ml"
  )
    | ID of (
# 7 "lib/parser.mly"
       (string)
# 60 "lib/parser.ml"
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
# 8 "lib/parser.mly"
       (string)
# 76 "lib/parser.ml"
  )
    | AT
    | ACQUIRE
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast
  open Utils

# 90 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ACQUIRE ->
          47
      | AT ->
          46
      | ATOMIC _ ->
          45
      | COLON ->
          44
      | COMMA ->
          43
      | DEFINE_CHOICE ->
          42
      | EITHER ->
          41
      | END ->
          40
      | EOF ->
          39
      | EQ ->
          38
      | EXCLAMATION ->
          37
      | EXTERNALCHOICE ->
          36
      | FUNC ->
          35
      | GT ->
          34
      | ID _ ->
          33
      | INT _ ->
          32
      | INTERNALCHOICE ->
          31
      | INT_T ->
          30
      | LBRACE ->
          29
      | LINEARTOSHARED ->
          28
      | LPAR ->
          27
      | LSQUARE ->
          26
      | LT ->
          25
      | MINUS ->
          24
      | PROTOCOL ->
          23
      | RAW _ ->
          22
      | RBRACE ->
          21
      | REC ->
          20
      | RECEIVECHANNEL ->
          19
      | RECEIVEVALUE ->
          18
      | REC_FUNC ->
          17
      | RELEASE ->
          16
      | RPAR ->
          15
      | RSQUARE ->
          14
      | S ->
          13
      | SEMICOLON ->
          12
      | SENDCHANNEL ->
          11
      | SENDVALUE ->
          10
      | SESSION ->
          9
      | SHAREDTOLINEAR ->
          8
      | STRING_T ->
          7
      | SUGGEST ->
          6
      | SYNTHESIZE ->
          5
      | TYPE_KEYWORD ->
          4
      | USE ->
          3
      | WHERE ->
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
# 8 "lib/parser.mly"
       (string)
# 208 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 236 "lib/parser.ml"
          ))
      | INT _v ->
          Obj.repr (_v : (
# 9 "lib/parser.mly"
       (int)
# 242 "lib/parser.ml"
          ))
      | INTERNALCHOICE ->
          Obj.repr ()
      | INT_T ->
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
      | PROTOCOL ->
          Obj.repr ()
      | RAW _v ->
          Obj.repr (_v : (
# 6 "lib/parser.mly"
       (string)
# 266 "lib/parser.ml"
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
      | STRING_T ->
          Obj.repr ()
      | SUGGEST ->
          Obj.repr ()
      | SYNTHESIZE ->
          Obj.repr ()
      | TYPE_KEYWORD ->
          Obj.repr ()
      | USE ->
          Obj.repr ()
      | WHERE ->
          Obj.repr ()
      | Z ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000\000\00063\000\000\000G\031\000\000\000\000\000\000\000\000\000\000\000H1\000\000\000\000\000\000\000\000\030\000\000\000%\000\000\000\000\000!\000\000\000&\000$+\"20\000\000\000\006\000#\000-\000/\000\000\000(\000\000\000*\000\000\000'\000\000\000)\000.\000,\000E\000\000D\n\000\000\000\000\000\000\000\000\003\000\000\026\002\024\000\000\000\000\000\000\000\000A\000\000>B\000\000\000\020\000\000\005\000\000\000\000\0008\000\029\000\000\000@\000\0004\000\t\000\000:\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\000\b\000\000\000\000\000\000\000\000F\000\000\000\000\000\000\000\007\000\017\000\000<\014\011\016\001\000\027\r\012\000\022\015")
  
  and error =
    (48, "\b\000\002\000\017 \000\000\000\000@\000\000\000\000@\002\000\000\000\000\000\000\004\000\000\000\000 \016\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\002\000A\244\184\011H\133\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000@\004\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000@\000\000A\244\184\011H\133\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000@@\000\000\000\000 \000\000\000\000\000\000\000\000\000\000@\000\000A\244\184\011H\133 \t\004D \024\000\000\000\000\000\004\000\000\000\000 \000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000@@\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016A\244\184\011H\133\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\016A\244\184\011H\133\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\016A\244\184\011H\133\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\016A\244\184\011H\133\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\016A\244\184\011H\133\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000A\244\184\011H\133\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000P\000\000\000\000\000\000\000\004\000\000\000\000 \000\000\000\000\016\000\000\000\001\000\000@\000\000\000\000\000\000\bA\244\184\011H\133\000\000\000\000\000\000\000\001\000\000\000\024\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\128\000\000\000\000\000\000 \000A\244\184\011H\133 \000\000\004\000\000\000\000\000\000\000\004\000\000\000\000\000\b\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\004\000\016\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\006\000\000\002\000\000\006\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000@ \000\000\000\000\000\000\000\000\000\000\000 \000\000\018\002\000\000\000\000\000\000\000\000@\000\000\b\000\000\000\016\000\000\000\000@\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\002\002\000\000\000\000\000\000\000\000@\000\000\b\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\001\000\000\000\016\000\000\000\000@\000\000\000\000\000\000\000\000\001\000\000@\000\000\001\000\000\000\000\000\000\000\132\000\000\000\000\000\000 \000A\244\184\011H\133 \000\000\004\000\000\000\000\000\004\000\000\000\000\006\000\000\002\004\000\000\000\000\000\000\000@ \000\000\000\000\000 \000\000\018\002\000\000\000\000\002\002\000\000\000\000\000\002\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\004\000\000\000\000\000\000\000@ \000\000\000\000\000 \000\000\018\002\000\000\000\000\002\002\000\000\000\000\000\002\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\004\000\000\000\000\000\000@\000\000\b\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\bA\244\184\011H\133\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\004\000\000\016\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\002\000\017 \000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\003;4\198\012\198\000\000\198\198\003\000\000\019\003\136\003\138\003\170\003l\003\184\000\000\206\003\188\003\230\003\168\003\000\244(~\000\252\003\003\198^\000v,\230\000l\000\000\000\000\000z\003\146\000\130\000\224\000\\\000\144\003\172\000\156\003\178\000\172\003\196\000\176\003\202\000\186\000\204\000\252\000\003\254\000\000\168:\198\214\230J\198\003\000 \152\000\000\000\176\156\134\003\134\210l\250\000&\210\000\000~\002\b\000\132b\000`\003d2d\000\140\000fd\132\000~n\000\128\000<J\000J\144Vn\003\134|\b\226b\198\003f\162\202\000\206\000l\222b\158\003f\184\180\000\152\232\162\244\158\172\003\000\138\000\030\158\000\000\000\000\000^\000\000\000\003\000\000"), (16, "\000.\000}\001\254\000\006\000\n\000m\0002\0006\000>\000F\000N\000}\000V\000m\000}\000f\000:\000j\000r\000z\000}\001j\000I\001\226\000\170\000I\001\226\000\130\000}\000\138\000\142\000a\000\166\000}\001n\000\182\000\233\000\217\000Q\000\206\000\209\002\178\000}\000}\000\210\000\225\000\214\001\234\000\241\000\022\002f\000\014\000Y\000\150\001v\000\190\002F\002\026\002\222\000a\001\150\000\158\001\206\000\158\001^\000\249\001\242\002R\002\006\001\186\001\134\001\238\002\142\002>\001\250\000\r\002.\002*\002\"\000Z\001\002\000\178\002\018\002\002\000\186\0026\002\251\002N\000\202\002V\002\214\002b\001\222\000B\000J\002~\001\t\000\154\001\194\000\242\002\146\001\178\001\174\001\170\000\226\002\158\002\170\000\234\001\154\000\134\000R\002\174\002\198\002\182\002\190\001\n\002\150\001r\002j\000v\001\018\001\026\002\130\001\"\002\138\002r\000b\001J\000n\001*\002\202\001:\0012\000&\002\194\001B\001R\000*\001Z\001f\000~\001~\001\130\001\138\000\018\002\186\000\250\000\146\001\198\000\194\001\190\000\162"))
  
  and lhs =
    (8, "\000\029\028\027\027\026\025\024\024\023\023\023\023\023\023\023\022\021\020\020\019\019\018\018\017\017\016\015\015\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\014\r\012\011\011\n\n\t\t\b\b\007\007\006\006\005\004\004\003\003\002\001\001")
  
  and goto =
    ((8, "\005\000\000\130\000\162\000\000\000\000\140\000\000\000\138\000^\000<\000\134\000\196\000\000\000\000J\000R\000P\000t\000\000\144\000\000\000\b\000Z\000\000\000\130\000\000\000\000\000\000\000\000\000>\000\000\000\000\000\000\000\000\000@\000\000\000z\000\000\000N\000\000\000F\000\000\000\000\000\000\000\000\132\000\000\000\000\0000\000\000\011\000\002\000\166\000\000\000\000\000\000\000\136\194\b\000\000\000\000v\000\000\000\154\152\000\0001\000\000\015~\000\170\000\000\000\166\168\000\000\000\000\000\000\000\000D\000*\000\000\000f\166\000\017\000z\000\150\146\000\000\000\000\000\000\000\132\000\142\158\000\000\000\000\000\000\000b\000B\000\000\000\000h\000\000\000\000\000\000\000\000\000\b\000\000"), (8, "\186\1877~i7\186\187\134s\188v\162j\189d\188\1908\192\193\194\196\195\143\192\193\194\196ei7777\b7_7\147777\145N:D\1807P\143F7L@B\b\181,7\185R7\143s\151u77777>\132\183H\b\183\t\159YJnTV\170\169\152\156\138\1582\007\167\136\131z\141<\024hw"))
  
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
# 7 "lib/parser.mly"
       (string)
# 364 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_count_ in
        let _v : ((string * Mini_ast.ty) * int) = 
# 229 "lib/parser.mly"
    (
      ((arg_name, t), Option.value count ~default:0)
    )
# 374 "lib/parser.ml"
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
# 234 "lib/parser.mly"
                ( t )
# 399 "lib/parser.ml"
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
# 417 "lib/parser.ml"
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
# 442 "lib/parser.ml"
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
# 97 "lib/parser.mly"
      ( (TyEither (t1, t2)) )
# 502 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 537 "lib/parser.ml"
        ) = Obj.magic lbl in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_lbl_ in
        let _endpos = _endpos_ty_ in
        let _v : (string * Mini_ast.ty) = 
# 101 "lib/parser.mly"
    (
      (lbl, ty)
    )
# 547 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = body;
            MenhirLib.EngineTypes.startp = _startpos_body_;
            MenhirLib.EngineTypes.endp = _endpos_body_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _10;
              MenhirLib.EngineTypes.startp = _startpos__10_;
              MenhirLib.EngineTypes.endp = _endpos__10_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = traits;
                MenhirLib.EngineTypes.startp = _startpos_traits_;
                MenhirLib.EngineTypes.endp = _endpos_traits_;
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
        } = _menhir_stack in
        let _12 : unit = Obj.magic _12 in
        let body : (string list) = Obj.magic body in
        let _10 : unit = Obj.magic _10 in
        let traits : (string) = Obj.magic traits in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 7 "lib/parser.mly"
       (string)
# 644 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__12_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 654 "lib/parser.ml"
           in
          (
# 168 "lib/parser.mly"
    (
      ClosedFunction(
        (TyFunc(((name, List.map fst ars), ret), traits),
         String.concat "" body)
      )
    )
# 664 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _15;
          MenhirLib.EngineTypes.startp = _startpos__15_;
          MenhirLib.EngineTypes.endp = _endpos__15_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = body;
            MenhirLib.EngineTypes.startp = _startpos_body_;
            MenhirLib.EngineTypes.endp = _endpos_body_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _13;
              MenhirLib.EngineTypes.startp = _startpos__13_;
              MenhirLib.EngineTypes.endp = _endpos__13_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = traits;
                MenhirLib.EngineTypes.startp = _startpos_traits_;
                MenhirLib.EngineTypes.endp = _endpos_traits_;
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
        } = _menhir_stack in
        let _15 : unit = Obj.magic _15 in
        let body : (string list) = Obj.magic body in
        let _13 : unit = Obj.magic _13 in
        let traits : (string) = Obj.magic traits in
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
# 7 "lib/parser.mly"
       (string)
# 783 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__15_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 793 "lib/parser.ml"
           in
          (
# 183 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      ClosedFunction
        (TyScheme
           (tList, TyFunc(((name, args), ret), traits)),
         String.concat "" body)
    )
# 804 "lib/parser.ml"
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
# 6 "lib/parser.mly"
       (string)
# 826 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 60 "lib/parser.mly"
               ( Raw(text) )
# 834 "lib/parser.ml"
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
# 61 "lib/parser.mly"
                    ( tdef )
# 859 "lib/parser.ml"
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
# 62 "lib/parser.mly"
                         ( ChoiceDef(cdef) )
# 884 "lib/parser.ml"
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
# 63 "lib/parser.mly"
             ( f )
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
# 64 "lib/parser.mly"
                      ( f )
# 934 "lib/parser.ml"
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
# 65 "lib/parser.mly"
                           ( closed_f )
# 959 "lib/parser.ml"
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
# 66 "lib/parser.mly"
                    ( f )
# 984 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 1044 "lib/parser.ml"
        ) = Obj.magic name in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Mini_ast.choice) = 
# 110 "lib/parser.mly"
    (
      (TyDefineChoice (name, branches))
    )
# 1057 "lib/parser.ml"
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
                  MenhirLib.EngineTypes.semv = _14;
                  MenhirLib.EngineTypes.startp = _startpos__14_;
                  MenhirLib.EngineTypes.endp = _endpos__14_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = recursive;
                    MenhirLib.EngineTypes.startp = _startpos_recursive_;
                    MenhirLib.EngineTypes.endp = _endpos_recursive_;
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
                            MenhirLib.EngineTypes.semv = traits;
                            MenhirLib.EngineTypes.startp = _startpos_traits_;
                            MenhirLib.EngineTypes.endp = _endpos_traits_;
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
          };
        } = _menhir_stack in
        let _18 : unit = Obj.magic _18 in
        let _17 : unit = Obj.magic _17 in
        let suggested_funcs : (string list) = Obj.magic suggested_funcs in
        let required_funcs : (string list) = Obj.magic required_funcs in
        let _14 : unit = Obj.magic _14 in
        let recursive : (bool) = Obj.magic recursive in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let _10 : unit = Obj.magic _10 in
        let traits : (string) = Obj.magic traits in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 7 "lib/parser.mly"
       (string)
# 1196 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__18_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 1206 "lib/parser.ml"
           in
          (
# 127 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyFunc ((((name, args), ret)), traits), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 1215 "lib/parser.ml"
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
# 1234 "lib/parser.ml"
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
# 6 "lib/parser.mly"
       (string)
# 1262 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1270 "lib/parser.ml"
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
# 1288 "lib/parser.ml"
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
# 1320 "lib/parser.ml"
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
# 1363 "lib/parser.ml"
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
# 1381 "lib/parser.ml"
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
# 9 "lib/parser.mly"
       (int)
# 1408 "lib/parser.ml"
        ) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x = 
# 188 "<standard.mly>"
    ( x )
# 1418 "lib/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 1423 "lib/parser.ml"
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
# 57 "lib/parser.mly"
                        ( d )
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
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (string list) = 
# 151 "lib/parser.mly"
                                ( [] )
# 1474 "lib/parser.ml"
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
# 153 "lib/parser.mly"
                                ( ids )
# 1513 "lib/parser.ml"
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
# 73 "lib/parser.mly"
                                                                         ( TyPrimitive("Int"))
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
# 74 "lib/parser.mly"
                                                                         ( TyPrimitive("String"))
# 1563 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 1584 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 75 "lib/parser.mly"
                                                                         ( TyPrimitive(id) )
# 1592 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = schemelist;
            MenhirLib.EngineTypes.startp = _startpos_schemelist_;
            MenhirLib.EngineTypes.endp = _endpos_schemelist_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = id;
                MenhirLib.EngineTypes.startp = _startpos_id_;
                MenhirLib.EngineTypes.endp = _endpos_id_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let schemelist : (Mini_ast.ty list) = Obj.magic schemelist in
        let _2 : unit = Obj.magic _2 in
        let id : (
# 7 "lib/parser.mly"
       (string)
# 1634 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 76 "lib/parser.mly"
                                                                         ( TyPrimitive(id ^ "<" ^ (String.concat ", " (List.map print_type schemelist)) ^ ">" ))
# 1642 "lib/parser.ml"
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
# 8 "lib/parser.mly"
       (string)
# 1663 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 77 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 1671 "lib/parser.ml"
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
# 78 "lib/parser.mly"
                                                                         ( TyInternalChoice(c) )
# 1717 "lib/parser.ml"
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
# 79 "lib/parser.mly"
                                                                         ( TyExternalChoice(c) )
# 1763 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 1803 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 80 "lib/parser.mly"
                                                                         ( TyInternalChoiceId(id) )
# 1813 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 1853 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 81 "lib/parser.mly"
                                                                         ( TyExternalChoiceId(id) )
# 1863 "lib/parser.ml"
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
# 82 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
# 1923 "lib/parser.ml"
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
# 83 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 1983 "lib/parser.ml"
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
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let t1 : (Mini_ast.ty) = Obj.magic t1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 84 "lib/parser.mly"
                                                                         ( TySendValue(t1, cont) )
# 2043 "lib/parser.ml"
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
        let cont : (Mini_ast.ty) = Obj.magic cont in
        let _4 : unit = Obj.magic _4 in
        let t1 : (Mini_ast.ty) = Obj.magic t1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 85 "lib/parser.mly"
                                                                         ( TyReceiveValue(t1, cont) )
# 2103 "lib/parser.ml"
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
                                                                         ( TyEnd )
# 2128 "lib/parser.ml"
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
# 87 "lib/parser.mly"
                                                                         ( TySharedToLinear(t, 0) )
# 2174 "lib/parser.ml"
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
# 88 "lib/parser.mly"
                                                                         ( TyLinearToShared(t, 0) )
# 2220 "lib/parser.ml"
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
# 89 "lib/parser.mly"
                                                                         ( TySession(t) )
# 2266 "lib/parser.ml"
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
# 90 "lib/parser.mly"
                                                                         ( TyRec(t) )
# 2312 "lib/parser.ml"
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
# 91 "lib/parser.mly"
                                                                         ( TyZ (t) )
# 2337 "lib/parser.ml"
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
# 92 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2362 "lib/parser.ml"
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
# 93 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2387 "lib/parser.ml"
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
# 193 "lib/parser.mly"
      ( List.map (fun t -> TyAtomic t) ts )
# 2412 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _21;
          MenhirLib.EngineTypes.startp = _startpos__21_;
          MenhirLib.EngineTypes.endp = _endpos__21_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _20;
            MenhirLib.EngineTypes.startp = _startpos__20_;
            MenhirLib.EngineTypes.endp = _endpos__20_;
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
                  MenhirLib.EngineTypes.semv = _17;
                  MenhirLib.EngineTypes.startp = _startpos__17_;
                  MenhirLib.EngineTypes.endp = _endpos__17_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = recursive;
                    MenhirLib.EngineTypes.startp = _startpos_recursive_;
                    MenhirLib.EngineTypes.endp = _endpos_recursive_;
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
                            MenhirLib.EngineTypes.semv = traits;
                            MenhirLib.EngineTypes.startp = _startpos_traits_;
                            MenhirLib.EngineTypes.endp = _endpos_traits_;
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
          };
        } = _menhir_stack in
        let _21 : unit = Obj.magic _21 in
        let _20 : unit = Obj.magic _20 in
        let suggested_funcs : (string list) = Obj.magic suggested_funcs in
        let required_funcs : (string list) = Obj.magic required_funcs in
        let _17 : unit = Obj.magic _17 in
        let recursive : (bool) = Obj.magic recursive in
        let _15 : unit = Obj.magic _15 in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let traits : (string) = Obj.magic traits in
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
# 7 "lib/parser.mly"
       (string)
# 2572 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__21_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2582 "lib/parser.ml"
           in
          (
# 218 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function
        (TyScheme 
           (tList, TyFunc ((
            ((name, args), ret)), traits)), argcounts,  recursive, (required_funcs, suggested_funcs))
    )
# 2594 "lib/parser.ml"
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
# 8 "lib/parser.mly"
       (string)
# 2616 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2624 "lib/parser.ml"
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
# 8 "lib/parser.mly"
       (string)
# 2659 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2667 "lib/parser.ml"
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
# 2688 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2696 "lib/parser.ml"
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
# 2731 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
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
# 2764 "lib/parser.ml"
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
# 2803 "lib/parser.ml"
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
# 2828 "lib/parser.ml"
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
# 2867 "lib/parser.ml"
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
        let x : (string) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2892 "lib/parser.ml"
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
        let x : (string) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2931 "lib/parser.ml"
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
# 156 "lib/parser.mly"
                                ( [] )
# 2949 "lib/parser.ml"
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
# 158 "lib/parser.mly"
                                ( ids )
# 2988 "lib/parser.ml"
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
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = t;
              MenhirLib.EngineTypes.startp = _startpos_t_;
              MenhirLib.EngineTypes.endp = _endpos_t_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let t : (
# 8 "lib/parser.mly"
       (string)
# 3023 "lib/parser.ml"
        ) = Obj.magic t in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_t_ in
        let _endpos = _endpos__3_ in
        let _v : (string) = 
# 202 "lib/parser.mly"
    ( t ^ ": Protocol" )
# 3031 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = ws;
          MenhirLib.EngineTypes.startp = _startpos_ws_;
          MenhirLib.EngineTypes.endp = _endpos_ws_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let ws : (string list) = Obj.magic ws in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_ws_ in
        let _v : (string) = 
# 197 "lib/parser.mly"
    ( "where " ^ String.concat ", " ws )
# 3063 "lib/parser.ml"
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
        let _v : (string) = 
# 198 "lib/parser.mly"
    ( "" )
# 3081 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 3129 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Mini_ast.decl) = 
# 69 "lib/parser.mly"
                                                        ( TypeDef({name = _name; body = t}) )
# 3138 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = t;
            MenhirLib.EngineTypes.startp = _startpos_t_;
            MenhirLib.EngineTypes.endp = _endpos_t_;
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
                  MenhirLib.EngineTypes.semv = schemelist;
                  MenhirLib.EngineTypes.startp = _startpos_schemelist_;
                  MenhirLib.EngineTypes.endp = _endpos_schemelist_;
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
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let schemelist : (Mini_ast.ty list) = Obj.magic schemelist in
        let _3 : unit = Obj.magic _3 in
        let _name : (
# 7 "lib/parser.mly"
       (string)
# 3207 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v : (Mini_ast.decl) = 
# 70 "lib/parser.mly"
                                                                                          ( TypeDef({name = _name ^ "<" ^ (String.concat ", " (List.map print_type schemelist)) ^ ">"; body = TyScheme(schemelist, t)}) )
# 3216 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 3327 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 3337 "lib/parser.ml"
           in
          (
# 144 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyUnitRetFunc (name, args), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 3346 "lib/parser.ml"
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
# 237 "lib/parser.mly"
      ( 0)
# 3372 "lib/parser.ml"
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
# 238 "lib/parser.mly"
                          ( t + 1 )
# 3418 "lib/parser.ml"
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
      "WHERE";
      "USE";
      "TYPE_KEYWORD";
      "SYNTHESIZE";
      "SUGGEST";
      "STRING_T";
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
      "PROTOCOL";
      "MINUS";
      "LT";
      "LSQUARE";
      "LPAR";
      "LINEARTOSHARED";
      "LBRACE";
      "INT_T";
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
      "Reducing production closed_func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type traits LBRACE list(RAW) RBRACE";
      "Reducing production closed_func -> FUNC ID LT scheme_args GT LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type traits LBRACE list(RAW) RBRACE";
      "Reducing production decl -> RAW";
      "Reducing production decl -> type_def";
      "Reducing production decl -> define_choice";
      "Reducing production decl -> func";
      "Reducing production decl -> unit_ret_func";
      "Reducing production decl -> closed_func";
      "Reducing production decl -> scheme_func";
      "Reducing production define_choice -> DEFINE_CHOICE EXCLAMATION LBRACE ID SEMICOLON separated_nonempty_list(COMMA,choice_branch) RBRACE";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type traits LBRACE AT SYNTHESIZE boption(REC_FUNC) LSQUARE require_funcs suggest_funcs RSQUARE RBRACE";
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
      "Reducing production s_type -> INT_T";
      "Reducing production s_type -> STRING_T";
      "Reducing production s_type -> ID";
      "Reducing production s_type -> ID LT scheme_args GT";
      "Reducing production s_type -> ATOMIC";
      "Reducing production s_type -> INTERNALCHOICE LT choice GT";
      "Reducing production s_type -> EXTERNALCHOICE LT choice GT";
      "Reducing production s_type -> INTERNALCHOICE LT ID GT";
      "Reducing production s_type -> EXTERNALCHOICE LT ID GT";
      "Reducing production s_type -> SENDCHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> RECEIVECHANNEL LT s_type COMMA s_type GT";
      "Reducing production s_type -> SENDVALUE LT s_type COMMA s_type GT";
      "Reducing production s_type -> RECEIVEVALUE LT s_type COMMA s_type GT";
      "Reducing production s_type -> END";
      "Reducing production s_type -> SHAREDTOLINEAR LT s_type GT";
      "Reducing production s_type -> LINEARTOSHARED LT s_type GT";
      "Reducing production s_type -> SESSION LT s_type GT";
      "Reducing production s_type -> REC LT s_type GT";
      "Reducing production s_type -> z_type";
      "Reducing production s_type -> RELEASE";
      "Reducing production s_type -> ACQUIRE";
      "Reducing production scheme_args -> separated_nonempty_list(COMMA,ATOMIC)";
      "Reducing production scheme_func -> FUNC ID LT scheme_args GT LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type traits LBRACE AT SYNTHESIZE boption(REC_FUNC) LSQUARE require_funcs suggest_funcs RSQUARE RBRACE";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC";
      "Reducing production separated_nonempty_list(COMMA,ATOMIC) -> ATOMIC COMMA separated_nonempty_list(COMMA,ATOMIC)";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID";
      "Reducing production separated_nonempty_list(COMMA,ID) -> ID COMMA separated_nonempty_list(COMMA,ID)";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg COMMA separated_nonempty_list(COMMA,arg)";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch";
      "Reducing production separated_nonempty_list(COMMA,choice_branch) -> choice_branch COMMA separated_nonempty_list(COMMA,choice_branch)";
      "Reducing production separated_nonempty_list(COMMA,trait) -> trait";
      "Reducing production separated_nonempty_list(COMMA,trait) -> trait COMMA separated_nonempty_list(COMMA,trait)";
      "Reducing production suggest_funcs ->";
      "Reducing production suggest_funcs -> SUGGEST separated_nonempty_list(COMMA,ID) SEMICOLON";
      "Reducing production trait -> ATOMIC COLON PROTOCOL";
      "Reducing production traits -> WHERE separated_nonempty_list(COMMA,trait)";
      "Reducing production traits ->";
      "Reducing production type_def -> TYPE_KEYWORD ID EQ s_type SEMICOLON";
      "Reducing production type_def -> TYPE_KEYWORD ID LT scheme_args GT EQ s_type SEMICOLON";
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
      | T_WHERE : unit terminal
      | T_USE : unit terminal
      | T_TYPE_KEYWORD : unit terminal
      | T_SYNTHESIZE : unit terminal
      | T_SUGGEST : unit terminal
      | T_STRING_T : unit terminal
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
# 6 "lib/parser.mly"
       (string)
# 3593 "lib/parser.ml"
    ) terminal
      | T_PROTOCOL : unit terminal
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LSQUARE : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_LBRACE : unit terminal
      | T_INT_T : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_INT : (
# 9 "lib/parser.mly"
       (int)
# 3607 "lib/parser.ml"
    ) terminal
      | T_ID : (
# 7 "lib/parser.mly"
       (string)
# 3612 "lib/parser.ml"
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
# 8 "lib/parser.mly"
       (string)
# 3628 "lib/parser.ml"
    ) terminal
      | T_AT : unit terminal
      | T_ACQUIRE : unit terminal
    
    type _ nonterminal = 
      | N_z_type : (int) nonterminal
      | N_unit_ret_func : (Mini_ast.decl) nonterminal
      | N_type_def : (Mini_ast.decl) nonterminal
      | N_traits : (string) nonterminal
      | N_trait : (string) nonterminal
      | N_suggest_funcs : (string list) nonterminal
      | N_separated_nonempty_list_COMMA_trait_ : (string list) nonterminal
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
            X (T T_WHERE)
        | 3 ->
            X (T T_USE)
        | 4 ->
            X (T T_TYPE_KEYWORD)
        | 5 ->
            X (T T_SYNTHESIZE)
        | 6 ->
            X (T T_SUGGEST)
        | 7 ->
            X (T T_STRING_T)
        | 8 ->
            X (T T_SHAREDTOLINEAR)
        | 9 ->
            X (T T_SESSION)
        | 10 ->
            X (T T_SENDVALUE)
        | 11 ->
            X (T T_SENDCHANNEL)
        | 12 ->
            X (T T_SEMICOLON)
        | 13 ->
            X (T T_S)
        | 14 ->
            X (T T_RSQUARE)
        | 15 ->
            X (T T_RPAR)
        | 16 ->
            X (T T_RELEASE)
        | 17 ->
            X (T T_REC_FUNC)
        | 18 ->
            X (T T_RECEIVEVALUE)
        | 19 ->
            X (T T_RECEIVECHANNEL)
        | 20 ->
            X (T T_REC)
        | 21 ->
            X (T T_RBRACE)
        | 22 ->
            X (T T_RAW)
        | 23 ->
            X (T T_PROTOCOL)
        | 24 ->
            X (T T_MINUS)
        | 25 ->
            X (T T_LT)
        | 26 ->
            X (T T_LSQUARE)
        | 27 ->
            X (T T_LPAR)
        | 28 ->
            X (T T_LINEARTOSHARED)
        | 29 ->
            X (T T_LBRACE)
        | 30 ->
            X (T T_INT_T)
        | 31 ->
            X (T T_INTERNALCHOICE)
        | 32 ->
            X (T T_INT)
        | 33 ->
            X (T T_ID)
        | 34 ->
            X (T T_GT)
        | 35 ->
            X (T T_FUNC)
        | 36 ->
            X (T T_EXTERNALCHOICE)
        | 37 ->
            X (T T_EXCLAMATION)
        | 38 ->
            X (T T_EQ)
        | 39 ->
            X (T T_EOF)
        | 40 ->
            X (T T_END)
        | 41 ->
            X (T T_EITHER)
        | 42 ->
            X (T T_DEFINE_CHOICE)
        | 43 ->
            X (T T_COMMA)
        | 44 ->
            X (T T_COLON)
        | 45 ->
            X (T T_ATOMIC)
        | 46 ->
            X (T T_AT)
        | 47 ->
            X (T T_ACQUIRE)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 29 ->
            X (N N_arg)
        | 28 ->
            X (N N_arg_type)
        | 27 ->
            X (N N_boption_REC_FUNC_)
        | 26 ->
            X (N N_choice)
        | 25 ->
            X (N N_choice_branch)
        | 24 ->
            X (N N_closed_func)
        | 23 ->
            X (N N_decl)
        | 22 ->
            X (N N_define_choice)
        | 21 ->
            X (N N_func)
        | 20 ->
            X (N N_list_RAW_)
        | 19 ->
            X (N N_list_decl_)
        | 18 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 17 ->
            X (N N_option_preceded_COLON_INT__)
        | 16 ->
            X (N N_prog)
        | 15 ->
            X (N N_require_funcs)
        | 14 ->
            X (N N_s_type)
        | 13 ->
            X (N N_scheme_args)
        | 12 ->
            X (N N_scheme_func)
        | 11 ->
            X (N N_separated_nonempty_list_COMMA_ATOMIC_)
        | 10 ->
            X (N N_separated_nonempty_list_COMMA_ID_)
        | 9 ->
            X (N N_separated_nonempty_list_COMMA_arg_)
        | 8 ->
            X (N N_separated_nonempty_list_COMMA_choice_branch_)
        | 7 ->
            X (N N_separated_nonempty_list_COMMA_trait_)
        | 6 ->
            X (N N_suggest_funcs)
        | 5 ->
            X (N N_trait)
        | 4 ->
            X (N N_traits)
        | 3 ->
            X (N N_type_def)
        | 2 ->
            X (N N_unit_ret_func)
        | 1 ->
            X (N N_z_type)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\nD4\\X\023\023\027FN\004\016\0184\0204\0224\0244\0284\003F\"&4(4*4:4>@4DFT4D4\027FJ4DF5FR\\`\003\029X\029F5F\029F\029F\029X\029F\029X\029F\029X\029F\029X\029F\029F\029F\029\026N\029\026.HD4\027F8DZ\0299ZB#\019% 2F\029\006\\Z0\011X\015\015\t<.)^\012$76\bDX\021\021\026\031\014\021\026\r\030,),;X\0198% 2F\029\t<^\01276\031\r\030,),<^\01276\031\r\030,VL<D\026DZ\029\017,3X\017\005\007\025!'P+-/'1")
    
    and rhs =
      ((8, "!DZ9#\029$T4\029X\029FDZ\029HD8% 2F\029\t<),HD4\027F8% 2F\029\t<),.\007-+\0051\025VL<D\026\017,HD8% 2F\029\t<^\01276\031\r\030,.)/'\019ZB'P\b\021\026>\016DD4\027F\\@45FJ45F@4DFJ4DF\0244\029X\029F(4\029X\029F\0224\029X\029F&4\029X\029FR\0184\029F:4\029F\0204\029F*4\029F\003\"`\023HD4\027F8% 2F\029\t<^\01276\031\r\030,\\\\X\023DDX\021;;X\01933X\017\011\011X\015\014\021\026\\Z0\006\015\nDN\029\026\nD4\027FN\029\026HD8% <^\01276\031\r\030,\004\0284\003F"), (8, "\000\001\005\006\006\007\r\016\028+,-./0129KKMMOOPPRTTWXYZ^_cgkou{\129\135\136\140\144\148\152\153\154\155\156\177\178\181\182\185\186\189\190\193\194\197\197\200\203\205\205\210\218\232\233\237"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\127\128\129\130\131\132\133\134\135\136\137\138\139\140\141\142\143\144\145\146\147\148\149\150\151\152\153\154\155\156\157\158\159\160\161\162\163\164\165\166\167\168\169\170\171\172\173\174\175\176\177\178\179\180\181\182\183\184\185\186\187\188\189\190\191\192\193\194\195")
    
    and lr0_items =
      ((32, "\000\000\000\000\000\001\016\001\000\001\012\001\000\001\016\002\000\001\012\002\000\001\016\003\000\000\212\001\000\000\208\001\000\000\212\002\000\000\212\003\000\000\200\001\000\001\016\004\000\001\016\005\000\001\016\006\000\001\024\001\000\000x\001\000\000\172\001\000\000\172\002\000\000\180\001\000\000\180\002\000\000\160\001\000\000\160\002\000\000\152\001\000\000\152\002\000\001\028\001\000\001\028\002\000\001\028\003\000\001\028\004\000\000\192\001\000\000\164\001\000\000\164\002\000\000\156\001\000\000\156\002\000\000\184\001\000\000\184\002\000\000\176\001\000\000\176\002\000\000t\001\000\000\144\001\000\000\136\001\000\000\144\002\000\000\136\002\000\000\144\003\000\000\144\004\000\000\020\001\000\000\020\002\000\000\128\001\000\000|\001\000\000\128\002\000\000\128\003\000\000\128\004\000\000\148\001\000\000\140\001\000\000\148\002\000\000\140\002\000\000\148\003\000\000\148\004\000\000\140\003\000\000\140\004\000\000\168\001\000\000\132\001\000\000\196\001\000\000\188\001\000\000\020\003\000\000\020\004\000\000\020\005\000\000\020\006\000\000\136\003\000\000\136\004\000\000\176\003\000\000\176\004\000\000\184\003\000\000\184\004\000\000\156\003\000\000\156\004\000\000\156\005\000\000\156\006\000\000\164\003\000\000\164\004\000\000\164\005\000\000\164\006\000\000\152\003\000\000\152\004\000\000\152\005\000\000\152\006\000\000\160\003\000\000\160\004\000\000\160\005\000\000\160\006\000\000\180\003\000\000\180\004\000\000\172\003\000\000\172\004\000\001\016\007\000\001\016\b\000\001\012\003\000\001\012\004\000\001\012\005\000\000$\001\000\001\020\001\000\000\204\001\000\000D\001\000\000 \001\000\000\028\001\000\001\020\002\000\000\204\002\000\000D\002\000\000 \002\000\000\028\002\000\000\204\003\000\000 \003\000\000\204\004\000\000 \004\000\000\204\005\000\000 \005\000\000\204\006\000\000 \006\000\000\004\001\000\000\004\002\000\000\b\001\000\000\004\003\000\000d\001\000\000d\002\000\000\004\004\000\000\\\001\000\000\204\007\000\000 \007\000\000\204\b\000\000 \b\000\000\204\t\000\000 \t\000\000\204\n\000\000 \n\000\000\204\011\000\000 \011\000\001\004\001\000\001\000\001\000\001\000\002\000\001\000\003\000\000\244\001\000\000\240\001\000\000\244\002\000\000\244\003\000\001\004\002\000\000\204\012\000\000 \012\000\000\204\r\000\000 \r\000\000L\001\000\000L\002\000\000\204\014\000\000\204\015\000\000\016\001\000\000\204\016\000\000\204\017\000\000p\001\000\000\220\001\000\000\216\001\000\000\220\002\000\000\220\003\000\000p\002\000\000p\003\000\000\204\018\000\000\252\001\000\000\252\002\000\000\252\003\000\000\204\019\000\000\204\020\000\000\204\021\000\000 \014\000\000 \015\000\000\228\001\000\000\224\001\000\000\228\002\000\000\228\003\000\001\020\003\000\000D\003\000\000\028\003\000\001\020\004\000\000D\004\000\000\028\004\000\001\020\005\000\000D\005\000\000\028\005\000\000D\006\000\000\028\006\000\000D\007\000\000\028\007\000\000D\b\000\000\028\b\000\000D\t\000\000\028\t\000\000D\n\000\000\028\n\000\000D\011\000\000D\012\000\000D\r\000\000D\014\000\000D\015\000\000D\016\000\000D\017\000\000D\018\000\000\028\011\000\000\028\012\000\001\020\006\000\001\020\007\000\001\020\b\000\001\020\t\000\001\020\n\000\001\020\011\000\001\020\012\000\001\020\r\000\001\020\014\000\000@\001\000\000@\002\000\000@\003\000\000@\004\000\000@\005\000\000\024\001\000\000\024\002\000\000\024\003\000\000@\006\000\000@\007\000\000\236\001\000\000\232\001\000\000\236\002\000\000\236\003\000\0004\001\000\000(\001\000\000<\001\000\000\000\001\000\000h\001\000\000h\002\000\0000\001\000\000,\001\000\000T\001\000\000T\002\000\0008\001"), (8, "\000\001\003\005\006\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&(*+,-.01235789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abchmoqsuvwxyz{|}\127\129\131\133\135\136\137\138\139\141\142\143\144\146\148\149\150\151\152\153\154\155\156\158\159\160\161\162\163\164\165\166\167\168\169\170\171\173\174\175\178\181\184\186\188\190\192\194\195\196\197\198\199\200\201\202\203\204\205\206\207\208\209\210\211\212\213\214\215\216\217\218\219\220\221\222\223\225\226\227\228\229\230\231\232\233\234\235\236\237\238"))
    
    and nullable =
      "\n\001x\016"
    
    and first =
      (48, "\b\000\002\000\017 @\004\000\000\000\000\000\000\000\000\016\000\b\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\004\002\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000@\000\000\000\000\000@\000\000\000\000\000@\000\000\000\000\000\000\004\000\000\000\000\016\000\000\000\000\000\000\004A\244\184\011H\133\016\000\000\000\000\000\b\000\002\000\017 \000\000\000\000\000\b\000\000\000\000@\000\b\000\002\000\016 \000\000\002\000\000\000\000\000\000\000\016\000\000\000\000\000\000 \b\000\002\000\016 \000\000\000\000\016\000\000\000\000\000@\000\000\000\000\000\000@\000\000@\000\000\000A\244\184\011H\133\000\000\000\000@\000")
    
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
