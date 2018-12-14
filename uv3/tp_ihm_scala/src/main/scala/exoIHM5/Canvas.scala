package exoIHM5

import java.awt.Graphics2D
  
class Canvas(l : mvc.ListModel[mvc.Drawable], val clm : CurrentLineModel) 
  extends mvc.Canvas(l) {
  override def paintComponent(g: Graphics2D) {
    super.paintComponent(g)
    clm.draw(g)
  }
}