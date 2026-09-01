open FerriteSynth
open Mini_ast
open Synthesizer
open Utils

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
  let rec print_prog p =
    match p with
    | [] -> ()
    | decl :: xs ->
        (match decl with
        | Raw t -> Printf.fprintf out_channel "%s" t
        | ChoiceDef c -> (
            match c with
            | TyEither _ ->
                Printf.fprintf out_channel
                  "// shouldnt be an Either in a ChoiceDef\n"
            | TyDefineChoice (name, branches) ->
                Synthesizer.append_define_choice c;
                Printf.fprintf out_channel "define_choice! {\n";
                Printf.fprintf out_channel "    %s;\n" name;

                List.iteri
                  (fun i (lbl, ty) ->
                    Printf.fprintf out_channel "    %s: %s" lbl (print_type ty);
                    if i < List.length branches - 1 then
                      Printf.fprintf out_channel ",";
                    Printf.fprintf out_channel "\n")
                  branches;
                Printf.fprintf out_channel "}\n")
        | TypeDef v ->
            Printf.fprintf out_channel "type %s = %s;" v.name
              (print_type v.body);
            Synthesizer.append_type_ctxt v.name v.body
        | Function (fType, argcounts, recursive, (required_funcs, usable_funcs))
          -> (
            let results =
              Synthesizer.synthesize fType argcounts recursive required_funcs
                usable_funcs
            in
            let tms = List.map snd results in

            match tms with
            | [] ->
                Printf.fprintf out_channel "// couldnt synthesize function\n"
            | tm :: rest ->
                (* print first term normally *)
                Printf.fprintf out_channel "%s\n" (print_exp tm);

                (* print rest as commented terms *)
                List.iter
                  (fun tm ->
                    Printf.fprintf out_channel "// %s\n" (print_exp tm))
                  rest)
        | ClosedFunction (fType, body) ->
            Printf.fprintf out_channel "%s\n"
              (print_exp (Synthesizer.process_closed_function (fType, body))));

        print_prog xs
  in
  print_prog prog;
  close_out out_channel;
  let _ = Sys.command ("rustfmt --edition 2021 " ^ out_filename) in
  ()
