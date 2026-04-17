open FerriteSynth
open Mini_ast

let () =
  Printexc.record_backtrace true;

  if Array.length Sys.argv < 2 then failwith "Usage: main <file>";

  let filename = Sys.argv.(1) in
  let channel = open_in filename in
  let lexbuf = Lexing.from_channel channel in
  let prog = Parser.prog Lexer.read lexbuf in
  print_endline "Parsed successfully!";
  let merge_raw prog =
    let rec aux acc = function
      | Raw a :: Raw b :: xs -> aux acc (Raw (a ^ b) :: xs)
      | x :: xs -> aux (x :: acc) xs
      | [] -> List.rev acc
    in
    aux [] prog
  in
  let prog = merge_raw prog in
  let type_ctxt = ref [] in
  let rec lookup_type name ctxt =
    match ctxt with
    | [] -> None
    | (n, t) :: xs -> if n = name then Some t else lookup_type name xs
  in
  let rec print_prog p =
    match p with
    | [] -> print_endline "end."
    | decl :: xs ->
        (match decl with
        | Raw t -> Printf.printf "%s" t
        | TypeDef v ->
            Printf.printf "type %s = %s;" v.name (Synthesizer.print_type v.body);
            type_ctxt := (v.name, v.body) :: !type_ctxt
        | Function f ->
            let args_str =
              f.params
              |> List.map (fun (n, t) -> n ^ ": " ^ Synthesizer.print_type t)
              |> String.concat ", "
            in

            let ret_str = Synthesizer.print_type f.return in

            let synth_ctxt =
              f.params
              |> List.map (fun (name, t) ->
                     match t with
                     | TyPrimitive s -> (
                         match lookup_type s !type_ctxt with
                         | Some real_t ->
                             print_endline "found";
                             (name, real_t)
                         | None -> (name, t))
                     | _ -> (name, t))
            in

            let body =
              match Synthesizer.synthesize f.return synth_ctxt with
              | [] -> "todo!()"
              | (_, e) :: _ -> Synthesizer.print_exp e
            in

            Printf.printf "fn %s(%s) -> %s { %s }\n" f.fname args_str ret_str
              body);
        print_prog xs
  in
  print_prog prog
