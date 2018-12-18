package mvc

import swing._
import java.awt.{Graphics2D,Color}

class Canvas(val model : ListModel[Drawable]) extends Panel with View {
  preferredSize = new java.awt.Dimension(200,200)

  override def paintComponent(g: Graphics2D) {
    super.paintComponent(g)

    g.setColor(Color.WHITE)
    g.fillRect(0,0,size.width, size.height)

    g.setColor(Color.BLACK)
    model.foreach {v => v.draw(g)} 
  }
  
  override def synchro = repaint()
}