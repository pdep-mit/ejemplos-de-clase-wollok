class Dragon{
	var property peso
	
	method permiteSerMontadoPor(vikingo){
		return self.requisitos().all({req => req.cumpleRequisito(vikingo, self)})
	}
	
	// TODO falta resolver este problema, sólo lo planteamos una idea general
	// pensando en el uso exclusivamente
	method requisitos() = #{requisitoBase}
	
	// TODO falta resolver este problema, necesitan entender estos mensajes
	// para que funcionen con los jinetes
	// El resultado depende de la raza del dragón 
	// (podría modelarse con herencia, siendo Dragon una clase abstracta)
	method cuantoPuedeCargar() = 0
	method danioQueProduce() = 0
	method velocidad() = 0
}

/*
 * Los requisitos necesitan entender el mensaje cumpleRequisito(vikingo, dragon)
 * 
 * Otros requisitos a definir para poder cumplir con lo que se pide:
 * - Que la barbarosidad del vikingo supere un mínimo determinado
 * - Que el vikingo tenga un ítem en particular
 * - Que la inteligencia del vikingo no supere la del dragón
 */

object requisitoBase{
	method cumpleRequisito(vikingo, dragon) = vikingo.peso() < dragon.peso()
}

