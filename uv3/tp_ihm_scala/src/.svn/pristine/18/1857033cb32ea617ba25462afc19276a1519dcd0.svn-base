/**
 *
 */
/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
import geom.Point

object Main {

  def main(args: Array[String]): Unit = {
    val a = new Point("A", 1, 1)
    a.move(1, -1); println(a) // prints: A is on (2, 0)
    a.x = 8; println(a) // prints: A is on (8, 0)
    val b = new Point("B", 0, 0)
    println(a.distance(b)) // prints: 8.0
    // A.xc, error is not a member
    // A.y, error cannot be accessed
    // A.name, error cannot be accessed
    // B.move(1), error not enough arguments
    val fn = b.move(1, _: Int)
    println(fn) // prints: <function1>
    fn(3)
    println(b) // prints: B is on (1, 3)
  }
}