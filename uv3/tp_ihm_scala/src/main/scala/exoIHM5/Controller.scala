package exoIHM5

import exoIHM2.ButtonModel
import exoIHM3.{PRESS,RELEASE}
import exoIHM1.{QUIT,START,STOP,INIT,DESSIN}
import java.awt.Point

class Controller(mbq: ButtonModel, mbs: ButtonModel, 
  model : mvc.ListModel[mvc.Drawable], val clm : CurrentLineModel) 
  extends exoIHM3.Controller(mbq,mbs,model) {
    drawingController = new DrawingController(model,clm) 

  override def event(evt: mvc.AppEvent):Unit = {
    super.event(evt)
    evt match {
      case DRAG(_) if (state == DESSIN) => drawingController.event(evt)
      case _ => ()
    }
  }
}