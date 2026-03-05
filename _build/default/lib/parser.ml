
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
    | MINUS
    | LT
    | LPAR
    | LINEARTOSHARED
    | INTERNALCHOICE
    | ID of (
# 5 "lib/parser.mly"
       (string)
# 32 "lib/parser.ml"
  )
    | GT
    | FUNC
    | EXTERNALCHOICE
    | EQ
    | EOF
    | END
    | COMMA
    | COLON
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Mini_ast

# 51 "lib/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | COLON ->
          21
      | COMMA ->
          20
      | END ->
          19
      | EOF ->
          18
      | EQ ->
          17
      | EXTERNALCHOICE ->
          16
      | FUNC ->
          15
      | GT ->
          14
      | ID _ ->
          13
      | INTERNALCHOICE ->
          12
      | LINEARTOSHARED ->
          11
      | LPAR ->
          10
      | LT ->
          9
      | MINUS ->
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
# 5 "lib/parser.mly"
       (string)
# 129 "lib/parser.ml"
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
    (8, "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\000\017\000\000\028\022\b\000\016\000\024\000\000\000\019\000\021\000\000\000\018\000\020\000\023\029\014\000\031\001\000\000\000\000\000\000\003\004\002\n\000\000\000\000\005\000\000\026\000\015\000\007")
  
  and error =
    (22, "@\001\000\000\016\000\000\004\014\198$\000@\000\236b@\004\000\000\001\000\000\000\b\236b@\004\000\014\198$\000@\000\000\016\000\000\000\142\198$\000@\000\236b@\004\000\014\198$\000@\000\000\024\000\000\000N\198$\000@\000\000\024\000\000\000\000\000\128\000\000\000\000\b \000@\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\002\000\000\000\000\000\000\142\198$\000\002\000\000\000\000\000 \000\000\000\000\000\b\236b@\000 \000\000\000\000\002\000\000\000\000\000 \000\000\000\000\000\000\000\000\004\000\016\000\000\000\000\000\000\000\004\000\000@\000\b\000\004\004\000\000\000\019\177\201\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\128\000\000\b\003\177\137\000\000\000\004\000\b\000\016\000\000\000\000\000\b\000\000\000\000\004\128\000\000\000")
  
  and start =
    1
  
  and action =
    ((8, "\014\">\005\006\005@B\012\005V\005\\\030\022\0054\005:\005T\0200\005P\020\000H\000\n\020\000\000\000P\000<\000.\005\014\000\030\000\024\005(\000&\000,\000\000\000\n\000\000\0054<\0044\005\000\000\000\000,Z8\005\000\005\004\000&\000\005\000"), (16, "\000\018\000\026\000*\000a\0002\000B\000\006\000!\000\006\000J\000R\000\254\000\022\000\234\000b\000\246\000\021\000\130\001&\000i\000u\000\166\0001\000Z\000)\000z\000&\001\018\000:\000\174\000\n\000>\000\182\000\198\000\190\000F\000\206\0013\000N\000\238\000\242\000\030\001\026\000\158\000\150\000^\000\"\000\250\000\014\000f\000r\000V\000.\001\022\000\142\0006"))
  
  and lhs =
    (4, "\014\221\203\186\153\136weUUUUD3!\016")
  
  and goto =
    ((8, "\003\000\0008\000.\000\000\000<\000:\000\000\000*\0000\0004\000\003\000\003\000\014\000\000\000\000\026\000\000\000\000\000\000\000\0006\000\000\000\000\000,\000\000\000\000\000\000\000\000\"\000\000\026\000\000\003\000\018\000\000\000\000\000\000\000 \000\000 \000\000\000\000\000"), (8, "67\027C\"9:#D\030\027ONIA\028 \03087KHB\030LN+/3'I%)5-1"))
  
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
# 5 "lib/parser.mly"
       (string)
# 202 "lib/parser.ml"
        ) = Obj.magic arg_name in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_arg_name_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 65 "lib/parser.mly"
                                       ( (arg_name, t) )
