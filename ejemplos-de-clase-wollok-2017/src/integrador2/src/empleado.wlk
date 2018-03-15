class Empleado {
	var stamina
	var tareas
	var rol
	
	constructor(unaStamina, unasTareas, unRol){
		stamina = unaStamina
		tareas = unasTareas
		rol = unRol
	}
	method stamina() = stamina
	
	method fuerzaBase() = (stamina + 2) / 2
	
	method fuerza() = self.fuerzaBase() + rol.fuerzaAdicional()
	
	method comerFruta(unaFruta){
		self.aumentarStamina(unaFruta.valor())
	}
	
	method aumentarStamina(cantidad)
	
	method experiencia() = tareas.size() * tareas.sum({tarea => tarea.dificultadPara(self)})
	
	method dificultadDeDefensa(gradoDeAmenaza)
	
	method tieneStaminaParaArreglar(complejidad) = stamina > complejidad
	
	method tieneHerramientas(herramientasNecesarias) =
		herramientasNecesarias.all({herramienta => rol.tieneHerramienta(herramienta)})
	
	method tieneStaminaParaLimpiar(staminaNecesaria) = rol.puedeLimpiar(staminaNecesaria, self)
	
	method puedeDefender(gradoDeAmenaza) = rol.puedeDefender(gradoDeAmenaza, self)

	method realizarTarea(unaTarea){
		rol.realizarTarea(unaTarea, self)
	}
	
	method puedeRealizar(tarea) = rol.puedeRealizar(tarea, self)
	
	method perderStamina(_stamina) {
		stamina = (stamina - _stamina).max(0)
	}
}

class Ciclope inherits Empleado {
	override method dificultadDeDefensa(gradoDeAmenaza) = gradoDeAmenaza * 2

	override method fuerza() = super() /2
	
	override method aumentarStamina(cantidad) {
		stamina += cantidad
	}
}

class Biclope inherits Empleado{
	override method dificultadDeDefensa(gradoDeAmenaza) = gradoDeAmenaza
	
	override method aumentarStamina(cantidad){
		stamina = (stamina + cantidad).min(10)
	}
}





