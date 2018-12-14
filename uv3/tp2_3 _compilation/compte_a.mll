{ }

let not_a = [^'a']*

rule count value = parse
  | not_a  { count value lexbuf }
  | 'a'    { count (value + 1) lexbuf }
  | eof    { value }

{
  let compte_a s =
    let buffer = Lexing.from_string s in
      count 0 buffer
}

