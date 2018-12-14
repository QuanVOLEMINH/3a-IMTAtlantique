/**
 *
 */
/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
import geom._

object Main2 {

  def main(args: Array[String]): Unit = {
    val a3d = new Point3D("A", 1, 1, 1)
    a3d.move(1, -1); println(a3d) // prints: A is on (2, 0), z = 1
    var b: Point = new ColoredPoint3D("B", 0, 0, 0)
    println(b) // prints: B is on (0, 0), z = 0, col = Black
    println(a3d.distance(b)) // prints: 2.0
    b = new Point("newB", 7, 7) with Colored
    b.asInstanceOf[Colored].setColor("yellow")
    println(b) // prints: newB is on (7, 7), col = yellow
  }
}