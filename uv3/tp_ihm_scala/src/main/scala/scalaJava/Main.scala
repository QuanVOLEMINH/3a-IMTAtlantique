/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
package scalaJava

import java.lang.reflect.Method

object Main {
  def main(args: Array[String]): Unit = {
    val a: A = new A()
    println(a) // prints: A
    val methods: Array[Method] = a.getClass().getDeclaredMethods()
    for (i <- 0 to methods.length - 1)
      println(methods(i))
    // prints: public java.lang.String scalaJava.A.toString()
    //         public void scalaJava.A.giveMeAnInt(int)
    a.giveMeAnInt(5) // prints: You gave me 5
    val b = new B("toto")
    val b1 = B("tata")
    b.giveMeAnInt(8) // prints: You gave me 8
    println(b) // prints: A : B(toto)
  }
}