open FerriteSynth
open Mini_ast

let () =
  Printexc.record_backtrace false;
  if Array.length Sys.argv < 2 then failwith "Usage: main <file>";

  let filename = Sys.argv.(1) in
  let channel = open_in filename in
  let out_filename = filename ^ ".out" in
  let out_channel = open_out out_filename in
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
    | [] -> ()
    | decl :: xs ->
        (match decl with
        | Raw t -> Printf.fprintf out_channel "%s" t
        | TypeDef v ->
            Printf.fprintf out_channel "type %s = %s;" v.name
              (Synthesizer.print_type v.body);
            type_ctxt := (v.name, v.body) :: !type_ctxt
        | Function f ->
            let args_str =
              f.params
              |> List.map (fun (n, t) -> n ^ ": " ^ Synthesizer.print_type t)
              |> String.concat ", "
            in

            let ret_str = Synthesizer.print_type f.return in

            let resolve_type t =
              match t with
              | TyPrimitive s -> (
                  match lookup_type s !type_ctxt with
                  | Some real_t -> real_t
                  | None -> t)
              | _ -> t
            in

            let synth_ctxt =
              f.params |> List.map (fun (name, t) -> (name, resolve_type t))
            in

            let resolved_return = resolve_type f.return in

            let body =
              match Synthesizer.synthesize resolved_return synth_ctxt with
              | [] -> "panic!(\"couldn't synthesize!\")"
              | sols -> (
                  let exprs =
                    sols |> List.map (fun (_, e) -> Synthesizer.print_exp e)
                  in
                  match exprs with
                  | [] -> "panic!(\"no solutions\")"
                  | first :: rest ->
                      let others =
                        rest
                        |> List.map (fun e -> "// OR\n// " ^ e ^ "\n")
                        |> String.concat "\n"
                      in
                      if others = "" then first else first ^ "\n" ^ others)
            in

            Printf.fprintf out_channel "fn %s(%s) -> %s { %s }\n" f.fname
              args_str ret_str body);
        print_prog xs
  in
  print_prog prog;
  close_out out_channel;
  let _ = Sys.command ("rustfmt " ^ out_filename) in
  ()
