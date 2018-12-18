package exoIHM6

import exoIHM2.ButtonModel
import exoIHM1.{DESSIN,ButtonEvent}
import exoIHM5.{CurrentLineModel}
import java.awt.Point

case object RBON extends ButtonEvent("RB on")
case object RBOFF extends ButtonEvent("RB off")

class Controller(mbq: ButtonModel, mbs: ButtonModel, 
  model : mvc.ListModel[mvc.Drawable], clm : CurrentLineModel,
  val rbonButtonModel :ButtonModel, val rboffButtonModel : ButtonModel) 
  extends exoIHM5.Controller(mbq,mbs,model,clm) {
  
  private var isRBon = true
  protected def actionRBon = {
    isRBon = true
    rbonButtonModel.set(false)
    rboffButtonModel.set(true)
    drawingController = new exoIHM5.DrawingController(model,clm)
  }
  // arrêt du rubber banding
  protected def actionRBoff = {
    isRBon = false
    rboffButtonModel.set(false)
    rbonButtonModel.set(true)
    drawingController = new exoIHM3.DrawingController(model)
  }

  override def event(evt: mvc.AppEvent):Unit = {
    super.event(evt)
    evt match {
      case RBON if (!isRBon) => actionRBon
      case RBOFF if (isRBon) => actionRBoff
      case _ => ()
    }
  }
}