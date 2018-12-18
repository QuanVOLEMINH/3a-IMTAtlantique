package mvc

trait Model {
  private var views:Set[View] = Set()
    
  def addView(v :View) = views += v
    
  def removeView(v :View) = views -= v

  def notifyViews = views.foreach {v => v.synchro} 
}