# 210 "lib/parser.ml"
         in
        {
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
# 5 "lib/parser.mly"
       (string)
# 231 "lib/parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Mini_ast.ty) = 
# 68 "lib/parser.mly"
                ( TyPrimitive(id) )
# 239 "lib/parser.ml"
         in
        {
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
# 69 "lib/parser.mly"
                ( t )
# 264 "lib/parser.ml"
         in
        {
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
# 5 "lib/parser.mly"
       (string)
# 333 "lib/parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_ret_ in
        let _v =
          let ars = 
# 241 "<standard.mly>"
    ( xs )
# 343 "lib/parser.ml"
           in
          (
# 62 "lib/parser.mly"
                                                                                           ( Function({fname = name; params = ars; return = ret }) )
# 348 "lib/parser.ml"
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
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (Mini_ast.decl) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v : (Mini_ast.decl list) = 
# 58 "lib/parser.mly"
              ( [f] )
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
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = fs;
          MenhirLib.EngineTypes.startp = _startpos_fs_;
          MenhirLib.EngineTypes.endp = _endpos_fs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = f;
            MenhirLib.EngineTypes.startp = _startpos_f_;
            MenhirLib.EngineTypes.endp = _endpos_f_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let fs : (Mini_ast.decl list) = Obj.magic fs in
        let f : (Mini_ast.decl) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_fs_ in
        let _v : (Mini_ast.decl list) = 
# 59 "lib/parser.mly"
                         ( f :: fs )
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
# 5 "lib/parser.mly"
       (string)
# 441 "lib/parser.ml"
        ) = Obj.magic label in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_label_ in
        let _endpos = _endpos_t_ in
        let _v : (string * Mini_ast.ty) = 
# 55 "lib/parser.mly"
                                  ( (label, t) )
# 449 "lib/parser.ml"
         in
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
# 467 "lib/parser.ml"
         in
        {
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
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((string * Mini_ast.ty) list) = 
# 145 "<standard.mly>"
    ( [] )
# 510 "lib/parser.ml"
         in
        {
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
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Mini_ast.decl list) = 
# 33 "lib/parser.mly"
                    ( [] )
# 553 "lib/parser.ml"
         in
        {
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
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Mini_ast.decl list) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Mini_ast.decl list) = 
# 34 "lib/parser.mly"
                    ( v )
# 578 "lib/parser.ml"
         in
        {
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
            MenhirLib.EngineTypes.semv = f_defs;
            MenhirLib.EngineTypes.startp = _startpos_f_defs_;
            MenhirLib.EngineTypes.endp = _endpos_f_defs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = tdefs;
              MenhirLib.EngineTypes.startp = _startpos_tdefs_;
              MenhirLib.EngineTypes.endp = _endpos_tdefs_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let f_defs : (Mini_ast.decl list) = Obj.magic f_defs in
        let tdefs : (Mini_ast.decl list) = Obj.magic tdefs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_tdefs_ in
        let _endpos = _endpos__3_ in
        let _v : (Mini_ast.decl list) = 
# 30 "lib/parser.mly"
                                              ( tdefs @ f_defs )
# 617 "lib/parser.ml"
         in
        {
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
# 664 "lib/parser.ml"
           in
          (
# 44 "lib/parser.mly"
                                                                         ( TyInternalChoice(xs) )
# 669 "lib/parser.ml"
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
# 717 "lib/parser.ml"
           in
          (
# 45 "lib/parser.mly"
                                                                         ( TyExternalChoice(xs) )
# 722 "lib/parser.ml"
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
# 783 "lib/parser.ml"
         in
        {
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
# 5 "lib/parser.mly"
       (string)
# 897 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 48 "lib/parser.mly"
                                                                         ( TySendValue(v, cont) )
# 907 "lib/parser.ml"
         in
        {
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
# 5 "lib/parser.mly"
       (string)
# 961 "lib/parser.ml"
        ) = Obj.magic v in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Mini_ast.ty) = 
# 49 "lib/parser.mly"
                                                                         ( TyReceiveValue(v, cont) )
# 971 "lib/parser.ml"
         in
        {
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
# 996 "lib/parser.ml"
         in
        {
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
# 1042 "lib/parser.ml"
         in
        {
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
# 1088 "lib/parser.ml"
         in
        {
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
# 1152 "lib/parser.ml"
         in
        {
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
# 1177 "lib/parser.ml"
         in
        {
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
# 1216 "lib/parser.ml"
         in
        {
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
# 5 "lib/parser.mly"
       (string)
# 1257 "lib/parser.ml"
        ) = Obj.magic _name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_t_ in
        let _v : (Mini_ast.type_def) = 
# 41 "lib/parser.mly"
                                             ( {name = _name; body = t} )
# 1266 "lib/parser.ml"
         in
        {
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
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Mini_ast.type_def) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Mini_ast.decl list) = 
# 37 "lib/parser.mly"
                                  ( [TypeDef(v)] )
# 1291 "lib/parser.ml"
         in
        {
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
          MenhirLib.EngineTypes.semv = v2;
          MenhirLib.EngineTypes.startp = _startpos_v2_;
          MenhirLib.EngineTypes.endp = _endpos_v2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = v1;
            MenhirLib.EngineTypes.startp = _startpos_v1_;
            MenhirLib.EngineTypes.endp = _endpos_v1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let v2 : (Mini_ast.decl list) = Obj.magic v2 in
        let v1 : (Mini_ast.type_def) = Obj.magic v1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v1_ in
        let _endpos = _endpos_v2_ in
        let _v : (Mini_ast.decl list) = 
# 38 "lib/parser.mly"
                                  ( TypeDef(v1) :: v2 )
# 1323 "lib/parser.ml"
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
      "#";
    |], [|
      "Accepting";
      "Reducing production arg -> ID COLON arg_type";
      "Reducing production arg_type -> ID";
      "Reducing production arg_type -> s_type";
      "Reducing production func -> FUNC ID LPAR loption(separated_nonempty_list(COMMA,arg)) RPAR MINUS GT s_type";
      "Reducing production funcs -> func";
      "Reducing production funcs -> func funcs";
      "Reducing production labeled_type -> ID COLON s_type";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,arg)) -> separated_nonempty_list(COMMA,arg)";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) ->";
      "Reducing production loption(separated_nonempty_list(COMMA,labeled_type)) -> separated_nonempty_list(COMMA,labeled_type)";
      "Reducing production opt_type_defs ->";
      "Reducing production opt_type_defs -> type_defs";
      "Reducing production prog -> opt_type_defs funcs EOF";
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
      "Reducing production type_defs -> type_def";
      "Reducing production type_defs -> type_def type_defs";
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
      | T_MINUS : unit terminal
      | T_LT : unit terminal
      | T_LPAR : unit terminal
      | T_LINEARTOSHARED : unit terminal
      | T_INTERNALCHOICE : unit terminal
      | T_ID : (
# 5 "lib/parser.mly"
       (string)
# 1422 "lib/parser.ml"
    ) terminal
      | T_GT : unit terminal
      | T_FUNC : unit terminal
      | T_EXTERNALCHOICE : unit terminal
      | T_EQ : unit terminal
      | T_EOF : unit terminal
      | T_END : unit terminal
      | T_COMMA : unit terminal
      | T_COLON : unit terminal
    
    type _ nonterminal = 
      | N_type_defs : (Mini_ast.decl list) nonterminal
      | N_type_def : (Mini_ast.type_def) nonterminal
      | N_separated_nonempty_list_COMMA_labeled_type_ : ((string * Mini_ast.ty) list) nonterminal
      | N_separated_nonempty_list_COMMA_arg_ : ((string * Mini_ast.ty) list) nonterminal
      | N_s_type : (Mini_ast.ty) nonterminal
      | N_prog : (Mini_ast.decl list) nonterminal
      | N_opt_type_defs : (Mini_ast.decl list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_labeled_type__ : ((string * Mini_ast.ty) list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_arg__ : ((string * Mini_ast.ty) list) nonterminal
      | N_labeled_type : (string * Mini_ast.ty) nonterminal
      | N_funcs : (Mini_ast.decl list) nonterminal
      | N_func : (Mini_ast.decl) nonterminal
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
            X (T T_MINUS)
        | 9 ->
            X (T T_LT)
        | 10 ->
            X (T T_LPAR)
        | 11 ->
            X (T T_LINEARTOSHARED)
        | 12 ->
            X (T T_INTERNALCHOICE)
        | 13 ->
            X (T T_ID)
        | 14 ->
            X (T T_GT)
        | 15 ->
            X (T T_FUNC)
        | 16 ->
            X (T T_EXTERNALCHOICE)
        | 17 ->
            X (T T_EQ)
        | 18 ->
            X (T T_EOF)
        | 19 ->
            X (T T_END)
        | 20 ->
            X (T T_COMMA)
        | 21 ->
            X (T T_COLON)
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
            X (N N_func)
        | 11 ->
            X (N N_funcs)
        | 10 ->
            X (N N_labeled_type)
        | 9 ->
            X (N N_loption_separated_nonempty_list_COMMA_arg__)
        | 8 ->
            X (N N_loption_separated_nonempty_list_COMMA_labeled_type__)
        | 7 ->
            X (N N_opt_type_defs)
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
            X (N N_type_defs)
        | _ ->
            assert false
    
    and lr0_incoming =
      (8, "\000\004\028$\006\020\b\020\028*\n\020\014\020\028*\016\020\024\020\026\020\028,\"\020\007\017\030\021*\007(\011\017\030\011\030\011*\011\030\011\030\011*\011\030\011\030\011\030\011\003\005\003\r\015 \028\022\028,\028\011\027\t\019\012\018\030\011\029*\t\023&\025\023")
    
    and rhs =
      ((8, "\r\028,\027\028\011 \028\022\019\012\018\030\011\025\025\023\028,\011\t\007\003\015\023&\026\020\017\030\"\020\017\030\n\020\011*\011\030\016\020\011*\011\030\b\020\028*\011\030\014\020\028*\011\030(\006\020\011\030\024\020\011\030\029\029*\t\021\021*\007\004\028$\011\005\005\003"), (8, "\000\001\004\005\006\014\015\017\020\020\021\021\022\022\023\026\030\"(.4:;?CDGHKOPR"))
    
    and lr0_core =
      (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMN")
    
    and lr0_items =
      ((16, "\000\000p\001p\002p\003X\001X\002L\001L\002L\003L\004D\001D\002P\001P\002P\003P\004H\001H\002\\\001\\\002<\001<\002\028\001\028\002@\001@\002,\001@\003@\004l\001h\001l\002l\003T\001\028\003<\003<\004\\\003\\\004H\003H\004H\005H\006P\005P\006D\003D\004D\005D\006L\005L\006X\003X\004p\0044\001x\001t\001x\002\000\0018\001\016\001\016\002\016\003\004\001\004\002\b\001\012\001\004\003$\001\016\004\016\005\016\006\016\007\016\bd\001`\001d\002d\0038\0028\003\024\001\020\001\024\002"), (8, "\000\001\002\003\004\005\006\007\b\t\n\011\012\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\031 !\"#$%&'()*+,-./012345679:;<=>?@ABCDEFGHIJLMNOPRS"))
    
    and nullable =
      "\001\192"
    
    and first =
      (22, "@\001\001\000\000\004\000\000\000\001\000\000\004\000\236bD\000\016\016\000\000\000\004\000\000\016\000\000@\000\000@\000\001\000\236r@\000@\000")
    
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
