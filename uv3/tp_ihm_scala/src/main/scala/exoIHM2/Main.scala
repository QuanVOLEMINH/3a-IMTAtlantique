package exoIHM2

import scala.swing._
import scala.swing.BorderPanel.Position._
import event._
import exoIHM1._

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Dessiner"

    // declare Components here
    val quitButtonModel = new ButtonModel(true)
    val stopButtonModel = new ButtonModel(false)

    val controller = new Controller(quitButtonModel, stopButtonModel)
    val buttonList = List(
        new ButtonView("Quit", QUIT, quitButtonModel),
        new ButtonView("Start",START, quitButtonModel),
        new ButtonView("Stop",STOP, stopButtonModel))
   
    // Les boutons
    val buttons = new BoxPanel(Orientation.Vertical) {
      buttonList.foreach(b => contents += b)
    }

    contents = new BorderPanel {
      layout(buttons) = West

    }

    location = new Point(250, 120)
    // specify which Components produce events of interest
    buttonList.foreach(b => listenTo(b))

    // react to events
    reactions += {
      case ButtonClicked(component: MyButton) =>
        controller.event(component.event)
    }
  }
}
