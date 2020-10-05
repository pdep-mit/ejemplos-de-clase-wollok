import clase04.atencionDeAnimales.Gallina
import clase05.animales.*

// Refactorizando a los comederos
class Comedero {
	const pesoMaximoSoportado
	const racion

	method esUtilParaAtender(animal) 
		= animal.tieneHambre() 
			&& animal.peso() < pesoMaximoSoportado

	// Lógica general para atender a un animal
	method atender(animal) {
		self.validarAtencion(animal)
		self.darDeComer(animal)
	}

	method darDeComer(animal) {
		animal.comer(racion)
	}

	method validarAtencion(animal) {
		if (self.superaPesoMaximo(animal))
			self.error("El animal es demasiado pesado para atenderlo")
	}

	method superaPesoMaximo(animal) = animal.peso() > pesoMaximoSoportado

	method consumoEnergetico() = 20 * pesoMaximoSoportado

}

// Agregamos un nuevo tipo de comedero
class ComederoRecargable inherits Comedero {

	var stockDeRaciones = 0

	// Queremos saber si le quedan raciones de comida
	method tieneRaciones() = stockDeRaciones > 0

	/*
	 * Cuando se recarga con una cantidad de comida (en kgs) 
	 * incrementa la cantidad de raciones que tiene, considerando el tamaño
	 * de la ración que da (configurable como cualquier comedero)
	 */
	method recargar(cantidadDeComida) {
		stockDeRaciones += self.cantidadDeRaciones(cantidadDeComida)
	}

	method cantidadDeRaciones(cantidadDeComida) = cantidadDeComida.div(racion)

	/*
	 * Su consumo energético es distinto que el de los comederos normales,
	 * es el doble de la cantidad de raciones que tiene
	 */
	override method consumoEnergetico() = stockDeRaciones * 2

	/*
	 * Sólo se considera útil para atender a un animal si tiene raciones
	 * y además cumple con las mismas condiciones que los comederos normales:
	 * - El animal tiene hambre
	 * - El animal no supera el peso máximo que el comedero soporta 
	 */
	override method esUtilParaAtender(animal)
		 = self.tieneRaciones() && super(animal)
		 
	/*
	 * Los comederos recargables atienden igual que los comederos normales,
	 * considerando que deben tener raciones para que puedan atender al animal
	 * y debe decrementarse el stock de raciones luego de alimentarlo.
	 */
	 
	// No hace falta redefinir la lógica general para atender(animal),
	// sólo lo que corresponda para los métodos chico
	override method darDeComer(animal) {
		super(animal)
		stockDeRaciones -= 1
	}

	// No importa qué validación se haga primero, sólo que se hagan ambas
	override method validarAtencion(animal) {
		super(animal) 
		if (not self.tieneRaciones()) self.error("No hay raciones")
	}
	
}

