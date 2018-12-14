/**
 *
 */
/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 *
 */
package geom

class ColoredPoint3D(override protected val name: String,
  xc: Int, yc: Int, zc: Int)
  extends Point3D(name, xc, yc, zc) with Colored