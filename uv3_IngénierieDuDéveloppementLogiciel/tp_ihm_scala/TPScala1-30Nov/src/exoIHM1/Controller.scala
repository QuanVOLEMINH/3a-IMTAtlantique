package exoIHM1

class Controller extends mvc.Controller(INIT) {
  // Les actions
  def quitAction = sys.exit(0)

  // Les évenements
  override def event(evt: mvc.AppEvent): Unit = {
    evt match {
      case QUIT if (state == INIT) => quitAction
      case START if (state == INIT) => state = DESSIN
      case STOP if (state == DESSIN) => state = INIT
      case _ => ()
    }
    println("Nous sommes dans l'état " + state);
  }
}