
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20250912

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TYPE_KEYWORD
    | SHAREDTOLINEAR
    | SENDVALUE
    | SENDCHANNEL
    | RPAR
    | RECEIVEVALUE
    | RECEIVECHANNEL
    | RAW of (
# 5 "lib/parser.mly"
       (string)
# 27 "lib/parser.ml"
  )
    | MINUS
    | LT
    | LPAR
    | LINEARTOSHARED
    | INTERNALCHOICE
    | ID of (
# 6 "lib/parser.mly"
       (string)
# 37 "lib/parser.ml"
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
# 50 "lib/parser.ml"
  )
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast

# 61 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ATOMIC _ ->
          23
      | COLON ->
          22
      | COMMA ->
          21
      | END ->
          20
      | EOF ->
          19
      | EQ ->
          18
      | EXTERNALCHOICE ->
          17
      | FUNC ->
          16
      | GT ->
          15
      | ID _ ->
          14
      | INTERNALCHOICE ->
          13
      | LINEARTOSHARED ->
          12
      | LPAR ->
          11
      | LT ->
          10
      | MINUS ->
          9
      | RAW _ ->
          8
      | RECEIVECHANNEL ->
          7
      | RECEIVEVALUE ->
          6
      | RPAR ->
          5
      | SENDCHANNEL ->
          4
      | SENDVALUE ->
          3
      | SHAREDTOLINEAR ->
          2
      | TYPE_KEYWORD ->
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
# 127 "lib/parser.ml"
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
# 149 "lib/parser.ml"
          ))
      | INTERNALCHOICE ->
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
# 165 "lib/parser.ml"
          ))
      | RECEIVECHANNEL ->
          Obj.repr ()
      | RECEIVEVALUE ->
          Obj.repr ()
      | RPAR ->
          Obj.repr ()
      | SENDCHANNEL ->
          Obj.repr ()
      | SENDVALUE ->
          Obj.repr ()
      | SHAREDTOLINEAR ->
          Obj.repr ()
      | TYPE_KEYWORD ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\019\000\000\030\024\017\t\000\018\000\026\000\000\000\021\000\023\000\000\000\020\000\022\000\025\031\005\000\000\000\000\000\003\004\002\r\000\000\000\000\b\000\000\028\006\001\000\016\007\000\011")
  
  and error =
    (24, "@\128\144\000\002\000\000\000 ;\012I\000 \000;\012I\000 \000\000\002\000\000\000\004;\012I\000 \000;\012I\000 \000\000\002\000\000\000\004;\012I\000 \000;\012I\000 \000;\012I\000 \000\000\003\000\000\000\002;\012I\000 \000\000\003\000\000\000\000\000\001\000\000\000\000\000\001\004\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\001\000\000\000\000\000\000\004;\012I\000\001\000\000\000\000\000\001\000\000\000\000\000\000\004;\012I\000\001\000\000\000\000\000\001\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\002\000\000\016\000\004\002\000\000\000\002;\014I\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000@\000\000\001\000;\012I\000\000\000\004\000\004\000\002\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000@\128\144\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\012 @\005\t\005@B\004\005T\005<\024\022\0054\0058\005F\n\004\005$\n\000H\000\025\n\000\000\000\000L\000N\000$\005\002\000 \000\024\005&\000(\000\024\000\000\0006B\006*\005\000\000\000\000RND\005\000\016\006\000\000\000$\000\000\012\000"), (16, "\000\018\000\026\000*\000q\0002\000B\000\022\000\006\000-\000z\000J\000R\000\242\000i\000\218\000b\000\170\000\234\000\130\000Z\0005\000\134\000\222\000&\000^\000%\000:\000\210\000f\001\026\000\n\000\178\000>\000\186\000\194\000\202\000F\001/\000N\000\162\0006\000\226\000\030\000\238\000\230\000V\001\006\000\"\001\n\001\014\000\014\000r\000.\000\146\000\154"))
  
  and lhs =
    (4, "\r\204\187\186\152\135veDDDDD3\"\016")
  
  and goto =
    ((8, "\003\000\0008\000,\000\000\000:\0006\000\000\000.\0000\0004\000 \000\"\000\022\000\000\000\000\003\000\000\000\000\000\000\000\000\000\005\000\000\000\000\000(\000\000\000\000\000\000\000\000\000\000 \000\003\000\000\000\000\000\000\000<\000\000\006\000\000\000\000\000\000\b\000"), (8, "I *>JIHK\030MN?O\027MNF\028\027@\030#$A0\0304,(F&.62E"))
  
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
# 228 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 61 "lib/parser.mly"
                                       ( (arg_name, t) )
