type expression =
  | Var of string
  | Plus of expression * expression
  | Times of expression * expression

exception Unbound_variable of string

let rec eval env exp =
  match exp with
  | Var v -> (try List.assoc v env with Not_found -> raise(Unbound_variable v))
  | Plus(e1,e2) -> (eval env e1) + (eval env e2)
  | Times(e1,e2) -> (eval env e1) * (eval env e2)

let rec string_of_expr exp =
  match exp with
  | Var v -> v
  | Plus(e1, e2) -> 
      "(" ^(string_of_expr e1)^ " + " ^(string_of_expr e2)^ ")"
  | Times(e1, e2) -> 
      "(" ^(string_of_expr e1)^ " * " ^(string_of_expr e2)^ ")"


