package exoIHM3

import scala.swing._
import scala.swing.BorderPanel.Position._
import event._
import exoIHM2._
import exoIHM1.{QUIT,START,STOP,MyButton}
import mvc._

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Dessiner"

    // declare Components here
    val quitButtonModel = new ButtonModel(true)
    val stopButtonModel = new ButtonModel(false)
    val listModel = new ListModel[Drawable]

    val controller = new Controller(quitButtonModel, stopButtonModel, listModel)
    val dessin = new Canvas(listModel) {
      listenTo(mouse.clicks)
      reactions += {
         case MousePressed(_, point, _, _, _) =>
           controller.event(new PRESS(point))
         case MouseReleased(_, point, _, _, _) =>
           controller.event(new RELEASE(point))
      }
    }
    listModel.addView(dessin)
    
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
      layout(dessin) = Center
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
