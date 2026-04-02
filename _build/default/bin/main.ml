open FerriteSynth

let () =
  Printexc.record_backtrace true;

  if Array.length Sys.argv < 2 then failwith "Usage: main <file>";

  let filename = Sys.argv.(1) in
  let channel = open_in filename in
  let lexbuf = Lexing.from_channel channel in
  let prog = Parser.prog Lexer.read lexbuf in
  print_endline "Parsed successfully!";
  match prog with
  | [] -> print_endline "empty"
  | h :: _ -> (
      match h with
      | TypeDef v ->
          print_endline (Synthesizer.print_type v.body);
          let programs = Synthesizer.synthesize v.body in
          List.iter
            (fun (delta_out, e) ->
              Printf.printf "c:%s program: %s\n"
                (Synthesizer.print_ctxt delta_out)
                (Synthesizer.print_exp e))
            programs
      | Function _ -> print_endline "")
