import recursos.*

class Edificio {
	var danio = 0
	var property duenio
	
	const property tipoEdificio
	var estadoEdificio = normal
	
	method danio() = danio
	
	method duenio(nuevoDuenio){
		duenio = nuevoDuenio
		nuevoDuenio.agregarEdificio(self)
	}
	
	method destruir(){
		estadoEdificio = destruido
	}
	
	// XXX PUNTO DE ENTRADA Punto 4
	method estaEnBuenEstado() {
		return self.resistencia() >= self.resistenciaMaxima() * 0.5
	}
	
	method resistencia() {
		return (self.resistenciaMaxima() - self.danio()).max(0)
	}
	
	method resistenciaMaxima() {
		return estadoEdificio.resistenciaMaxima(tipoEdificio)
	}
	
	// XXX PUNTO DE ENTRADA Punto 6
	method activarPoderContra(equipo){
		estadoEdificio.activarPoderDeEdificioContra(self, equipo)
	}
	
	method recibirAtaque(){
		var danioARecibir = 100
		if(! self.estaEnBuenEstado()){
			danioARecibir = danioARecibir * 100
		}
		
		self.recibirDanio(danioARecibir)
	}
	
	method recibirDanio(cantidad) {
		danio += cantidad
		
		if(self.resistencia() == 0){
			self.destruir()
		}
	}

	method reparar(cantidad){
		danio = (danio - cantidad).max(0)
	}
		
	method producirRecurso(recurso){
		duenio.aumentarRecurso(recurso)
	}
	
	method convertidoPor(jugador){
		duenio.perderEdificio(self)
		self.duenio(jugador)
	}
	
	
	method convieneAtacarlo() = estadoEdificio.convieneAtacar(self)
	
	method convertible() = estadoEdificio.convertible(self)
	
	// XXX PUNTO DE ENTRADA Punto 7
	method mejorar(){
		estadoEdificio.validarMejora(self)
		self.duenio().gastarRecursos(tipoEdificio.costoDeMejora())
		estadoEdificio = mejorado
		self.reparar(self.danio())
	}
}

class NoSePuedeMejorar inherits Exception {}

object destruido {
	method resistenciaMaxima(tipoEdificio) = 0
	method activarPoderDeEdificioContra(edificio, equipo){
		//No produce ningún efecto
	}
	
	method convieneAtacar(edificio) = false
	method convertible(edificio) = false
	
	method validarMejora(){
		throw new NoSePuedeMejorar(message = "Los edificios destruidos no pueden ser mejorados")
	}
}

class Usable {
	method resistenciaMaxima(tipoEdificio) =
		self.recursosQueAportanResistencia(tipoEdificio)
			.sum({recurso => recurso.resistenciaQueAporta() })
	
	method activarPoderDeEdificioContra(edificio, equipo){
		edificio.tipoEdificio().activarPoderDeEdificioContra(edificio, equipo)
	}
	
	method convieneAtacar(edificio) 
		= ! edificio.estaEnMalEstado() || edificio.tipoEdificio().convieneAtacar() 
		
	method convertible(edificio) = edificio.tipoEdificio().convertible()
	
	method validarMejora(){
		// En principio, nada impide mejorarlo
	}
	method recursosQueAportanResistencia(tipoEdificio)
}

object normal inherits Usable{
	override method recursosQueAportanResistencia(tipoEdificio){
		return tipoEdificio.recursosDeConstruccion()
	}
}

object mejorado inherits Usable {
	override method validarMejora(){
		throw new NoSePuedeMejorar(message = "Los edificios mejorados no pueden ser mejorados nuevamente")
	}
	override method convertible(edificio) = false
	
	override method resistenciaMaxima(resistenciaMaximaBase) = resistenciaMaximaBase
	
	override method recursosQueAportanResistencia(tipoEdificio){
		return tipoEdificio.recursosDeMejora()
	}
}


class TipoDeEdificio {
	method convieneAtacar() = false
	method convertible() = true
	
	method recursosDeConstruccion()
	method activarPoderDeEdificioContra(edificio, equipo)
	
	method recursosDeMejora()
		= self.recursosDeConstruccion().map({recurso =>
			new Recurso(
				tipoDeRecurso = recurso.tipoDeRecurso(),
				cantidad = recurso.cantidad() * 1.5
			)
		})
}

object galeriaDeTiro inherits TipoDeEdificio {
	override method recursosDeConstruccion() = [
		new Recurso(tipoDeRecurso = oro, cantidad = 1000),
		new Recurso(tipoDeRecurso = madera, cantidad = 500),
		new Recurso(tipoDeRecurso = comida, cantidad = 350)
		]
		
	override method activarPoderDeEdificioContra(edificio, equipo){
		equipo.edificioConvenienteParaAtacar().recibirAtaque()
	}
	
}

object fuerte inherits TipoDeEdificio {
	override method recursosDeConstruccion() = [
		new Recurso(tipoDeRecurso = oro, cantidad = 2000),
		new Recurso(tipoDeRecurso = madera, cantidad = 300),
		new Recurso(tipoDeRecurso = comida, cantidad = 250)
		]
		
	override method activarPoderDeEdificioContra(edificio, equipo){
		if(edificio.estaEnBuenEstado()){
			edificio.producirRecurso(new Recurso(
				tipoDeRecurso =	comida, 
				cantidad = 500
			))
		} else {
			edificio.reparar(20)
		}
	}
}

object templo inherits TipoDeEdificio {
	override method recursosDeConstruccion() = [
		new Recurso(tipoDeRecurso = oro, cantidad = 8000),
		new Recurso(tipoDeRecurso = piedra, cantidad = 750),
		new Recurso(tipoDeRecurso = comida, cantidad = 500)
		]
	override method activarPoderDeEdificioContra(edificio, equipo){
		equipo.edificioConvertible().convertidoPor(edificio.duenio())
	}
	
	override method convieneAtacar() = true
	override method convertible() = false 
}