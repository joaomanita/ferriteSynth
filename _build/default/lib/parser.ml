
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
# 40 "lib/parser.ml"
  )
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
# 53 "lib/parser.ml"
  )
    | ID of (
# 7 "lib/parser.mly"
       (string)
# 58 "lib/parser.ml"
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
# 74 "lib/parser.ml"
  )
    | AT
    | ACQUIRE
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast
  open Utils

# 88 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ACQUIRE ->
          45
      | AT ->
          44
      | ATOMIC _ ->
          43
      | COLON ->
          42
      | COMMA ->
          41
      | DEFINE_CHOICE ->
          40
      | EITHER ->
          39
      | END ->
          38
      | EOF ->
          37
      | EQ ->
          36
      | EXCLAMATION ->
          35
      | EXTERNALCHOICE ->
          34
      | FUNC ->
          33
      | GT ->
          32
      | ID _ ->
          31
      | INT _ ->
          30
      | INTERNALCHOICE ->
          29
      | INT_T ->
          28
      | LBRACE ->
          27
      | LINEARTOSHARED ->
          26
      | LPAR ->
          25
      | LSQUARE ->
          24
      | LT ->
          23
      | MINUS ->
          22
      | RAW _ ->
          21
      | RBRACE ->
          20
      | REC ->
          19
      | RECEIVECHANNEL ->
          18
      | RECEIVEVALUE ->
          17
      | REC_FUNC ->
          16
      | RELEASE ->
          15
      | RPAR ->
          14
      | RSQUARE ->
          13
      | S ->
          12
      | SEMICOLON ->
          11
      | SENDCHANNEL ->
          10
      | SENDVALUE ->
          9
      | SESSION ->
          8
      | SHAREDTOLINEAR ->
          7
      | STRING_T ->
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
# 8 "lib/parser.mly"
       (string)
