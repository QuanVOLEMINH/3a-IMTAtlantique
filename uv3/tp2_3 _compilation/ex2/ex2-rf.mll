{
	type lexeme =
		| EOF
		| PLUS
		| SUB
		| MUL
		| DIV
		| EQUAL
		| VARF of float
		| VARS of string

	let print_lex = function 
    | EOF     -> print_string "EOF"
    | PLUS    -> print_string "+"
    | SUB   -> print_string "-"
    | TIMES   -> print_string "*"
    | DIV     -> print_string "/"
		| EQUAL -> print_string "="
    | VARF f -> print_string "float--"; print_float f; 
    | VARS s -> print_string "str--"; print_string s;
}

let space = [' ' '\t' '\n']

let letter = ['a'-'z' 'A'-'Z']

let digit = ['0'-'9']

let f = digit* ('.' digit *)?

let name_var = letter (letter | digit | '_')*

rule nexttoken = parse
	| space+ { nexttoken lexbuf }
	| eof { EOF }
	| "+" { PLUS }
	| "-" { SUB }
	| "*" { MUL }
	| "/" { DIV }
	| "=" { EQUAL }
	| name_var as nv { VARS nv}
	| f as vf { VARF (float_of_string vf) }

{
	let rec examine_all lexbuf =
    let res = nexttoken lexbuf in
    print_lex res;
    print_string " ";
    match res with
    | EOF -> ()
    | _   -> examine_all lexbuf

	let compile file =
	print_string ("File "^file^" is being treated!\n");
	try
		let input_file = open_in file in
		let lexbuf = Lexing.from_channel input_file in
		examine_all lexbuf;
		print_newline ();
		close_in (input_file)
	with Sys_error s ->
			print_endline ("Can't find file '" ^ file ^ "'")

}
