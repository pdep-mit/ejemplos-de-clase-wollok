import equiposDeQuidditch.*

class PosicionACubrir {
	const property nombrePuesto
	const property cantidadRequerida
	const property jugadores = []
	
	method agregar(jugador){
		jugadores.add(jugador)
	}
	
	method validarCompletitud(){
		if(jugadores.size() < cantidadRequerida)
			self.error("Cantidad insuficiente de jugadores para la posición: " + nombrePuesto)
		if(jugadores.size() > cantidadRequerida)
			self.error("Cantidad excesiva de jugadores para la posición: " + nombrePuesto)
	}
	
	method jugadoresFaltantes() = 0.max(cantidadRequerida - jugadores.size())
}
class ArmadorDeEquipos {
	const property cazadores = new PosicionACubrir(nombrePuesto = "Cazador", cantidadRequerida = 3)
	const property golpeadores = new PosicionACubrir(nombrePuesto = "Golpeador", cantidadRequerida = 2)
	const property guardianes = new PosicionACubrir(nombrePuesto = "Guardian", cantidadRequerida = 1)
	const property buscadores = new PosicionACubrir(nombrePuesto = "Buscador", cantidadRequerida = 1)
	
	method posicionesACubrir() = [cazadores, golpeadores, guardianes, buscadores]
	
	method integrantesAgregados() 
		= self.posicionesACubrir().flatMap {posicion => posicion.jugadores()}
	
	method agregarBuscador(jugador){ buscadores.agregar(jugador) }
	method agregarCazador(jugador){ cazadores.agregar(jugador) }
	method agregarGolpeador(jugador){ golpeadores.agregar(jugador) }
	method agregarGuardian(jugador){ guardianes.agregar(jugador) }
	
	method armarEquipo(){
		self.posicionesACubrir()
				.forEach {posicion => posicion.validarCompletitud()}
		return new Equipo(integrantes = self.integrantesAgregados())
	}
}