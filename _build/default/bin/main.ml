open FerriteSynth

let () =
  Printexc.record_backtrace true;

  if Array.length Sys.argv < 2 then failwith "Usage: main <file>";

  let filename = Sys.argv.(1) in
  let channel = open_in filename in
  let lexbuf = Lexing.from_channel channel in
  let prog = Parser.prog Lexer.read lexbuf in
  print_endline "Parsed successfully!";
  let fst_type =
    match prog with
    | [] -> ""
    | h :: _ -> (
        match h with
        | TypeDef v -> Synthesizer.print_type v.body
        | Function _ -> "")
  in
  print_endline fst_type
