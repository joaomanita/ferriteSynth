type program = decl list

and decl =
  | TypeDef of type_def
  | Function of ty
  | Raw of string
  | ClosedFunction of ty * string

and type_def = { name : string; body : ty }
and label = string
and value = string

and ty =
  | TyPrimitive of value
  | TyAtomic of string
  | TyInternalChoice of (label * ty) list
  | TyExternalChoice of (label * ty) list
  | TySendChannel of (ty * ty)
  | TyReceiveChannel of (ty * ty)
  | TySendValue of (value * ty)
  | TyReceiveValue of (value * ty)
  | TyEnd
  | TySharedToLinear of ty
  | TyLinearToShared of ty
  | TyRelease
  | TyAcquire
  | TySession of ty
  | TyFunc of (string * (label * ty) list) * ty
  | TyApp of (string * ty list)
  | TyRec of ty
  | TyZ of int
