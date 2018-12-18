
(* The type of tokens. *)

type token = 
  | TRUE
  | OR
  | IDENT of (string)
  | FALSE
  | EOF
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val formule: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ( string )
