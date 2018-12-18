package exoIHM1

abstract class ButtonEvent(name: String) extends mvc.AppEvent(name)
case object QUIT extends ButtonEvent("Quit")
case object START extends ButtonEvent("Start")
case object STOP extends ButtonEvent("Stop")