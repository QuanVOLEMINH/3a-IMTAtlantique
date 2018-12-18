package mywork
import exoIHM1._
import mvc._

class Controller(val activeBtn: ButtonModel, val passiveBtn: ButtonModel) extends exoIHM1.Controller{
  
  override def event(evt: mvc.AppEvent): Unit = {
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
  }
  
  def startAction{
    activeBtn.set(true);
    passiveBtn.set(false);
  }
  
  def endAction{
    activeBtn.set(false);
    passiveBtn.set(true);
  }
}