# 202 "lib/parser.ml"
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
# 230 "lib/parser.ml"
          ))
      | INT _v ->
          Obj.repr (_v : (
# 9 "lib/parser.mly"
       (int)
# 236 "lib/parser.ml"
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
      | RAW _v ->
          Obj.repr (_v : (
# 6 "lib/parser.mly"
       (string)
# 258 "lib/parser.ml"
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
      | Z ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000\000\00063\000\000\000B\031\000\000\000\000\000\000\000\000\000\000\000C1\000\000\000\000\000\000\000\000\030\000\000\000%\000\000\000\000\000!\000\000\000&\000$+\"20\000\000\000\006\000#\000-\000/\000\000\000(\000\000\000*\000\000\000'\000\000\000)\000.\000,\000@\000\000?\n\000\000\000\000\000\000\000\000\003\000\000\026\002\024\000\000\000\000\000\000\000\020\000\000\005\000\000\000\000\0008\000\029\000\000\000>\000\0004\000\t\000\000:\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\000\b\000\000\000\000\000\000\000\000A\000\000\000\000\000\000\000\007\000\017\000\000<\014\011\016\001\000\027\r\012\000\022\015")
  
  and error =
    (46, "\016\000\004\000D\128\000\000\000\004\000\000\000\000\016\000\128\000\000\000\000\000\004\000\000\000\000\128@\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000 \004>\151\002\210!@\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\004>\151\002\210!@\000\000@\000\000C\233p-\"\020\000\000\004\000\000\004>\151\002\210!@\000\000@\000\000C\233p-\"\020\000\000\004\000\000\004\000\128\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\016\250\\\011H\133\000\000\001\000\000\001\015\165\192\180\136P\000\000\016\000\000\016\250\\\011H\133\000\000\001\000\000\001\015\165\192\180\136P\000\000\000\000\000\000\000\000@\000\000\000\000\000\001\001\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000@\000\000C\233p-\"\020\000H$B\001\128\000\000\000\000\001\000\000\000\000 \000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\016\016\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016C\233p-\"\020\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\001\004>\151\002\210!@\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\001\004>\151\002\210!@\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\001\004>\151\002\210!@\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\001\004>\151\002\210!@\000\000\000 \000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\016\250\\\011H\133\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\001@\000\000\000\000\000\000\000@\000\000\000\b\000\000\000\000\016\000\000\000\002\000\001\000\000\000\000\000\000\000\132>\151\002\210!@\000\000\000\000\000\000\002\000\000\000`\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000 \000\000\000\000\000\000 \000C\233p-\"\020\000\000\000@\000\000\000\000\192\000\000\128\000\003\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\b\b\000\000\000\000\000\000\000\000\000\000\000\128\000\000\144\016\000\000\000\000\000\000\000\016\000\000\004\000\000\000\016\000\000\000\001\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\004\004\000\000\000\000\000\000\000\004\000\000\001\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\b\000\000\001\000\000\000\000\016\000\000\000\000\000\000\000\000\002\000\001\000\000\000\b\000\000\000\000\000\000!\000\000\000\000\000\000 \000C\233p-\"\020\000\000\000@\000\000\000\000\192\000\000\130\000\000\000\000\000\000\000\128\128\000\000\000\000\002\000\000\002@@\000\000\000\001\001\000\000\000\000\000\004\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \128\000\000\000\000\000\000  \000\000\000\000\000\128\000\000\144\016\000\000\000\000@@\000\000\000\000\001\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\004\000\000\000\000\000\001\000\000\000@\000\000\000\000\000\000\000\016\000\000\000\000\000\000\bC\233p-\"\020\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\b\000\000@\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\001\000\017 \000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((16, "\000\003\000T\000P\000\184\000\007\000\184\000\000\000\000\000\182\000\182\000\003\000\000\000\000\000R\000\003\000z\000\003\000\138\000\003\000V\000\003\000\168\000\003\000\174\000\000\000\000\000\186\000\003\000\174\000\003\000\214\000\003\000\152\000\003\000\000\000\230\000\030\000\216\000\000\000\240\000\003\000\003\000\184\000T\000\000\000n\000(\000f\000\000\000n\000\000\000\000\000\000\000\000\000\000\000p\000\003\000\164\000\000\000\202\000\000\000\220\000\000\000\144\000\000\000\136\000\003\000\160\000\000\000\144\000\003\000\170\000\000\000\162\000\003\000\178\000\000\000\158\000\003\000\186\000\000\000\166\000\000\000\188\000\000\000\234\000\000\000\003\000\236\000\000\000\000\000\148\000J\000\184\000\198\000\214\000L\000\184\000\003\000\000\000\014\000\132\000\000\000\000\000\000\000\244\000\138\000t\000\003\000\224\000\028\000\028\000\000\001\018\000J\000\000\000t\000\003\000`\000\b\000`\000\000\000\017\000\000\000h\000`\000r\000\000\000v\000f\000\000\000n\000\000\000:\000L\000\000\000L\000\246\0008\000`\000\003\000l\000\006\000\214\000J\000\164\000\003\000h\000\144\000\132\000\000\000\136\000\000\000\148\000\170\000J\000\168\000\003\000h\000\160\000\148\000\000\000\134\000\136\000\186\000\174\000\140\000t\000\003\000\000\000\166\000\000\000H\000\140\000\000\000\000\000\000\000\000\000\000\000<\000\000\000\000\000\000\000\003\000\000\000\000"), (16, "\000.\001\218\000\006\001\238\000m\0002\0006\000>\000F\000N\000}\000V\000m\000}\000f\000\217\000j\000r\000z\000}\001j\000a\000\170\000I\001\190\000\130\000}\000\138\000\142\000\209\000\166\000}\001n\000\182\000I\001\190\000Q\000\206\000\022\002\138\000}\000}\000\210\000\225\000\214\001\226\000\150\002>\000a\001\150\002.\000\190\000Y\001\206\000\158\002f\000\233\001\246\001\198\000\158\001v\000\r\002\"\000\014\000:\000\241\000R\002\211\001\254\001\134\002\026\002\n\002\006\000\n\000\178\002\018\001^\002\182\000\186\001\222\0022\002:\001\214\000\194\000B\002V\002Z\000\202\002b\002n\001\178\001\174\000J\002\130\002\134\002\146\001\154\000\226\002\154\000\134\002\162\002\158\002\142\002\174\001\002\001r\002J\000Z\002v\001\n\000v\002B\001\018\001\026\000\234\001J\000n\001\"\002j\000b\001:\0012\001*\000&\002\150\001B\001R\000*\001Z\001f\000~\001~\001\130\000\242\001\138\000\018\001\170\002*\000\146\001\186\000\154\001\202\000\250\000\162"))
  
  and lhs =
    (8, "\000\026\025\024\024\023\022\021\021\020\020\020\020\020\020\020\019\018\017\017\016\016\015\015\014\014\r\012\012\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\011\n\t\b\b\007\007\006\006\005\005\004\004\003\003\002\001\001")
  
  and goto =
    ((8, "\005\000\000\138\000~\000\000\000\000f\000\000\0008\000@\000p\000>\000\180\000\000\000\000\142\000v\000N\000F\000\000\138\000\000\0006\000Z\000\000\000~\000\000\000\000\000\000\000\000\000^\000\000\000\000\000\000\000\000\000D\000\000\000|\000\000\000V\000\000\000H\000\000\000\000\000\000\000\000\128\000\000\000\000\000\r\000\000\030\000\018\000\152\000\000\000\000\000\000\000\134\000\152\144\000\000\128\000\000\164\176\000\160\000\000\000\002\003\000\000\000\000\000\000\000\000d\000\007\000\000\000t\000\134\000p\000\142\140\000\000\000\000\000\000\000z\000&\018\000\000\000\000\000\000\000v\000d\000\000\000\000X\000\000\000\000\000\000\000\000\000\012\000\000"), (8, "\176\177\bi_\129\127\178\176\1777\179\138\160\180\178\182\183\184\186di\185\134\182\183\184\18677j\15977e7778T7\134JR7D>P7\175@77\bL,\1367:77\170V7\1717\173N7\142B\0077H\149Y\134\bn\t\146\173F\148\152\1572zuqh\024<\132}{"))
  
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
# 354 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_count_ in
        let _v : ((string * Mini_ast.ty) * int) = 
