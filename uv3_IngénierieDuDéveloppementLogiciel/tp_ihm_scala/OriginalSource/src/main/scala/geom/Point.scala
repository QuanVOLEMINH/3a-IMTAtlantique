/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
package geom
import Math.pow

class Point(protected val name: String, xc: Int, yc: Int) {
  var x: Int = xc
  private var y = yc
  def move(dx: Int, dy: Int) = {
    x = x + dx
    y = y + dy
  }
  def distance(p: Point) : Double = {
    import Math.sqrt
    sqrt(pow(x - p.x, 2) + pow(y - p.y, 2))
  }
  override def toString = name + " is on (" + x + ", " + y + ")"
}
