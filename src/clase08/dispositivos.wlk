import clase08.animales.*
import clase08.excepciones.*

class Bebedero {
	method esUtilParaAtender(animal) =
		animal.tieneSed()	

	method atender(animal){
		animal.beber()
	}
	
	method consumoEnergetico() = 10
	
	method image() = "bebedero.png"
}

class Comedero {
	const pesoMaximoSoportado
	const racion

	method esUtilParaAtender(animal) 
		= animal.tieneHambre() 
			&& not self.superaPesoMaximo(animal)

	method atender(animal) {
		self.validarAtencion(animal)
		self.darDeComer(animal)
	}

	method darDeComer(animal) {
		animal.comer(racion)
	}

	// Se cambia excepción de dominio genérica por una más específica 
	method validarAtencion(animal) {
		if (self.superaPesoMaximo(animal))
			//self.error("El animal es demasiado pesado para atenderlo")
			throw new NoSePudoAtenderException(message = "El animal es demasiado pesado para atenderlo")
	}

	method superaPesoMaximo(animal) = animal.peso() > pesoMaximoSoportado

	method consumoEnergetico() = 20 * pesoMaximoSoportado

	method image() = "comedero.png"
}

class ComederoRecargable inherits Comedero {

	var stockDeRaciones = 0

	method tieneRaciones() = stockDeRaciones > 0

	method recargar(cantidadDeComida) {
		stockDeRaciones += self.cantidadDeRaciones(cantidadDeComida)
	}

	method cantidadDeRaciones(cantidadDeComida) = cantidadDeComida.div(racion)

	override method consumoEnergetico() = stockDeRaciones * 2

	override method esUtilParaAtender(animal)
		 = self.tieneRaciones() && super(animal)
		
	override method darDeComer(animal) {
		super(animal)
		stockDeRaciones -= 1
	}

	// Se cambia excepción de dominio genérica por una más específica
	override method validarAtencion(animal) {
		super(animal) 
		if (not self.tieneRaciones())
			// self.error("No hay raciones")
			throw new NoHayRacionesException(message = "No hay raciones")
	}
	
	override method image() = "recargable.png"
}

