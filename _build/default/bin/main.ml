open FerriteSynth

let () =
  Printexc.record_backtrace true;

  if Array.length Sys.argv < 2 then
    failwith "Usage: main <file>";

  let filename = Sys.argv.(1) in
  let channel = open_in filename in
  let lexbuf = Lexing.from_channel channel in
  let _ = Parser.prog Lexer.read lexbuf in
  print_endline "Parsed successfully!"
