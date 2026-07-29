open Mini_ast
open Utils

let compare_type t1 t2 = String.compare (print_type t1) (print_type t2)

module GoalKey = struct
  type t = ty * ((string * ty) * int) list * (string * ty) list

  let canonical_gamma gamma =
    List.sort (fun ((_, ty1), _) ((_, ty2), _) -> compare_type ty1 ty2) gamma

  let canonical_delta delta =
    List.sort (fun (_, ty1) (_, ty2) -> compare_type ty1 ty2) delta

  let equal (goal1, gamma1, delta1) (goal2, gamma2, delta2) =
    equal_type goal1 goal2
    &&
    let g1 = canonical_gamma gamma1 and g2 = canonical_gamma gamma2 in
    let d1 = canonical_delta delta1 and d2 = canonical_delta delta2 in

    List.length g1 = List.length g2
    && List.length d1 = List.length d2
    && List.for_all2
         (fun ((_, ty1), _) ((_, ty2), _) -> equal_type ty1 ty2)
         g1 g2
    && List.for_all2 (fun (_, ty1) (_, ty2) -> equal_type ty1 ty2) d1 d2

  let hash (goal, gamma, delta) =
    Hashtbl.hash
      ( print_type goal,
        List.map (fun ((_, ty), _) -> print_type ty) (canonical_gamma gamma),
        List.map (fun (_, ty) -> print_type ty) (canonical_delta delta) )
end

module Table = Hashtbl.Make (GoalKey)

let cache : bool Table.t = Table.create 1007
