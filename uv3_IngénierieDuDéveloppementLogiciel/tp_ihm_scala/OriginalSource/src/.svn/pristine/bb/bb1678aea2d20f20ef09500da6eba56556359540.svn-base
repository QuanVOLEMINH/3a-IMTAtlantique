class A

class B extends A

class C extends B

class Test1 {
  def m(b:B) = 1
  def n() = new B
}

class Test2 extends Test1 {
  //override def m(b:A) = 1
  override def n() = new C
}

trait Toto {
  val a = "a"
}

class Truc extends Toto {
  val b = "b"
}

object TT {
def f() = 1
}