# 236 "lib/parser.ml"
         in
        {
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
# 257 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 64 "lib/parser.mly"
                ( TyPrimitive(id) )
# 265 "lib/parser.ml"
         in
        {
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
# 65 "lib/parser.mly"
                ( t )
# 290 "lib/parser.ml"
         in
        {
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
# 311 "lib/parser.ml"
        ) = Obj.magic text in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_text_ in
        let _endpos = _endpos_text_ in
        let _v : (Mini_ast.decl) = 
# 35 "lib/parser.mly"
               ( Raw(text) )
# 319 "lib/parser.ml"
         in
        {
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
# 36 "lib/parser.mly"
                    ( tdef )
# 344 "lib/parser.ml"
         in
        {
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
# 37 "lib/parser.mly"
             ( f )
# 369 "lib/parser.ml"
         in
        {
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
        } = _menhir_stack in
        let ret : (Mini_ast.ty) = Obj.magic ret in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let xs : ((string * Mini_ast.ty) list) = Obj.magic xs in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 6 "lib/parser.mly"
       (string)
# 438 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_ret_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 448 "lib/parser.ml"
           in
          (
# 58 "lib/parser.mly"
                                                                                           ( Function({fname = name; params = ars; return = ret }) )
# 453 "lib/parser.ml"
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
# 489 "lib/parser.ml"
        ) = Obj.magic label in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_label_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 55 "lib/parser.mly"
                                  ( (label, t) )
# 497 "lib/parser.ml"
         in
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
# 515 "lib/parser.ml"
         in
        {
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
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((string * Mini_ast.ty) list) = 
# 145 "<standard.mly>"
    ( [] )
# 565 "lib/parser.ml"
         in
        {
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
# 590 "lib/parser.ml"
         in
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
# 608 "lib/parser.ml"
         in
        {
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
# 633 "lib/parser.ml"
         in
        {
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
# 32 "lib/parser.mly"
                        ( d )
# 665 "lib/parser.ml"
         in
        {
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
# 686 "lib/parser.ml"
        ) = Obj.magic uppercaseid in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_uppercaseid_ in
        let _endpos = _endpos_uppercaseid_ in
        let _v : (Mini_ast.ty) = 
# 43 "lib/parser.mly"
                                                                         ( TyAtomic(uppercaseid) )
# 694 "lib/parser.ml"
         in
        {
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
# 741 "lib/parser.ml"
           in
          (
# 44 "lib/parser.mly"
                                                                         ( TyInternalChoice(xs) )
# 746 "lib/parser.ml"
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
# 794 "lib/parser.ml"
           in
          (
# 45 "lib/parser.mly"
                                                                         ( TyExternalChoice(xs) )
# 799 "lib/parser.ml"
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
# 46 "lib/parser.mly"
                                                                         ( TySendChannel(t, cont) )
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
# 47 "lib/parser.mly"
                                                                         ( TyReceiveChannel(t, cont) )
# 920 "lib/parser.ml"
         in
        {
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
# 974 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 48 "lib/parser.mly"
                                                                         ( TySendValue(v, cont) )
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
# 1038 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 49 "lib/parser.mly"
                                                                         ( TyReceiveValue(v, cont) )
# 1048 "lib/parser.ml"
         in
        {
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
# 50 "lib/parser.mly"
                                                                         ( TyEnd )
# 1073 "lib/parser.ml"
         in
        {
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
# 51 "lib/parser.mly"
                                                                         ( TySharedToLinear(t) )
# 1119 "lib/parser.ml"
         in
        {
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
# 52 "lib/parser.mly"
                                                                         ( TyLinearToShared(t) )
# 1165 "lib/parser.ml"
         in
        {
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
# 1190 "lib/parser.ml"
         in
        {
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
# 1229 "lib/parser.ml"
         in
        {
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
# 1254 "lib/parser.ml"
         in
        {
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
# 1293 "lib/parser.ml"
         in
        {
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
        } = _menhir_stack in
        let t : (Mini_ast.ty) = Obj.magic t in
        let _3 : unit = Obj.magic _3 in
        let _name : (
# 6 "lib/parser.mly"
       (string)
# 1334 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_t_ in
        let _v : (Mini_ast.decl) = 
# 40 "lib/parser.mly"
                                             ( TypeDef({name = _name; body = t}) )
# 1343 "lib/parser.ml"
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
      "TYPE_KEYWORD";
      "SHAREDTOLINEAR";
      "SENDVALUE";
      "SENDCHANNEL";
      "RPAR";
      "RECEIVEVALUE";
      "RECEIVECHANNEL";
      "RAW";
      "MINUS";
      "LT";
      "LPAR";
      "LINEARTOSHARED";
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
      "Reducing production arg_type -> ID";
      "Reducing production arg_type -> s_type";
      "Reducing production decl -> RAW";
      "Reducing production decl -> type_def";
      "Reducing production decl -> func";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type";
      "Reducing production labeled_type -> ID COLON s_type";
      "Reducing production list(decl) ->";
      "Reducing production list(decl) -> decl list(decl)";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) -> separated_nonempty_list(COMMA,arg)";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) -> separated_nonempty_list(COMMA,labeled_type)";
      "Reducing production prog -> list(decl) EOF";
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
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg";
      "Reducing production separated_nonempty_list(COMMA,arg) -> arg COMMA separated_nonempty_list(COMMA,arg)";
      "Reducing production separated_nonempty_list(COMMA,labeled_type) -> labeled_type";
      "Reducing production separated_nonempty_list(COMMA,labeled_type) -> labeled_type COMMA separated_nonempty_list(COMMA,labeled_type)";
      "Reducing production type_def -> TYPE_KEYWORD ID EQ s_type";
    |])
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
  module Symbols = struct
    
    type _ terminal = 
      | T_error : unit terminal
      | T_TYPE_KEYWORD : unit terminal
      | T_SHAREDTOLINEAR : unit terminal
      | T_SENDVALUE : unit terminal
      | T_SENDCHANNEL : unit terminal
      | T_RPAR : unit terminal
      | T_RECEIVEVALUE : unit terminal
      | T_RECEIVECHANNEL : unit terminal
      | T_RAW : (
# 5 "lib/parser.mly"
       (string)
# 1439 "lib/parser.ml"
    ) terminal
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_ID : (
# 6 "lib/parser.mly"
       (string)
# 1449 "lib/parser.ml"
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
# 1462 "lib/parser.ml"
    ) terminal
    
    type _ nonterminal = 
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
            X (T T_TYPE_KEYWORD)
        | 2 ->
            X (T T_SHAREDTOLINEAR)
        | 3 ->
            X (T T_SENDVALUE)
        | 4 ->
            X (T T_SENDCHANNEL)
        | 5 ->
            X (T T_RPAR)
        | 6 ->
            X (T T_RECEIVEVALUE)
        | 7 ->
            X (T T_RECEIVECHANNEL)
        | 8 ->
            X (T T_RAW)
        | 9 ->
            X (T T_MINUS)
        | 10 ->
            X (T T_LT)
        | 11 ->
            X (T T_LPAR)
        | 12 ->
            X (T T_LINEARTOSHARED)
        | 13 ->
            X (T T_INTERNALCHOICE)
        | 14 ->
            X (T T_ID)
        | 15 ->
            X (T T_GT)
        | 16 ->
            X (T T_FUNC)
        | 17 ->
            X (T T_EXTERNALCHOICE)
        | 18 ->
            X (T T_EQ)
        | 19 ->
            X (T T_EOF)
        | 20 ->
            X (T T_END)
        | 21 ->
            X (T T_COMMA)
        | 22 ->
            X (T T_COLON)
        | 23 ->
            X (T T_ATOMIC)
        | _ ->
            assert false
    
    and nonterminal =
      fun nt ->
        match nt with
        | 13 ->
            X (N N_arg)
        | 12 ->
            X (N N_arg_type)
        | 11 ->
            X (N N_decl)
        | 10 ->
            X (N N_func)
        | 9 ->
            X (N N_labeled_type)
        | 8 ->
            X (N N_list_decl_)
        | 7 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 6 ->
            X (N N_loption_separated_nonempty_list_COMMA_labeled_type__)
        | 5 ->
            X (N N_prog)
        | 4 ->
            X (N N_s_type)
        | 3 ->
            X (N N_separated_nonempty_list_COMMA_arg_)
        | 2 ->
            X (N N_separated_nonempty_list_COMMA_labeled_type_)
        | 1 ->
            X (N N_type_def)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\004\030&\006\022\b\022\030,\n\022\014\022\030,\016\022\026\022\028\022\030.$\022\005\r \019,\005*0\t\r \t \t,\t \t \t,\t \t \t \t\018\"\030\024\030.\030\t\025\007\015\012\020 \t\027,\007\003\011\017(\021\023\017")
    
    and rhs =
      ((8, "\011\030.\025\030\t\018\003\021\"\030\024\015\012\020 \t\030.\t\023\017\007\005\017(0\028\022\r $\022\r \n\022\t,\t \016\022\t,\t \b\022\030,\t \014\022\030,\t *\006\022\t \026\022\t \027\027,\007\019\019,\005\004\030&\t"), (8, "\000\001\004\005\006\007\b\t\017\020\020\022\022\023\023\024\026\027\031#)/5;<@DEHILP"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMN")
    
    and lr0_items =
      ((16, "\000\000x\001x\002x\003`\001`\002T\001T\002T\003T\004L\001L\002X\001X\002X\003X\004P\001P\002d\001d\002D\001D\002 \001 \002H\001H\0028\001H\003H\004t\001p\001t\002t\003\\\001@\001 \003D\003D\004d\003d\004P\003P\004P\005P\006X\005X\006L\003L\004L\005L\006T\005T\006`\003`\004x\004\016\001\028\001\028\002\028\003\004\001\004\002\b\001\012\001\004\0030\001\028\004\028\005\028\006\028\007\028\bl\001h\001l\002l\003\020\001\000\001<\001<\002\024\001(\001(\002"), (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFHIJKLMNOPQ"))
    
    and nullable =
      "\003\128"
    
    and first =
      (24, "@\128\144@\000\000\000\002\000\000\002\000;\012I@\128\144\000\002\000\000\002\000@\128\128\000\002\000\000\000\128@\128\128;\014I\000\002\000")
    
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
