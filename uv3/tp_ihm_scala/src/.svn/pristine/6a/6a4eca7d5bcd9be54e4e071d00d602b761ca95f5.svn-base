
import scala.swing._
import java.awt.Color

object Gui0 extends SimpleSwingApplication {
  def top = new MainFrame {
    val leftPanel = new BoxPanel(Orientation.Vertical) {
      border = Swing.EmptyBorder(10); background = Color.gray
      contents += new Button("button1")
      contents += new Button("button2")
    }
    val rightPanel = new BoxPanel(Orientation.Vertical) {
      border = Swing.EmptyBorder(10); background = Color.gray
      contents += new TextArea("a component that \ndisplays text...")
    }
    contents = new BoxPanel(Orientation.Horizontal) {
      border = Swing.EmptyBorder(10); background = Color.pink
      contents += leftPanel
      contents += Swing.HStrut(10)
      contents += rightPanel
    }
  }
}
