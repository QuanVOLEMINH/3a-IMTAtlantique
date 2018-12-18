import scala.swing._
import scala.swing.BorderPanel.Position._

object BorderPanelDemo extends SimpleSwingApplication {
  def top = new MainFrame {
    contents = new BorderPanel {
      layout(new Button("Center")) = Center
      layout(new Button("North")) = North
      layout(new Button("South")) = South
      layout(new Button("West")) = West
      layout(new Button("East")) = East
    }
  }
}