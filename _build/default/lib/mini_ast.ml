type program = decl list

and decl =
  | TypeDef of type_def
  | Function of ty
  | Raw of string
  | ClosedFunction of ty * string
  | ChoiceDef of choice

and type_def = { name : string; body : ty }
and label = string
and value = string

and ty =
  | TyPrimitive of value
  | TyAtomic of string
  | TyInternalChoice of choice
  | TyExternalChoice of choice
  | TyInternalChoiceId of string
  | TyExternalChoiceId of string
  | TySendChannel of (ty * ty)
  | TyReceiveChannel of (ty * ty)
  | TySendValue of (ty * ty)
  | TyReceiveValue of (ty * ty)
  | TyEnd
  | TySharedToLinear of ty
  | TyLinearToShared of ty
  | TyFixShared
  | TySession of ty
  | TyFunc of func_ty * string list
  | TyUnitRetFunc of (string * (label * ty) list) * string list
  | TyApp of (string * ty list)
  | TyRec of ty
  | TyZ of int
  | TyScheme of ty list * ty
  | TySchemeFunc of ty list * (func_ty * string list)
  | TyExistential of string

and choice =
  | TyDefineChoice of (label * (label * ty) list)
  | TyEither of (ty * ty)

and func_ty = (string * (label * ty) list) * ty
and subst = ty * ty
