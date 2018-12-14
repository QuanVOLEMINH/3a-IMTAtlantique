package exempleIhm

class ClicModel(var numClics:Int = 0) extends mvc.Model {
  def incr = {
    numClics += 1
    this.notifyViews
  }
}
