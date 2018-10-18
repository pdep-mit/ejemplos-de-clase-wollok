import excepciones.*

object buenosAires {
	method kilometrosHasta(destino) = 7
}
object cordoba {
	method kilometrosHasta(destino) = 10
}

object pepita {
  var property energia = 100
  var ciudad = buenosAires
  
  method volar(kilometros){
  	self.validarQueTieneEnergiaSuficienteParaVolar(kilometros)
  	energia -= self.energiaQueSeGastaVolando(kilometros)
  }
  
  method volarA(destino){
  	if(destino == ciudad)
  		throw new UserException(message = "El lugar a volar debería ser distinto al actual")
  		
  	// Si el mensaje volar lanza una excepción porque no hay energía suficiente
  	// volarA también va a terminar su ejecución, no se va a ejecutar el cambio de ciudad
  	// lo cual es deseable. Es importante que los efectos sucedan luego de todas las validaciones.
  	self.volar(ciudad.kilometrosHasta(destino))
  	
	ciudad = destino
  }
  
  method validarQueTieneEnergiaSuficienteParaVolar(kilometrosAVolar) {
  	if(self.energiaQueSeGastaVolando(kilometrosAVolar) > energia)
  		throw new EnergiaInsuficiente()
  }
  
  method energiaQueSeGastaVolando(kilometros) = 40 + 5 * kilometros
  
  method comer(gramos){
  	energia = energia + gramos * 2
  }

}

object entrenador {
	method entrenar(pajaro){
		pajaro.comer(10)
		self.hacerVolar(pajaro)
	}
	
	// Asumiendo que el entrenador tiene algo razonable para hacer
	// en caso de que no se pueda volar, puede atrapar la excepción
	// y hacer aquello que corresponda para continuar la ejecución.
	method hacerVolar(pajaro){
		try{
			pajaro.volar(20)
		} catch e: EnergiaInsuficiente {
			// Si no tiene suficiente energía para volar, le da
			// bastante de comer y después vuelve a intentarlo
			pajaro.comer(50)
			pajaro.volar(20)
		} catch e: UserException {
			// Si quisiéramos hacer algo con otros motivos de error,
			// se puede. Sólo hay que tener el recaudo de indicar de
			// más particular a más general los catch.
			
			// Podemos también hacer cosas con la excepción,
			// a la cual tendremos referenciada con la variable
			// declarada en el catch, como volver a lanzarla
			// luego de tomar alguna acción razonable,
			// o lanzar otra usándola como causa para agregar información
			// o simplificarla para alguien más, sin perder el stacktrace original:
			throw new EntrenamientoFallido(
				cause = e, 
				message = "El pájaro no pudo volar"
			)
			
			// Si no hay nada razonable para hacer, siempre lo mejor
			// es no atrapar la excepción y dejarla seguir rompiendo.
			// Acá sólo hacemos esto para mostrar un ejemplo de algo 
			// que se puede hacer, no porque sea LA FORMA de trabajar.
		}
		
	}
}
