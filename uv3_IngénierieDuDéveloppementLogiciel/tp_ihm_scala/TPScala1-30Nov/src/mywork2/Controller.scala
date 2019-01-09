package mywork2
import exoIHM1._
import mvc._

class Controller(val activeBtn: ButtonModel, val passiveBtn: ButtonModel) extends exoIHM1.Controller {

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

  def startDrawing {
    activeBtn.set(false);
    passiveBtn.set(true);
  }

  def endDrawing {
    activeBtn.set(true);
    passiveBtn.set(false);
  }
}