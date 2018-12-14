package mvc

import swing._
import scala.collection.mutable.StringBuilder

class TextView(val model : ListModel[Drawable]) extends TextArea with View {
  override def synchro = {
    val res = new StringBuilder
    for (d <- model)
      res ++= d + "\n"
    text = res.toString
  }
}
