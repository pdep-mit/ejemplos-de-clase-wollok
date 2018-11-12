class TipoDeRecurso {
	const property resistenciaUnitaria
	method resistenciaQueAporta(cantidad) = self.resistenciaUnitaria() * cantidad
}

object oro inherits TipoDeRecurso {
	override method resistenciaQueAporta(cantidad) {
		if(cantidad > 5000){
			return super(cantidad) * 2
		} else {
			return super(cantidad)
		}
	}
}

object madera inherits TipoDeRecurso {}

object comida inherits TipoDeRecurso {}

object piedra inherits TipoDeRecurso {}


class Recurso {
	const property tipoDeRecurso
	var property cantidad = 0
	
	method aumentar(incremento){
		cantidad += incremento
	}
	
	method gastar(gastado){
		self.validarCantidadSuficienteParaGastar(gastado)
		
		cantidad -= gastado
	}
	
	method validarCantidadSuficienteParaGastar(gastado) {
		if(self.cantidad() < gastado)
			throw new RecursoInsuficiente(message = "No hay suficiente " + tipoDeRecurso + " para gastar")
	}
	
	method vaciar(){
		cantidad = 0
	}
	
	method vacio() = cantidad == 0
	
	method resistenciaQueAporta() = tipoDeRecurso.resistenciaQueAporta(cantidad)
}


class RecursoInsuficiente inherits Exception {}