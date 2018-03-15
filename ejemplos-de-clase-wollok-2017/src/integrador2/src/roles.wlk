
class Rol {
	method puedeLimpiar(staminaNecesaria, empleado) = empleado.stamina() > staminaNecesaria

	method tieneHerramienta(herramienta) = false

	method puedeDefender(gradoDeAmenaza, empleado) = empleado.fuerza() >= gradoDeAmenaza

	method fuerzaAdicional() = 0

	method staminaPerdidaPorDefender(empleado, tarea) = tarea.staminaQueDemandaDefender(empleado)

	method staminaPerdidaPorLimpiar(empleado, tarea) = tarea.staminaQueDemandaLimpiar(empleado)
	
	method puedeRealizar(tarea, empleado) = tarea.puedeSerRealizadaPor(empleado)
	
	method realizarTarea(tarea, empleado) {
		tarea.validarQuePuedaSerRealizadaPor(empleado)
		empleado.perderStamina(tarea.staminaQuePierde(empleado, self))
	}
}

class Mucama inherits Rol{
	override method puedeLimpiar(staminaNecesaria, empleado){
		return true
	}
	
	override method puedeDefender(gradoDeAmenaza, empleado){
		return false
	}
override method staminaPerdidaPorLimpiar(empleado, tarea){
	return 0
}
}


class Soldado inherits Rol{
	const practica
	constructor(_practica) {
		practica = _practica
	} 
	override method fuerzaAdicional() = practica

	override method staminaPerdidaPorDefender(empleado, tarea) = 0
}

class Obrero inherits Rol{
	const cinturon

	constructor(_cinturon) {
		cinturon = _cinturon
	}
	
	override method tieneHerramienta(herramienta){
		return cinturon.contains(herramienta)
	}
}

class Capataz inherits Rol{
	const subordinados
	constructor(_subordinados) {
		subordinados = _subordinados
	}
	
	override method puedeRealizar(tarea, empleado) =
		self.algunSubordinadoPuedeRealizar(tarea) || super(tarea, empleado)
		
	override method realizarTarea(tarea, empleado) {
		if(self.algunSubordinadoPuedeRealizar(tarea)){
			subordinados.find({subordinado => subordinado.puedeRealizar(tarea)}).realizarTarea(tarea)			
		} else {
			super(tarea, empleado)
		}
	}
	
	method algunSubordinadoPuedeRealizar(tarea) =
		subordinados.any({subordinado => subordinado.puedeRealizar(tarea)})
}