# 213 "lib/parser.mly"
    (
      ((arg_name, t), Option.value count ~default:0)
    )
# 364 "lib/parser.ml"
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
# 218 "lib/parser.mly"
                ( t )
# 389 "lib/parser.ml"
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
# 407 "lib/parser.ml"
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
# 432 "lib/parser.ml"
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
# 95 "lib/parser.mly"
      ( (TyEither (t1, t2)) )
# 492 "lib/parser.ml"
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
# 527 "lib/parser.ml"
        ) = Obj.magic lbl in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_lbl_ in
        let _endpos = _endpos_ty_ in
        let _v : (string * Mini_ast.ty) = 
# 99 "lib/parser.mly"
    (
      (lbl, ty)
    )
# 537 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 627 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__11_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 637 "lib/parser.ml"
           in
          (
# 164 "lib/parser.mly"
    (
      ClosedFunction(
        (TyFunc((name, List.map fst ars), ret),
         String.concat "" body)
      )
    )
# 647 "lib/parser.ml"
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
        let xs : (((string * Mini_ast.ty) * int) list) = Obj.magic xs in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let tList : (Mini_ast.ty list) = Obj.magic tList in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 7 "lib/parser.mly"
       (string)
# 759 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 769 "lib/parser.ml"
           in
          (
# 177 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      ClosedFunction
        (TyScheme 
           (tList, TyFunc (
            ((name, args), ret))), String.concat "" body)
    )
# 780 "lib/parser.ml"
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
# 802 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 58 "lib/parser.mly"
               ( Raw(text) )
# 810 "lib/parser.ml"
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
# 59 "lib/parser.mly"
                    ( tdef )
# 835 "lib/parser.ml"
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
# 60 "lib/parser.mly"
                         ( ChoiceDef(cdef) )
# 860 "lib/parser.ml"
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
# 885 "lib/parser.ml"
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
# 62 "lib/parser.mly"
                      ( f )
# 910 "lib/parser.ml"
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
# 63 "lib/parser.mly"
                           ( closed_f )
# 935 "lib/parser.ml"
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
# 960 "lib/parser.ml"
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
# 1020 "lib/parser.ml"
        ) = Obj.magic name in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Mini_ast.choice) = 
