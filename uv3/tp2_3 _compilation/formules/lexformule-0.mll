{
  type lexeme =
    | EOF
    | PLUS
    | MINUS
    | DIV
    | TIMES  
    | VARS of string
    | VARF of float
}
  
let space = [' ' '\t' '\n']


let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']

let varReg = letter (letter | digit | '_')*


rule nexttoken = parse
  | space+  { nexttoken lexbuf }
  | eof     { EOF }
  | "+"    { PLUS } 
  | "-"    { MINUS } 
  | "/"  { DIV } 
  | "*"  { TIMES }
  | varF as vf { FLOAT vf }
  | varS as vs { VARS vs }


{
  let compile file =
    print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    (* Travail sur le fichier *)
    close_in (input_file)
  with Sys_error s -> print_endline ("Can’t find file ’" ^ file ^ "’")
}
