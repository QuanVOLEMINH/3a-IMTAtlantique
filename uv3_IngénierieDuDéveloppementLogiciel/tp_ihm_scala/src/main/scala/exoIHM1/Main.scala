package exoIHM1

import scala.swing._
import scala.swing.BorderPanel.Position._
import event._

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Dessiner"

    val controller = new Controller()
    val buttonList = List(
        new MyButton("Quit", QUIT),
        new MyButton("Start",START),
        new MyButton("Stop",STOP))
    
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
