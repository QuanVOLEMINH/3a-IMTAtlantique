%{
open Expr
%}
%token EOF PLUS TIMES
%token <string> IDENT
%start expression
%type < Expr.expression > expression
%%
expression:
| e EOF
{ $1 }
e:
| e PLUS e  { Plus($1,$3)}
| e TIMES e  { Times($1,$3)}
| IDENT    { Var $1 }
%%
