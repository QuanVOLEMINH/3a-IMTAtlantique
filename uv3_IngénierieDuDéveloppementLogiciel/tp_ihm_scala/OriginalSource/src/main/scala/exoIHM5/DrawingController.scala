package exoIHM5

import scala.swing._
import exoIHM3.{NOTRACE,TRACE,PRESS,RELEASE}
import exoIHM1.{QUIT,START,STOP,INIT,DESSIN}
import mvc.{ListModel,Drawable,Line}
import java.awt.Point

case class DRAG(point : Point) extends exoIHM3.DrawEvent("Drag")

class DrawingController(model : ListModel[Drawable], val clm : CurrentLineModel) 
  extends exoIHM3.DrawingController(model) {
  // Les actions
  // Traçage de la ligne entre le point memorise et le point reçu
  override protected def actionDraw(point : Point) = {
    super.actionDraw(point)
    clm.clear
  }
  
  protected def actionSetCurrentLine(point : Point) {
  	clm.set(this.p,point);
  }

  // Les evenements
  override def event(evt: mvc.AppEvent):Unit = {
    super.event(evt)
    evt match {
      case DRAG(p) if (state == TRACE) => {
        actionSetCurrentLine(p)
      }
      case _ => ()
    }
  }
}
