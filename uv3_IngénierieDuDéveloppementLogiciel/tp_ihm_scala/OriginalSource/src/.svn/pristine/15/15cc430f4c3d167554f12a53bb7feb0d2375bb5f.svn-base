package exoIHM2

import scala.swing._
import exoIHM1._
import mvc._

class Controller(val mbq: ButtonModel, val mbs: ButtonModel) 
  extends exoIHM1.Controller {
  // Les actions
  def startAction = {
    mbq.set(false)
    mbs.set(true)
  }
  def endAction = {
    mbq.set(true)
    mbs.set(false)
  }
  
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
      case _ => ()
    }
    println("Nous sommes dans l'état " + state);
  }
}
