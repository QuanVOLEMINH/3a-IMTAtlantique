package mywork2

class ButtonView(name: String, event: exoIHM1.ButtonEvent, val model: ButtonModel)
  extends exoIHM1.MyButton(name, event) with mvc.View {

  model.addView(this)
  synchro
  override def synchro = this.enabled = model.isActive
}