# 108 "lib/parser.mly"
    (
      (TyDefineChoice (name, branches))
    )
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
# 7 "lib/parser.mly"
       (string)
# 1165 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__17_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 1175 "lib/parser.ml"
           in
          (
# 124 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyFunc (((name, args), ret)), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 1184 "lib/parser.ml"
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
# 1203 "lib/parser.ml"
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
# 1231 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1239 "lib/parser.ml"
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
# 1257 "lib/parser.ml"
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
# 1289 "lib/parser.ml"
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
# 1307 "lib/parser.ml"
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
# 1332 "lib/parser.ml"
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
# 1350 "lib/parser.ml"
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
# 1377 "lib/parser.ml"
        ) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x = 
# 188 "<standard.mly>"
    ( x )
# 1387 "lib/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 1392 "lib/parser.ml"
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
# 55 "lib/parser.mly"
                        ( d )
# 1425 "lib/parser.ml"
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
# 1443 "lib/parser.ml"
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
# 1482 "lib/parser.ml"
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
# 71 "lib/parser.mly"
                                                                         ( TyPrimitive("Int"))
# 1507 "lib/parser.ml"
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
# 72 "lib/parser.mly"
                                                                         ( TyPrimitive("String"))
# 1532 "lib/parser.ml"
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
# 1553 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 73 "lib/parser.mly"
                                                                         ( TyPrimitive(id) )
# 1561 "lib/parser.ml"
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
# 1603 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 74 "lib/parser.mly"
                                                                         ( TyPrimitive(id ^ "<" ^ (String.concat ", " (List.map print_type schemelist)) ^ ">" ))
# 1611 "lib/parser.ml"
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
# 1632 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 75 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 1640 "lib/parser.ml"
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
# 76 "lib/parser.mly"
                                                                         ( TyInternalChoice(c) )
# 1686 "lib/parser.ml"
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
# 77 "lib/parser.mly"
                                                                         ( TyExternalChoice(c) )
# 1732 "lib/parser.ml"
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
# 1772 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 78 "lib/parser.mly"
                                                                         ( TyInternalChoiceId(id) )
# 1782 "lib/parser.ml"
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
# 1822 "lib/parser.ml"
        ) = Obj.magic id in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Mini_ast.ty) = 
# 79 "lib/parser.mly"
                                                                         ( TyExternalChoiceId(id) )
# 1832 "lib/parser.ml"
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
# 80 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
# 1892 "lib/parser.ml"
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
# 81 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 1952 "lib/parser.ml"
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
# 82 "lib/parser.mly"
                                                                         ( TySendValue(t1, cont) )
# 2012 "lib/parser.ml"
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
# 83 "lib/parser.mly"
                                                                         ( TyReceiveValue(t1, cont) )
# 2072 "lib/parser.ml"
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
# 84 "lib/parser.mly"
                                                                         ( TyEnd )
# 2097 "lib/parser.ml"
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
# 85 "lib/parser.mly"
                                                                         ( TySharedToLinear(t, 0) )
# 2143 "lib/parser.ml"
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
# 86 "lib/parser.mly"
                                                                         ( TyLinearToShared(t, 0) )
# 2189 "lib/parser.ml"
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
                                                                         ( TySession(t) )
# 2235 "lib/parser.ml"
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
                                                                         ( TyRec(t) )
# 2281 "lib/parser.ml"
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
# 89 "lib/parser.mly"
                                                                         ( TyZ (t) )
# 2306 "lib/parser.ml"
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
# 90 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2331 "lib/parser.ml"
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
# 91 "lib/parser.mly"
                                                                         ( TyFixShared )
# 2356 "lib/parser.ml"
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
# 187 "lib/parser.mly"
      ( List.map (fun t -> TyAtomic t) ts )
# 2381 "lib/parser.ml"
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
# 7 "lib/parser.mly"
       (string)
