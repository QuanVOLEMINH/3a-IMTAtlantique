package exoIHM5

import java.awt.{Graphics2D,Point}
import mvc._

class CurrentLineModel(var currentLine : Line) extends Model with Drawable {
  override def toString = currentLine.toString
  
  def draw(g : Graphics2D) {
    if (currentLine != null)
      currentLine.draw(g)
  }
  
  def set(p1:Point, p2 : Point) {
    currentLine = new Line(p1, p2)
    notifyViews
  }
  
  def clear = {
    currentLine = null
    notifyViews
  }
}