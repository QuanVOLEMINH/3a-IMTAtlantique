package mywork

class ButtonView(name: String, event: exoIHM1.ButtonEvent, val model: ButtonModel) 
  extends exoIHM1.MyButton(name, event) with mvc.View {
  
  model.addView(this)
  override def synchro = this.enabled = model.isActive
}