# 2534 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__20_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 2544 "lib/parser.ml"
           in
          (
# 202 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function
        (TyScheme 
           (tList, TyFunc (
            ((name, args), ret))), argcounts,  recursive, (required_funcs, suggested_funcs))
    )
# 2556 "lib/parser.ml"
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
# 2578 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2586 "lib/parser.ml"
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
# 2621 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2629 "lib/parser.ml"
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
# 2650 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 2658 "lib/parser.ml"
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
# 2693 "lib/parser.ml"
        ) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 2701 "lib/parser.ml"
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
# 2726 "lib/parser.ml"
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
# 2765 "lib/parser.ml"
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
# 2790 "lib/parser.ml"
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
# 2829 "lib/parser.ml"
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
# 153 "lib/parser.mly"
                                ( [] )
# 2847 "lib/parser.ml"
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
# 155 "lib/parser.mly"
                                ( ids )
# 2886 "lib/parser.ml"
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
# 2934 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Mini_ast.decl) = 
# 67 "lib/parser.mly"
                                                        ( TypeDef({name = _name; body = t}) )
# 2943 "lib/parser.ml"
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
# 3012 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v : (Mini_ast.decl) = 
# 68 "lib/parser.mly"
                                                                                          ( TypeDef({name = _name ^ "<" ^ (String.concat ", " (List.map print_type schemelist)) ^ ">"; body = TyScheme(schemelist, t)}) )
