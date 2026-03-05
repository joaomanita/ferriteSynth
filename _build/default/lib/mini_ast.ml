type program = decl list
and decl = TypeDef of type_def | Function of func_def
and type_def = { name : string; body : ty }
and func_def = { fname : string; params : (string * ty) list; return : ty }
and label = string
and value = string

and ty =
  | TyPrimitive of value
  | TyInternalChoice of (label * ty) list
  | TyExternalChoice of (label * ty) list
  | TySendChannel of (ty * ty)
  | TyReceiveChannel of (ty * ty)
  | TySendValue of (value * ty)
  | TyReceiveValue of (value * ty)
  | TyEnd
  | TySharedToLinear of ty
  | TyLinearToShared of ty
