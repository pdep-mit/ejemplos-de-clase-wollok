import clase05.animales.*

object puercoArania inherits Cerdo(peso = 75) {
  var property patasSucias = false
  override method tieneSed() {
    return patasSucias || super()
  }
  override method caminar(tiempo) {
    super(tiempo)
    if(tiempo > 1) patasSucias = true
  }
}