%{
  open Mini_ast
%}

%token <string> RAW
%token <string> ID
%token <string> ATOMIC
%token TYPE_KEYWORD
%token SESSION
%token LT
%token GT
%token LPAR
%token RPAR
%token LBRACE
%token RBRACE
%token EQ
%token COMMA
%token COLON
%token SEMICOLON
%token MINUS
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
%token FUNC
%token REC
%token Z
%token S
%start <decl list> prog
%%

prog: 
  | d = list(decl); EOF { d }

decl:
  | text = RAW { Raw(text) }
  | tdef = type_def { tdef }
  | f = func { f }

type_def:
  | TYPE_KEYWORD; _name = ID; EQ; t = s_type; SEMICOLON { TypeDef({name = _name; body = t}) }

s_type:
  | id = ID                                                              { TyPrimitive(id) }
  | uppercaseid = ATOMIC                                                 { TyAtomic(uppercaseid) }
  | INTERNALCHOICE; LT; xs = separated_list(COMMA, labeled_type); GT     { TyInternalChoice(xs) }
  | EXTERNALCHOICE; LT; xs = separated_list(COMMA, labeled_type); GT     { TyExternalChoice(xs) }
  | SENDCHANNEL; LT; t = s_type; COMMA; cont = s_type; GT                { TySendChannel(t, cont) }
  | RECEIVECHANNEL; LT; t = s_type; COMMA; cont = s_type; GT             { TyReceiveChannel(t, cont) }
  | SENDVALUE; LT; v = ID; COMMA; cont = s_type; GT                      { TySendValue(v, cont) }
  | RECEIVEVALUE; LT; v  = ID; COMMA; cont = s_type; GT                  { TyReceiveValue(v, cont) }
  | END                                                                  { TyEnd }
  | SHAREDTOLINEAR; LT; t = s_type; GT                                   { TySharedToLinear(t) }
  | LINEARTOSHARED; LT; t = s_type; GT                                   { TyLinearToShared(t) }
  | SESSION; LT; t = s_type; GT                                          { TySession(t) }
  | REC; LT; t = s_type; GT                                              { TyRec(t) }
  | t = z_type                                                           { TyZ (t) }

labeled_type:
  | label = ID; COLON; t = s_type { (label, t) }

func:
  | FUNC; name = ID; LPAR; ars = separated_list(COMMA, arg); RPAR; MINUS; GT; ret = s_type LBRACE RBRACE { Function({fname = name; params = ars; return = ret }) }

arg:
  | arg_name = ID; COLON; t = arg_type { (arg_name, t) }

arg_type:
  | t = s_type  { t }

z_type:
  | Z { 0}
  | S; LT; t = z_type; GT { t + 1 }

