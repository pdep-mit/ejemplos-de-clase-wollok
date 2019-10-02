import model.jugadores.*
import model.equiposDeQuidditch.*
import model.armadoDeEquipo.*

object agregadorDeJugadores {
	method agregarGuardian(armadorDeEquipos){
		armadorDeEquipos.agregarGuardian(new Guardian(reflejos = 1))
	}
	method agregarBuscador(armadorDeEquipos){
		armadorDeEquipos.agregarBuscador(new Buscador(reflejos = 1, vision = 1))
	}
	method agregarCazador(armadorDeEquipos){
		armadorDeEquipos.agregarCazador(new Cazador(punteria = 1, fuerza = 1))
	}
	method agregarGolpeador(armadorDeEquipos){
		armadorDeEquipos.agregarGolpeador(new Golpeador(punteria = 1, fuerza = 1))
	}
	
	method agregarTodosLosJugadoresNecesarios(armadorDeEquipos){
		self.agregarCazadores(armadorDeEquipos)
		self.agregarGolpeadores(armadorDeEquipos)
		self.agregarBuscadores(armadorDeEquipos)
		self.agregarGuardianes(armadorDeEquipos)
	}
	
	method agregarCazadores(armadorDeEquipos){
		self.completarPosicion(armadorDeEquipos.cazadores(), 
			{self.agregarCazador(armadorDeEquipos)}
		)
	}
	method agregarGolpeadores(armadorDeEquipos){
		self.completarPosicion(armadorDeEquipos.golpeadores(), 
			{self.agregarGolpeador(armadorDeEquipos)}
		)
	}
	method agregarBuscadores(armadorDeEquipos) {
		self.completarPosicion(armadorDeEquipos.buscadores(), 
			{self.agregarBuscador(armadorDeEquipos)}
		)
	}
	method agregarGuardianes(armadorDeEquipos) {
		self.completarPosicion(armadorDeEquipos.guardianes(), 
			{self.agregarGuardian(armadorDeEquipos)}
		)
	}
	
	method completarPosicion(posicionACubrir, completarCon){
		posicionACubrir.jugadoresFaltantes().times({n => completarCon.apply()})
	}
}
