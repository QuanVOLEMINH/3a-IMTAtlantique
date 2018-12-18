package exoIHM2

class ButtonView(name: String, val evt: exoIHM1.ButtonEvent, val model: ButtonModel) 
  extends exoIHM1.MyButton(name, evt) with mvc.View {
  model.addView(this)
  synchro

  override def synchro = this.enabled = model.isOn
}


