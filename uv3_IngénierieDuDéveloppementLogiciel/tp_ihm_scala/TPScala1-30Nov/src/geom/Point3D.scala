/**
 *
 */
/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
package geom

class Point3D(override protected val name: String, xc: Int, yc: Int, zc: Int)
  extends Point(name, xc, yc) {
  private val z = zc
  override def toString() = super.toString + ", z = " + z
}