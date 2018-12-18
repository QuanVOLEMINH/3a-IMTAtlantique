package exoIHM2

class ButtonModel(private var on: Boolean) extends mvc.Model {
  def isOn = on  
  def set(b: Boolean) = {
    if (on != b) {
      on = b
      notifyViews
    }
  }
}