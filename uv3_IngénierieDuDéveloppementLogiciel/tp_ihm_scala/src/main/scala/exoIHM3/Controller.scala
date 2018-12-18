package exoIHM3

import scala.swing._
import exoIHM2._
import exoIHM1.{QUIT,START,STOP,INIT,DESSIN}
import mvc._

class Controller(mbq: ButtonModel, mbs: ButtonModel, 
  val model : ListModel[Drawable]) extends exoIHM2.Controller(mbq,mbs) {
  protected var drawingController = new DrawingController(model) 
  // Les actions
  
  // Les évenements
  override def event(evt: mvc.AppEvent):Unit = {
    evt match {
      case QUIT if (state == INIT) => quitAction
      case START if (state == INIT) => {
        state = DESSIN
        startAction
      }
      case STOP if (state == DESSIN) => {
        state = INIT
        endAction
      }
      case PRESS(_) | RELEASE(_) if (state == DESSIN) => drawingController.event(evt)
      case _ => ()
    }
    println("Nous sommes dans l'état " + state);
  }
}
