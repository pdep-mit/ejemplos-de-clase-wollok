
class Tarea {
	method dificultadPara(empleado)
	method staminaQuePierde(empleado, rol)
	method puedeSerRealizadaPor(empleado)
	method errorAlNoPoderSerRealizada()
	method validarQuePuedaSerRealizadaPor(empleado) {
		if(!(self.puedeSerRealizadaPor(empleado))) {
			throw self.errorAlNoPoderSerRealizada()
		}
	}
}

class ArreglarUnaMaquina inherits Tarea{
	const complejidad
	const herramientasNecesarias
	
	constructor(_complejidad) {
		complejidad = _complejidad
		herramientasNecesarias = []
	}

	constructor(_complejidad, _herramientasNecesarias) {
		complejidad = _complejidad
		herramientasNecesarias = _herramientasNecesarias
	}
	override method dificultadPara(empleado) = complejidad * 2
	
	override method puedeSerRealizadaPor(empleado) =
		empleado.tieneStaminaParaArreglar(complejidad) && empleado.tieneHerramientas(herramientasNecesarias)
	
	override method errorAlNoPoderSerRealizada() = new Exception("Empleado no pudo arreglar la maquina")
	
	override method staminaQuePierde(empleado, rol) = complejidad
}


class DefenderSector inherits Tarea{
	//stamina que pierde por realizar tarea: stamina/2 a menos que sea soldado, entonces no pierde nada
	const gradoDeAmenaza
	constructor(_gradoDeAmenaza) { gradoDeAmenaza = _gradoDeAmenaza }

	method staminaQueDemandaDefender(empleado) = empleado.stamina() /2

	override method dificultadPara(empleado) = empleado.dificultadDeDefensa(gradoDeAmenaza)
	
	override method puedeSerRealizadaPor(empleado) = empleado.puedeDefender(gradoDeAmenaza)
	
	override method errorAlNoPoderSerRealizada() = new Exception("Empleado no pudo defender el sector")

	override method staminaQuePierde(empleado, rol) = return rol.staminaPerdidaPorDefender(empleado, self)
}

class LimpiarSector inherits Tarea{
	const sectorGrande
	const dificultadLimpieza = dificultadDeLimpieza
	
	constructor(_sectorGrande) {
		sectorGrande = _sectorGrande
	}
	
	method staminaNecesaria() = if(sectorGrande) 4 else 1
	
	override method dificultadPara(empleado) = dificultadLimpieza.dificultad()
	
	override method puedeSerRealizadaPor(empleado) =
		empleado.tieneStaminaParaLimpiar(self.staminaNecesaria())
	
	override method errorAlNoPoderSerRealizada() = new Exception("Empleado no pudo limpiar sector")

	override method staminaQuePierde(empleado, rol) = rol.staminaPerdidaPorLimpiar(empleado, self)

	method staminaQueDemandaLimpiar(empleado) = self.staminaNecesaria()
}

object dificultadDeLimpieza{
	var dificultad = 10
	method dificultad() = return dificultad
	
	method cambiarA(nuevaDificultad) {
		dificultad = nuevaDificultad
	}
}