# 3021 "lib/parser.ml"
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
# 3132 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__14_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 3142 "lib/parser.ml"
           in
          (
# 141 "lib/parser.mly"
    (
      let args = List.map (fun a -> fst a) ars in
      let argcounts = List.map (fun a -> snd a) ars in
      Function (TyUnitRetFunc (name, args), argcounts, recursive, (required_funcs, suggested_funcs))
    )
# 3151 "lib/parser.ml"
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
# 221 "lib/parser.mly"
      ( 0)
# 3177 "lib/parser.ml"
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
# 222 "lib/parser.mly"
                          ( t + 1 )
# 3223 "lib/parser.ml"
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
# 3390 "lib/parser.ml"
    ) terminal
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
# 3403 "lib/parser.ml"
    ) terminal
      | T_ID : (
# 7 "lib/parser.mly"
       (string)
# 3408 "lib/parser.ml"
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
# 3424 "lib/parser.ml"
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
            X (T T_STRING_T)
        | 7 ->
            X (T T_SHAREDTOLINEAR)
        | 8 ->
            X (T T_SESSION)
        | 9 ->
            X (T T_SENDVALUE)
        | 10 ->
            X (T T_SENDCHANNEL)
        | 11 ->
            X (T T_SEMICOLON)
        | 12 ->
            X (T T_S)
        | 13 ->
            X (T T_RSQUARE)
        | 14 ->
            X (T T_RPAR)
        | 15 ->
            X (T T_RELEASE)
        | 16 ->
            X (T T_REC_FUNC)
        | 17 ->
            X (T T_RECEIVEVALUE)
        | 18 ->
            X (T T_RECEIVECHANNEL)
        | 19 ->
            X (T T_REC)
        | 20 ->
            X (T T_RBRACE)
        | 21 ->
            X (T T_RAW)
        | 22 ->
            X (T T_MINUS)
        | 23 ->
            X (T T_LT)
        | 24 ->
            X (T T_LSQUARE)
        | 25 ->
            X (T T_LPAR)
        | 26 ->
            X (T T_LINEARTOSHARED)
        | 27 ->
            X (T T_LBRACE)
        | 28 ->
            X (T T_INT_T)
        | 29 ->
            X (T T_INTERNALCHOICE)
        | 30 ->
            X (T T_INT)
        | 31 ->
            X (T T_ID)
        | 32 ->
            X (T T_GT)
        | 33 ->
            X (T T_FUNC)
        | 34 ->
            X (T T_EXTERNALCHOICE)
        | 35 ->
            X (T T_EXCLAMATION)
        | 36 ->
            X (T T_EQ)
        | 37 ->
            X (T T_EOF)
        | 38 ->
            X (T T_END)
        | 39 ->
            X (T T_EITHER)
        | 40 ->
            X (T T_DEFINE_CHOICE)
        | 41 ->
            X (T T_COMMA)
        | 42 ->
            X (T T_COLON)
        | 43 ->
            X (T T_ATOMIC)
        | 44 ->
            X (T T_AT)
        | 45 ->
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
      (8, "\000\b@0XT\017\017\021BJ\004\014\0160\0180\0200\0220\0260\003B $0&0(060:<0@BP0@0\021BF0@B/BNX\\\003\023T\023B/B\023B\023B\023T\023B\023T\023B\023T\023B\023T\023B\023B\023B\023\024J\023\024,D@0\021B4@V\0233V>\029\r\031\030.B\0238,#Z\n\"12\006@T\015\015\024\025\012\015\024\t\028*#*5T\r4\031\030.B\0238Z\n12\025\t\028*#*8Z\n12\025\t\028*RH8@\024@V\023\011*-T\011\005\007\019\027!L%')!+")
    
    and rhs =
      ((8, "\027@V3\029\023\"P0\023T\023B@V\023D@4\031\030.B\0238#*D@0\021B4\031\030.B\0238#*,\007'%\005+\019RH8@\024\011*D@4\031\030.B\0238Z\n12\025\t\028*,#)!\rV>!L\006\015\024:\014@@0\021BX<0/BF0/B<0@BF0@B\0220\023T\023B&0\023T\023B\0200\023T\023B$0\023T\023BN\0160\023B60\023B\0180\023B(0\023B\003 \\\017D@0\021B4\031\030.B\0238Z\n12\025\t\028*XXT\017@@T\01555T\r--T\011\012\015\024\b@J\023\024\b@0\021BJ\023\024D@4\031\0308Z\n12\025\t\028*\004\0260\003B"), (8, "\000\001\005\006\006\007\r\016\027)*+,-./07HHJJLLMMOQQTUVW[\\`dhlrx~\132\133\137\141\145\149\150\151\152\153\173\174\177\178\181\182\185\186\189\189\192\197\205\219\220\224"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\127\128\129\130\131\132\133\134\135\136\137\138\139\140\141\142\143\144\145\146\147\148\149\150\151\152\153\154\155\156\157\158\159\160\161\162\163\164\165\166\167\168\169\170\171\172\173\174\175\176\177\178\179\180\181\182\183\184\185")
    
    and lr0_items =
      ((32, "\000\000\000\000\000\000\252\001\000\000\248\001\000\000\252\002\000\000\248\002\000\000\252\003\000\000\212\001\000\000\208\001\000\000\212\002\000\000\212\003\000\000\200\001\000\000\252\004\000\000\252\005\000\000\252\006\000\001\004\001\000\000x\001\000\000\172\001\000\000\172\002\000\000\180\001\000\000\180\002\000\000\160\001\000\000\160\002\000\000\152\001\000\000\152\002\000\001\b\001\000\001\b\002\000\001\b\003\000\001\b\004\000\000\192\001\000\000\164\001\000\000\164\002\000\000\156\001\000\000\156\002\000\000\184\001\000\000\184\002\000\000\176\001\000\000\176\002\000\000t\001\000\000\144\001\000\000\136\001\000\000\144\002\000\000\136\002\000\000\144\003\000\000\144\004\000\000\020\001\000\000\020\002\000\000\128\001\000\000|\001\000\000\128\002\000\000\128\003\000\000\128\004\000\000\148\001\000\000\140\001\000\000\148\002\000\000\140\002\000\000\148\003\000\000\148\004\000\000\140\003\000\000\140\004\000\000\168\001\000\000\132\001\000\000\196\001\000\000\188\001\000\000\020\003\000\000\020\004\000\000\020\005\000\000\020\006\000\000\136\003\000\000\136\004\000\000\176\003\000\000\176\004\000\000\184\003\000\000\184\004\000\000\156\003\000\000\156\004\000\000\156\005\000\000\156\006\000\000\164\003\000\000\164\004\000\000\164\005\000\000\164\006\000\000\152\003\000\000\152\004\000\000\152\005\000\000\152\006\000\000\160\003\000\000\160\004\000\000\160\005\000\000\160\006\000\000\180\003\000\000\180\004\000\000\172\003\000\000\172\004\000\000\252\007\000\000\252\b\000\000\248\003\000\000\248\004\000\000\248\005\000\000$\001\000\001\000\001\000\000\204\001\000\000D\001\000\000 \001\000\000\028\001\000\001\000\002\000\000\204\002\000\000D\002\000\000 \002\000\000\028\002\000\000\204\003\000\000 \003\000\000\204\004\000\000 \004\000\000\204\005\000\000 \005\000\000\204\006\000\000 \006\000\000\004\001\000\000\004\002\000\000\b\001\000\000\004\003\000\000d\001\000\000d\002\000\000\004\004\000\000\\\001\000\000\204\007\000\000 \007\000\000\204\b\000\000 \b\000\000\204\t\000\000 \t\000\000\204\n\000\000 \n\000\000\204\011\000\000 \011\000\000\204\012\000\000 \012\000\000L\001\000\000L\002\000\000\204\r\000\000\204\014\000\000\016\001\000\000\204\015\000\000\204\016\000\000p\001\000\000\220\001\000\000\216\001\000\000\220\002\000\000\220\003\000\000p\002\000\000p\003\000\000\204\017\000\000\244\001\000\000\244\002\000\000\244\003\000\000\204\018\000\000\204\019\000\000\204\020\000\000 \r\000\000 \014\000\000\228\001\000\000\224\001\000\000\228\002\000\000\228\003\000\001\000\003\000\000D\003\000\000\028\003\000\001\000\004\000\000D\004\000\000\028\004\000\001\000\005\000\000D\005\000\000\028\005\000\000D\006\000\000\028\006\000\000D\007\000\000\028\007\000\000D\b\000\000\028\b\000\000D\t\000\000\028\t\000\000D\n\000\000D\011\000\000D\012\000\000D\r\000\000D\014\000\000D\015\000\000D\016\000\000D\017\000\000\028\n\000\000\028\011\000\001\000\006\000\001\000\007\000\001\000\b\000\001\000\t\000\001\000\n\000\001\000\011\000\001\000\012\000\001\000\r\000\001\000\014\000\000@\001\000\000@\002\000\000@\003\000\000@\004\000\000@\005\000\000\024\001\000\000\024\002\000\000\024\003\000\000@\006\000\000@\007\000\000\236\001\000\000\232\001\000\000\236\002\000\000\236\003\000\0004\001\000\000(\001\000\000<\001\000\000\000\001\000\000h\001\000\000h\002\000\0000\001\000\000,\001\000\000T\001\000\000T\002\000\0008\001"), (8, "\000\001\003\005\006\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&(*+,-.01235789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abchmoqsuvwxyz{|}\127\129\131\133\135\137\138\139\140\141\142\143\144\145\147\148\149\150\151\152\153\154\155\156\157\158\159\160\162\163\164\167\170\173\175\177\179\181\182\183\184\185\186\187\188\189\190\191\192\193\194\195\196\197\198\199\200\201\202\203\204\205\206\207\208\209\210\212\213\214\215\216\217\218\219\220\221\222\223\224\225"))
    
    and nullable =
      "\b\011\192\128"
    
    and first =
      (46, "\016\000\004\000D\129\000 \000\000\000\000\000\000\000\004\000\004\000\000\000\000\000\004\000\000\000\000\000\000\000\000\004\000\000\000\000\000\016\000\000\000\000\000@\000\000\000\000\000\000\016\000\000\000\001\000\000\000\000\000\000\001\016\250\\\011H\133 \000\000\000\000\000@\000\016\001\018\000\000\000\000\000\002\000\000\000\000@\000\016\000\004\000@\128\000\000\016\000\000\000\000\000\000\004\000\000\000\000\000\000 \016\000\004\000@\128\000\000\000\001\000\000\000\000\000\016\000\000\000\000\000\000@\000\000\128\000\000\001\015\165\192\180\136P\000\000\000\016\000\000")
    
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
