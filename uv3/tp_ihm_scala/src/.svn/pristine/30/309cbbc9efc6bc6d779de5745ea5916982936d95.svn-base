package exempleIhm

class Controller(val controlledModel: ClicModel) extends mvc.Controller(PAIR) {
  // Les actions
  def countAction = controlledModel.incr
  def quitAction = sys.exit(0)
  
  // Les évenements
  override def event(evt: mvc.AppEvent):Unit = {
    println("event [" + evt + "]")
    evt match {
      case QUIT if (state == PAIR) => quitAction
      case COUNT => 
        state = State.inv(state)
        countAction
      case _ => ()
    }
  }
}
