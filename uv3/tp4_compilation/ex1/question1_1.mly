%{
  open Expr
%}
%token EOF PLUS TIMES
%token <string> IDENT
%start expression
%type <Expr.expression> expression
%%
expression:
  | e EOF  { $1 }
e:
  | e PLUS t  { Plus ($1, $3) }
  | t  { $1 }
t:
  | t TIMES f  { Times ($1, $3) }
  | f  { $1 }
f:
  | IDENT { Var $1 }
%%
