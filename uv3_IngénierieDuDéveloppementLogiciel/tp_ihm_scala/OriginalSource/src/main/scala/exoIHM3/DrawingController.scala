package exoIHM3

import scala.swing._
import exoIHM2._
import exoIHM1.{QUIT,START,STOP,INIT,DESSIN}
import mvc._
import java.awt.Point


abstract class DrawEvent(name: String) extends mvc.AppEvent(name)
case class PRESS(point : Point) extends DrawEvent("Press")
case class RELEASE(point : Point) extends DrawEvent("Release")

class DrawingController(val model : ListModel[Drawable]) 
  extends mvc.Controller(NOTRACE) {
  protected var p = new Point(0,0)
  // Les actions
  // Memorisation des coordonnees ou le bouton est enfonce
  protected def actionSetPoint(point : Point) = p = point
  // Traçage de la ligne entre le point memorise et le point reçu
  protected def actionDraw(point : Point) = model.add(new Line(p,point))
  
  // Les evenements
  override def event(evt: mvc.AppEvent):Unit = {
    evt match {
      // Debut du trace
      case PRESS(p) if (state == NOTRACE) => {
        state = TRACE
        actionSetPoint(p)
      }
      case RELEASE(p) if (state == TRACE) => {
        state = NOTRACE
        actionDraw(p)
      }
      case _ => ()
    }
    println("Nous sommes dans l'etat " + state);
  }
}
