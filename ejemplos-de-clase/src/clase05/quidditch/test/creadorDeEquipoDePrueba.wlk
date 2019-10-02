import model.armadoDeEquipo.*
import agregadorDeJugadores.*

object creadorDeEquipoDePrueba {
	method crearEquipo(){
		const armadorDeEquipos = new ArmadorDeEquipos()
		agregadorDeJugadores.agregarTodosLosJugadoresNecesarios(armadorDeEquipos)
		return armadorDeEquipos.armarEquipo()
	}
	
	method crearEquipoCon(bloqueParaElArmador){
		const armadorDeEquipos = new ArmadorDeEquipos()
		bloqueParaElArmador.apply(armadorDeEquipos)
		agregadorDeJugadores.agregarTodosLosJugadoresNecesarios(armadorDeEquipos)
		return armadorDeEquipos.armarEquipo()
	}
	
	method crearEquipoConBuscador(buscador) =
		self.crearEquipoCon({armador => armador.agregarBuscador(buscador)})
	
	method crearEquipoConCazador(cazador) =
		self.crearEquipoCon({armador => armador.agregarCazador(cazador)})
		
	method crearEquipoConGolpeador(golpeador) =
		self.crearEquipoCon({armador => armador.agregarGolpeador(golpeador)})
		
	method crearEquipoConGuardian(guardian) =
		self.crearEquipoCon({armador => armador.agregarGuardian(guardian)})
}