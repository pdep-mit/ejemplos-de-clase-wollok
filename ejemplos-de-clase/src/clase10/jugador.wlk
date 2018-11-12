import recursos.*
import edificios.*

class Jugador {
	// No se aclaran cantidades iniciales,
	// le pongo algo de oro como para que tenga con qué arrancar a explotar
	const property recursos = [
		new Recurso(tipoDeRecurso = oro, cantidad = 1000),
		new Recurso(tipoDeRecurso = madera),
		new Recurso(tipoDeRecurso = comida),
		new Recurso(tipoDeRecurso = piedra)
	]
	const property equipo
	const property edificios = #{}
	
	constructor(unEquipo){
		equipo = unEquipo
		equipo.agregarJugador(self)
	}
		
	/*
	 * RECURSOS
	 */
	 
	// XXX PUNTO DE ENTRADA Punto 1
	method explotarFuenteDeRecursoNatural(fuenteDeRecursoNatural){
		self.gastarOro(50)
		self.aumentarRecurso(
			fuenteDeRecursoNatural.recursoQueAporta(),
			fuenteDeRecursoNatural.cantidadDeRecursoQueAporta()
		)
		fuenteDeRecursoNatural.consecuenciasDeExplotacion()
	}

	// Si nos queremos abstraer de la idea de recursos, se puede
	method gastarOro(cantidad){
		self.gastarRecurso(oro, cantidad)
	}
	
	method gastarRecurso(tipoDeRecurso, cantidad){
		self.recursoDeTipo(tipoDeRecurso).gastar(cantidad)
	}
	
	method aumentarRecurso(tipoDeRecurso, cantidad){
		self.recursoDeTipo(tipoDeRecurso).aumentar(cantidad)
	}
	
	method gastar(unRecurso){
		self.gastarRecurso(unRecurso.tipoDeRecurso(), unRecurso.cantidad())
	}
	method aumentar(unRecurso){
		self.aumentarRecurso(unRecurso.tipoDeRecurso(), unRecurso.cantidad())
	}
	
	method cantidadDeRecurso(tipoDeRecurso)
		= self.recursoDeTipo(tipoDeRecurso).cantidad()
		
	method recursoDeTipo(tipoDeRecurso)
		= self.recursos().find({recurso => 
			recurso.tipoDeRecurso() == tipoDeRecurso
		})
		
	method quedarseSinRecursos(){
		self.recursos().forEach {recurso => recurso.vaciar()}
	}
	
	method seQuedoSinRecursos() =
		self.recursos().all({recurso => recurso.vacio()})
		
	// En caso de tener que gastar varios recursos a la vez,
	// validar que alcanzan todos antes de gastarlos
	method gastarRecursos(recursosAGastar){
		recursosAGastar.forEach({recursoAGastar =>
			self.recursoDeTipo(recursoAGastar.tipoDeRecurso())
				.validarCantidadSuficienteParaGastar(recursoAGastar.cantidad())
		})
		
		recursosAGastar.forEach({recurso => self.gastar(recurso)})
	}
	
	/*
	 * PARTIDA
	 */
	 
	// XXX PUNTO DE ENTRADA Punto 2
	method rendirse(){
		const totalAliados = self.aliadosEnPie().size()
		self.aliadosEnPie().forEach {aliado =>
			self.recursos().forEach { recurso => 
				aliado.aumentarRecurso(
					recurso.tipoDeRecurso(),
					recurso.cantidad() / totalAliados
				)
			}
		}
		self.quedarseSinRecursos()
		self.destruirEdificios()
	}
	
	method aliadosEnPie() = self.equipo().aliadosEnPie(self)
	
	method sigueEnPie() = ! self.seQuedoSinRecursos()
	
	/*
	 * EDIFICIOS
	 */
	 
	method destruirEdificios(){
		self.edificios().forEach {edificio => edificio.destruir()}
	}
	
	method cantidadDeEdificiosConstruidos() = self.edificios().size()
	
	// XXX PUNTO DE ENTRADA Punto 5
	method construirEdificio(tipoDeEdificio){
		self.gastarRecursos(tipoDeEdificio.recursosDeConstruccion())
		const edificio = new Edificio(duenio = self, tipoEdificio = tipoDeEdificio)
		self.agregarEdificio(edificio)
	}
	

	method perderEdificio(unEdificio){
		self.edificios().remove(unEdificio)
	}
	
	method agregarEdificio(unEdificio){
		self.edificios().add(unEdificio)
	}
}
