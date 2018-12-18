package mywork

class ButtonModel(var active: Boolean) extends mvc.Model{
  def isActive = active
  
  def set(a: Boolean){
    active = a;
    notifyViews
  }
}