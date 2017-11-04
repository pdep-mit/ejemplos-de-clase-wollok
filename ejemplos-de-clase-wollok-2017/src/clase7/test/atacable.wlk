import model.unidades.*
import model.items.*
/*
 Para simplificar el testeo del daño que produce un ataque
 Este objeto es polimórfico con las unidades, puede ser atacado y no se defiende >:)
 */
object atacable inherits Unidad(new Armadura(0)) {
	
	method danioRecibido() = 100 - vida

	override method puedeSerAtacado() = true

}
