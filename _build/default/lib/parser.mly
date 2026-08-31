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
%token LSQUARE
%token RSQUARE
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
%token AT
%token RELEASE
%token ACQUIRE
%token SYNTHESIZE
%token USE
%token SUGGEST
%token REC_FUNC
%token DEFINE_CHOICE
%token EITHER
%token EXCLAMATION
%start <decl list> prog
%%

prog: 
  | d = list(decl); EOF { d }

decl:
  | text = RAW { Raw(text) }
  | tdef = type_def { tdef }
  | cdef = define_choice { ChoiceDef(cdef) }
  | f = func { f }
  | f = unit_ret_func { f }
  | closed_f = closed_func { closed_f }
  | f = scheme_func { f }

type_def:
  | TYPE_KEYWORD; _name = ID; EQ; t = s_type; SEMICOLON { TypeDef({name = _name; body = t}) }

s_type:
  | id = ID                                                              { TyPrimitive(id) }
  | uppercaseid = ATOMIC                                                 { TyAtomic(uppercaseid) }
  | INTERNALCHOICE; LT; c = choice; GT                                   { TyInternalChoice(c) }
  | EXTERNALCHOICE; LT; c = choice; GT                                   { TyExternalChoice(c) }
  | INTERNALCHOICE; LT; id = ID; GT                                      { TyInternalChoiceId(id) }
  | EXTERNALCHOICE; LT; id = ID; GT                                      { TyExternalChoiceId(id) }
  | SENDCHANNEL; LT; t = s_type; COMMA; cont = s_type; GT                { TySendChannel(t, cont) }
  | RECEIVECHANNEL; LT; t = s_type; COMMA; cont = s_type; GT             { TyReceiveChannel(t, cont) }
  | SENDVALUE; LT; id = ID; COMMA; cont = s_type; GT                     { TySendValue(TyPrimitive id, cont) }
  | SENDVALUE; LT; a = ATOMIC; COMMA; cont = s_type; GT                  { TySendValue(TyAtomic a, cont) }
  | RECEIVEVALUE; LT; id  = ID; COMMA; cont = s_type; GT                 { TyReceiveValue(TyPrimitive id, cont) }
  | RECEIVEVALUE; LT; a = ATOMIC; COMMA; cont = s_type; GT               { TyReceiveValue(TyAtomic a, cont) }
  | END                                                                  { TyEnd }
  | SHAREDTOLINEAR; LT; t = s_type; GT                                   { TySharedToLinear(t, 0) }
  | LINEARTOSHARED; LT; t = s_type; GT                                   { TyLinearToShared(t, 0) }
  | SESSION; LT; t = s_type; GT                                          { TySession(t) }
  | REC; LT; t = s_type; GT                                              { TyRec(t) }
  | t = z_type                                                           { TyZ (t) }
  | RELEASE                                                              { TyFixShared }
  | ACQUIRE                                                              { TyFixShared }

choice:
  | EITHER LT t1 = s_type COMMA t2 = s_type GT
      { (TyEither (t1, t2)) }

choice_branch:
  | lbl = ID COLON ty = s_type
    {
      (lbl, ty)
    }

define_choice:
  | DEFINE_CHOICE EXCLAMATION LBRACE
    name = ID SEMICOLON
    branches = separated_nonempty_list(COMMA, choice_branch)
    RBRACE
    {
      (TyDefineChoice (name, branches))
    }

func:
  | FUNC; name = ID;
    LPAR; ars = separated_list(COMMA, arg); RPAR;
    MINUS; GT; ret = s_type;
    LBRACE;
    AT; SYNTHESIZE;
    recursive = boption(REC_FUNC);
    LSQUARE;
    required_funcs = require_funcs;
    suggested_funcs = suggest_funcs;
    RSQUARE;
    RBRACE
    {
      Function (TyFunc (((name, ars), ret)), recursive, (required_funcs, suggested_funcs))
    }

unit_ret_func:
  | FUNC; name = ID;
    LPAR; ars = separated_list(COMMA, arg); RPAR;
    LBRACE;
    AT; SYNTHESIZE;
    recursive = boption(REC_FUNC);
    LSQUARE;
    required_funcs = require_funcs;
    suggested_funcs = suggest_funcs;
    RSQUARE;
    RBRACE
    {
      Function (TyUnitRetFunc (name, ars), recursive, (required_funcs, suggested_funcs))
    }

require_funcs:
  |                             { [] }
  | USE; ids = separated_nonempty_list(COMMA, ID); SEMICOLON
                                { ids }

suggest_funcs:
  |                             { [] }
  | SUGGEST; ids = separated_nonempty_list(COMMA, ID); SEMICOLON
                                { ids }

closed_func:
  | FUNC; name = ID; LPAR; ars = separated_list(COMMA, arg); RPAR; MINUS; GT; ret = s_type LBRACE; body = list(RAW); RBRACE { ClosedFunction((TyFunc((name, ars), ret), String.concat "" body)) }
  | FUNC; name = ID;
    LT; tList = scheme_args; GT;
    LPAR; ars = separated_list(COMMA, arg); RPAR;
    MINUS; GT; ret = s_type;
    LBRACE;
    body = list(RAW);
    RBRACE
    {
      ClosedFunction
        ((TySchemeFunc
           (tList,
            ((name, ars), ret))), String.concat "" body)
    }

scheme_args:
  | ts = separated_nonempty_list(COMMA, ATOMIC)
      { List.map (fun t -> TyAtomic t) ts }

scheme_func:
  | FUNC; name = ID;
    LT; tList = scheme_args; GT;
    LPAR; ars = separated_list(COMMA, arg); RPAR;
    MINUS; GT; ret = s_type;
    LBRACE;
    AT; SYNTHESIZE;
    recursive = boption(REC_FUNC);
    LSQUARE;
    required_funcs = require_funcs;
    suggested_funcs = suggest_funcs;
    RSQUARE;
    RBRACE
    {
      Function
        (TySchemeFunc
           (tList,
            ((name, ars), ret)), recursive, (required_funcs, suggested_funcs))
    }

arg:
  | arg_name = ID; COLON; t = arg_type { (arg_name, t) }

arg_type:
  | t = s_type  { t }

z_type:
  | Z { 0}
  | S; LT; t = z_type; GT { t + 1 }

