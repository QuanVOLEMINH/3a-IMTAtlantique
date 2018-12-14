import scala.swing._
import scala.swing.BorderPanel.Position._
import javax.swing.UIManager
import event._
import javax.swing.plaf.nimbus.NimbusLookAndFeel

object Gui1 extends SimpleSwingApplication {
  def top = new MainFrame {
    UIManager.setLookAndFeel(new NimbusLookAndFeel)
    title = "A Sample Scala Swing GUI"

    val label = new Label("Uninitialized!")
    val button = new Button("A button to click!")

    contents = new BorderPanel {
      layout(button) = Center
      layout(label) = South
    }

    listenTo(button)

    var numClicks = 0

    reactions += {
      case ButtonClicked(component) if component == button =>
        numClicks += 1
        label.text = " Click number: " + numClicks + " "
    }
  }
}
