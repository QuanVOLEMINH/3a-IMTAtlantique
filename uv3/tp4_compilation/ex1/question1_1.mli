
(* The type of tokens. *)

type token = 
  | TIMES
  | PLUS
  | IDENT of (string)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val expression: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Expr.expression)
