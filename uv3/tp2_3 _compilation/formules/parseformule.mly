%token AND OR EOF TRUE FALSE
%token <string> IDENT

%start formule
%type < string > formule

%%
formule:
 | c=conjonction EOF              { c }
conjonction:
 | d=disjonction AND c=conjonction { "("^d^" et "^c^")" }
 | d=disjonction                   { d }
disjonction:
 | id=ident_or_const OR d=disjonction      { "("^id^" ou "^d^")" }
 | id=ident_or_const                       { id }
ident_or_const:
 | id=IDENT                       { id }
 | TRUE                           { "true" }
 | FALSE                          { "false" }
%%

