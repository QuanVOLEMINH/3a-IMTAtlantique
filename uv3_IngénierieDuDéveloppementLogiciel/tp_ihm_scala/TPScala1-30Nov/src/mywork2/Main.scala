package mywork2

import scala.swing._
import scala.swing.BorderPanel.Position._
import event._
import exoIHM1._

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Dessiner"

    val activeButtonModel = new ButtonModel(true)
    val passiveButtonModel = new ButtonModel(false)

    val controller = new Controller(activeButtonModel, passiveButtonModel)

    val buttonList = List(
      new ButtonView("Quit", QUIT, activeButtonModel),
      new ButtonView("Start", START, activeButtonModel),
      new ButtonView("Stop", STOP, passiveButtonModel))

    val buttons = new BoxPanel(Orientation.Vertical) {
      buttonList.foreach(b => contents += b)
    }

    contents = new BorderPanel {
      layout(buttons) = West
    }

    location = new Point(250, 120)

    buttonList.foreach(b => listenTo(b))

    reactions += {
      case ButtonClicked(component: MyButton) =>
        controller.event(component.event)
    }
  }
}