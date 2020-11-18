/*
 * 1. pokemon.grositud()
 * 2a. movimiento.usarEntre(usuario, contrincante)
 * 2b. pokemon.lucharContra(contrincante)
 * 
 * 3 -> agregado de Confusion, no hizo falta cambiar nada de lo anterior
 */
 
 class Pokemon {
 	const vidaMaxima
 	const movimientos = []
 	var vida = 0
 	var property condicion = normal
 	
 	method grositud() = vidaMaxima * movimientos.sum {movimiento => 
 		movimiento.poder()
 	}
 	method curar(puntosDeSalud){
 		vida = (vida + puntosDeSalud).min(vidaMaxima)
 	}
 	method recibirDanio(danio){
 		vida = 0.max(vida - danio)
 	}
 	method lucharContra(contrincante){
 		self.validarQueEstaVivo()
 		contrincante.validarQueEstaVivo()
 		// elegir un movimiento de los que están disponibles
 		const movimientoAUsar = self.movimientoDisponible()
 		// usar ese movimiento sólo si la condición se lo permite
 		condicion.intentaMoverse(self)
 		movimientoAUsar.usarEntre(self, contrincante)
 	}
 	method validarQueEstaVivo(){
 		if(vida == 0){
 			throw new NoPuedeMoverseException(message = "El pokemon no está vivo")
 		}
 	}
 	method movimientoDisponible() = movimientos.findOrElse({movimiento =>
 		movimiento.estaDisponible()
 	}, {throw new NoPuedeMoverseException(message = "No tiene movimientos disponibles")})
 	
 	method normalizar(){
 		condicion = normal
 	}
 }
 
 ///////// MOVIMIENTOS
 class Movimiento {
 	var usosPendientes = 0
 	method usarEntre(usuario, contrincante){
 		if(! self.estaDisponible())
 			throw new MovimientoAgotadoException(message = "El movimiento no está disponible")
 		usosPendientes -= 1
 		self.afectarPokemones(usuario, contrincante)
 	}
 	method estaDisponible() = usosPendientes > 0
	method afectarPokemones(usuario, contrincante)
 }
 class MovimientoCurativo inherits Movimiento {
 	const puntosDeSalud
	method poder() = puntosDeSalud
	override method afectarPokemones(usuario, contrincante){
		usuario.curar(puntosDeSalud)
	}
 }
 
 class MovimientoDanino inherits Movimiento {
 	const danioQueProduce
 	method poder() = 2 * danioQueProduce
 	override method afectarPokemones(usuario, contrincante){
		contrincante.recibirDanio(danioQueProduce)
	}
 }

// Confusion: ¿mutable o inmutable?
// const confusion = new Confusion(turnosQueDura = 2)
// const movimiento = new MovimientoEspecial(condicionQueGenera = confusion)
// afectarPokemones --> pokemon.condicion(confusion)

// - si confusion fuera mutable, cuando el pokemon intente moverse va a impactar al movimiento,
// porque el movimiento va a conocer a la condición modificada, al usarlo nuevamente va a durar
// menos turnos :s
// - si confusion es inmutable, no hay problema con que tanto el pokemon como el movimiento
// conozcan a la misma instancia de la clase Confusion :D

class MovimientoEspecial inherits Movimiento {
	const condicionQueGenera
	method poder() = condicionQueGenera.poder()
	override method afectarPokemones(usuario, contrincante){
		contrincante.condicion(condicionQueGenera)
		
		// Otra variante simpática:
		// condicionQueGenera.generarSobre(contrincante)
		// Nota: esto podría servir para hacer algo distinto en la confusión,
		// como ser crear una nueva instancia de Confusion con los turnos que correspondan
		// para no compartir el mismo objeto, pudiendo mantener a esa condición mutable.
	}
}

///////// CONDICIONES

object normal {
	method intentaMoverse(pokemon){
		// siga, siga
	}
}

// especiales

class CondicionEspecial {
	method intentaMoverse(pokemon){
		if(! self.lograMoverse())
			throw new NoPuedeMoverseException(message = "El pokemon no pudo moverse")
	}
	
	method lograMoverse() = 0.randomUpTo(2).roundUp().even()
	
	method poder()
}

class Confusion inherits CondicionEspecial {
	const turnosQueDura = 0
	
	override method poder() = 40 * turnosQueDura
	override method intentaMoverse(pokemon){
		self.pasoUnTurno(pokemon)
		
		try {
			super(pokemon)
		}
		catch e : NoPuedeMoverseException {
			pokemon.recibirDanio(20)
			throw new NoPuedeMoverseException(
				message = "El pokémon no pudo moverse y se hizo daño a sí mismo",
				cause = e
			)
		}
	}
	method pasoUnTurno(pokemon){
		if(turnosQueDura > 1){
			pokemon.condicion(new Confusion(turnosQueDura = turnosQueDura - 1))
		} else {
			pokemon.normalizar()
		}
	}
}
object paralisis inherits CondicionEspecial {
	override method poder() = 30
}
object suenio inherits CondicionEspecial {
	override method poder() = 50
	
	override method intentaMoverse(pokemon){
		super(pokemon)
		pokemon.normalizar()
	}
}


///////// EXCEPCIONES

class MovimientoAgotadoException inherits Exception {}
class NoPuedeMoverseException inherits Exception {}