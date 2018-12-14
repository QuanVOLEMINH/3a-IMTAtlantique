package exempleIhm

import mvc.AppState

case object PAIR extends AppState
case object IMPAIR extends AppState

object State {
  def inv(s : AppState) : AppState = {
    s match {
      case PAIR => IMPAIR
      case IMPAIR => PAIR
    }
  }
}