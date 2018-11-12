class Equipo {
	var property jugadores = #{}
	
	method agregarJugador(unJugador){
		jugadores.add(unJugador)
	}
	
	method aliadosEnPie(unJugador){
		return self.aliados(unJugador).filter({aliado =>
			aliado.sigueEnPie()
		})
	}
	
	method aliados(unJugador) =
		self.jugadores().filter({aliado => aliado != unJugador})
		
	// XXX PUNTO DE ENTRADA Punto 3a
	method fueDerrotado() =
		self.jugadores().all({jugador => jugador.seQuedoSinRecursos()})
		
	// XXX PUNTO DE ENTRADA Punto 3b
	method cantidadDeEdificiosConstruidos() =
		self.jugadores().sum({jugador => jugador.cantidadDeEdificiosConstruidos()})
		
	method edificioConvenienteParaAtacar() = self.edificios().find({edificio =>
		edificio.convieneAtacarlo()
	})
	
	method edificioConvertible() = self.edificios().find({edificio =>
		edificio.convertible()
	})
	
	method edificios() {
		return self.jugadores().flatMap({jugador => jugador.edificios()})
		//equivalente a:
		//return self.jugadores().map({jugador => jugador.edificios()}).flatten
		//return self.jugadores().fold(#{}, {edificios, jugador => edificios.union(jugador.edificios())}
	}
	
}
