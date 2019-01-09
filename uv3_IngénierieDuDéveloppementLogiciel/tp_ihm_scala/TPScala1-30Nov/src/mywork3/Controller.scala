package mywork3

import mywork2._
import exoIHM1.{ QUIT, START, STOP, INIT, DESSIN }
import mvc._

class Controller(activeBtn: ButtonModel, passiveBtn: ButtonModel, val model: ListModel[Drawable]) extends mywork2.Controller(activeBtn, passiveBtn) {

  override def event(evt: mvc.AppEvent): Unit = {
    evt match {
      case QUIT if (state == INIT) => quitAction
      case START if (state == INIT) => {
        state = DESSIN
        startDrawing
      }
      case STOP if (state == DESSIN) => {
        state = INIT
        endDrawing
      }
      case _ => ()
    }
  }
}