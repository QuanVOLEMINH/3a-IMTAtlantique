sealed abstract class Term
case class Var(name: String) extends Term
case class Fun(arg: String, body: Term) extends Term
case class App(f: Term, v: Term) extends Term

object TestTerm {
  def print(term: Term): Unit =
    term match {
      case Var(n) => System.out.print(n)
      case Fun(x, b) => System.out.print("λ" + x + "."); print(b)
      case App(f, v) =>
        System.out.print("("); print(f)
        System.out.print(" "); print(v)
        System.out.print(")")
    }

  def isIdentityFun(term: Term): Boolean =
    term match {
      case Fun(x, Var(y)) => x == y
      case _ => false
    }

  def subst(term: Term, v: String, newTerm: Term): Term =
    term match {
      case Var(n) if n == v => newTerm
      case Var(_) => term
      case Fun(x, _) if x == v => term
      case Fun(x, b) => Fun(x, subst(b, v, newTerm))
      case App(t1, t2) =>
        App(subst(t1, v, newTerm), subst(t2, v, newTerm))
    }

  def reduce(term: Term): Term =
    term match {
      case App(Fun(x, b), t2) => subst(b, x, t2)
      case _ => term
    }

  def main(args: Array[String]): Unit = {
    val id = Fun("x", Var("x"))
    val t = Fun("x", Fun("y", App(Var("x"), Var("y"))))
    print(t); println()
    println(isIdentityFun(id))
    println(isIdentityFun(t))
    print(subst(id, "x", id)); println()
    val term = Fun("x", App(Var("x"), Var("y")))
    print(subst(term, "y", id)); println()
    val tr1 = reduce(App(t, id))
    print(tr1); println()
    val tr2 = reduce(App(tr1, Var("f")))
    print(tr2); println()
    val tr3 = reduce(tr2)
    print(tr3); println()
  }
}
