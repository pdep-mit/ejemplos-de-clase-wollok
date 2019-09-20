import model.jugadores.*

object agregadorDeJugadores {
	method agregarGuardian(armadorDeEquipos){
		armadorDeEquipos.agregarGuardian(new Guardian(reflejos = 7))
	}
	method agregarBuscador(armadorDeEquipos){
		armadorDeEquipos.agregarBuscador(new Buscador(reflejos = 7, vision = 3))
	}
	method agregarCazador(armadorDeEquipos){
		armadorDeEquipos.agregarCazador(new Cazador(punteria = 3, fuerza = 5))
	}
	method agregarGolpeador(armadorDeEquipos){
		armadorDeEquipos.agregarGolpeador(new Golpeador(punteria = 7, fuerza = 3))
	}
	
	method agregarTodosLosJugadoresNecesarios(armadorDeEquipos){
		self.agregarCazadores(armadorDeEquipos)
		self.agregarGolpeadores(armadorDeEquipos)
		self.agregarBuscador(armadorDeEquipos)
		self.agregarGuardian(armadorDeEquipos)
	}
	
	method agregarCazadores(armadorDeEquipos){
		self.agregarCazador(armadorDeEquipos)
		self.agregarCazador(armadorDeEquipos)
		self.agregarCazador(armadorDeEquipos)
	}
	method agregarGolpeadores(armadorDeEquipos){
		self.agregarGolpeador(armadorDeEquipos)
		self.agregarGolpeador(armadorDeEquipos)
	}
}
