import model.jugadores.*

class Equipo {
	const property integrantes = []
	var property puntos = 0
	
	method habilidadTotal() 
		= self.integrantes().sum({integrante =>
				integrante.habilidad()
			})
	
	method esMejorQue(otroEquipo) =
		 self.habilidadTotal() > otroEquipo.habilidadTotal()

	method masHabilidoso() 
		= self.integrantes().max({integrante =>
			integrante.habilidad()
		})
		
	method jugarContra(rival){
		integrantes.forEach({unJugador => unJugador.jugarContra(rival, self)})
	}
	
	method sumarPuntos(puntosGanados){
		puntos += puntosGanados
	}
	
	method puedeBloquear(cazadorABloquear) =
		integrantes.any({jugador => jugador.capazDeBloquear()
			             && jugador.habilidad() >= 2 * cazadorABloquear.habilidad()})
	
	
	method obtenerQuaffle(){
		integrantes.filter({jugador => jugador.puedeTenerQuaffle()})
			               .max({jugador => jugador.habilidad()})
			               .obtenerQuaffle()
	}
}