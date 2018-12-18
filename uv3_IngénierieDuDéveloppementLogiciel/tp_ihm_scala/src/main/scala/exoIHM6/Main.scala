package exoIHM6

import scala.swing._
import scala.swing.BorderPanel.Position._
import event._
import exoIHM2.{ButtonModel,ButtonView}
import exoIHM3.{PRESS,RELEASE}
import exoIHM1.{QUIT,START,STOP,MyButton}
import exoIHM5.{CurrentLineModel,Canvas,DRAG}
import mvc.{ListModel,Drawable,TextView}

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Dessiner"

    // declare Components here
    val quitButtonModel = new ButtonModel(true)
    val stopButtonModel = new ButtonModel(false)
    val rbonButtonModel = new ButtonModel(false)
    val rboffButtonModel = new ButtonModel(true)

    val listModel = new ListModel[Drawable]
    val clm = new CurrentLineModel(null)


    val controller = new Controller(quitButtonModel, stopButtonModel, 
        listModel, clm, rbonButtonModel, rboffButtonModel)
    val dessin = new Canvas(listModel,clm) {
      listenTo(mouse.clicks)
      listenTo(mouse.moves)
      reactions += {
         case MousePressed(_, point, _, _, _) =>
           controller.event(new PRESS(point))
         case MouseReleased(_, point, _, _, _) =>
           controller.event(new RELEASE(point))
         case MouseDragged(_, point, _) =>
           controller.event(new DRAG(point))
      }
    }
    listModel.addView(dessin)
    clm.addView(dessin)
    
    val buttonList = List(
        new ButtonView("Quit", QUIT, quitButtonModel),
        new ButtonView("Start",START, quitButtonModel),
        new ButtonView("Stop",STOP, stopButtonModel),
        new ButtonView("RB on",RBON, rbonButtonModel),
        new ButtonView("RB off",RBOFF, rboffButtonModel)
    )
   
    // Les boutons
    val buttons = new BoxPanel(Orientation.Vertical) {
      buttonList.foreach(b => contents += b)
    }

    // Texte
    val txtView = new TextView(listModel) {
      editable = false
    }
    listModel.addView(txtView)
    val text = new ScrollPane(txtView) {
      preferredSize = new Dimension(250, 100)
    }

    contents = new BorderPanel {
      layout(buttons) = West
      layout(dessin) = Center
      layout(text) = South
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
