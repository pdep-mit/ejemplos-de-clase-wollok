class Equipo {
	const property integrantes = []
	
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
}

// Esto se puede seguir mejorando en términos de repetición de lógica con más abstracciones
class ArmadorDeEquipos {
	const cazadores = []
	const golpeadores = []
	const guardianes = []
	const buscadores = []
	
	method integrantesAgregados() = cazadores + golpeadores + guardianes + buscadores
	
	method agregarBuscador(jugador){
		buscadores.add(jugador)
	}
	method agregarCazador(jugador){
		cazadores.add(jugador)
	}
	method agregarGolpeador(jugador){
		golpeadores.add(jugador)
	}
	method agregarGuardian(jugador){
		guardianes.add(jugador)
	}
	
	method cazadoresRequeridos() = 3
	method golpeadoresRequeridos() = 2
	method buscadoresRequeridos() = 1
	method guardianesRequeridos() = 1
	
	method armarEquipo(){
		self.validarCantidadJugadoresParaPosicion(self.cazadoresRequeridos(), cazadores)
		self.validarCantidadJugadoresParaPosicion(self.golpeadoresRequeridos(), golpeadores)
		self.validarCantidadJugadoresParaPosicion(self.guardianesRequeridos(), guardianes)
		self.validarCantidadJugadoresParaPosicion(self.buscadoresRequeridos(), buscadores)
		return new Equipo(integrantes = self.integrantesAgregados())
	}
	
	method validarCantidadJugadoresParaPosicion(cantidadEsperada, jugadoresParaPosicion){
		if(jugadoresParaPosicion.size() < cantidadEsperada)
			self.error("Cantidad insuficiente de jugadores para la posición indicada")
		if(jugadoresParaPosicion.size() > cantidadEsperada)
			self.error("Cantidad excesiva de jugadores para la posición indicada")
	}
}