package mvc

import java.awt.Point
import java.awt.Graphics2D

class Line(var start : Point, var end : Point) extends Drawable {
  override def draw(g : Graphics2D) = 
    g.drawLine(start.getX.asInstanceOf[Int],start.getY.asInstanceOf[Int],
        end.getX.asInstanceOf[Int],end.getY.asInstanceOf[Int])
  override def toString = start + " , " + end
}