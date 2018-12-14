package exempleIhm

import scala.swing._
import scala.swing.BorderPanel.Position._
import javax.swing.UIManager
import event._

object Main extends SimpleSwingApplication {

  def top = new MainFrame {
    title = "Un exemple"

    val model = new ClicModel()
    val label = new ClicView(model)
    model.addView(label)
    val controller = new Controller(model)
    
    val compter = new Button("Un bouton pour cliquer !")
    val quitter = new Button("Quitter si le nombre est pair")

    contents = new BorderPanel {
      layout(compter) = East; layout(quitter) = Center; layout(label) = South
    }

    listenTo(quitter)
    listenTo(compter)

    reactions += {
      case ButtonClicked(c) if c == quitter => controller.event(QUIT)
      case ButtonClicked(c) if c == compter => controller.event(COUNT)
    }
  }
}
