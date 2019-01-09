package mvc

import scala.collection.mutable.ListBuffer
import scala.collection.mutable.StringBuilder

class ListModel[T](val content: ListBuffer[T] = new ListBuffer[T]) extends Model {

  def add(e: T) = {
    content += e
    notifyViews
  }

  def remove(e: T) = {
    content -= e
    notifyViews
  }

  def foreach(op: T => Unit): Unit = {
    content.foreach(op)
  }

  override def toString = {
    var res = new StringBuilder("[")
    var first = true
    for (e <- content) {
      if (!first)
        res ++= ","
      res ++= e.toString
      first = false
    }
    res + "]"
  }

  def clear = {
    content.clear
    notifyViews
  }
}