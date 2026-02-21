%{
  open Mini_ast
%}

%token <string> ID
%token TYPE_KEYWORD
%token LT
%token GT
%token EQ
%token COMMA
%token COLON
%token EOF
%token INTERNALCHOICE
%token EXTERNALCHOICE
%token SENDCHANNEL
%token RECEIVECHANNEL
%token SENDVALUE
%token RECEIVEVALUE
%token SHAREDTOLINEAR
%token LINEARTOSHARED
%token END
%start <decl list option> prog
%%

prog: 
  | tdefs = opt_type_defs; EOF { tdefs }

opt_type_defs: 
  |                 { None }
  | v = type_defs   { Some v }

type_defs:
  | v = type_def                  { [TypeDef(v)] }
  | v1 = type_def; v2 = type_defs { TypeDef(v1) :: v2 }

type_def:
  | TYPE_KEYWORD; _name = ID; EQ; t = s_type { {name = _name; body = t} }

labeled_type:
  | label = ID; COLON; t = s_type { (label, t) }

s_type:
  | INTERNALCHOICE; LT; xs = separated_list(COMMA, labeled_type); GT     { TyInternalChoice(xs) }
  | EXTERNALCHOICE; LT; xs = separated_list(COMMA, labeled_type); GT     { TyExternalChoice(xs) }
  | SENDCHANNEL; LT; t = s_type; COMMA; cont = s_type; GT                { TySendChannel(t, cont) }
  | RECEIVECHANNEL; LT; t = s_type; COMMA; cont = s_type; GT             { TyReceiveChannel(t, cont) }
  | SENDVALUE; LT; v = ID; COMMA; cont = s_type; GT                      { TySendValue(Value(v), cont) }
  | RECEIVEVALUE; LT; v  = ID; COMMA; cont = s_type; GT                  { TyReceiveValue(Value(v), cont) }
  | END                                                                  { TyEnd }
  | SHAREDTOLINEAR; LT; t = s_type; GT                                   { TySharedToLinear(t) }
  | LINEARTOSHARED; LT; t = s_type; GT                                   { TyLinearToShared(t) }

