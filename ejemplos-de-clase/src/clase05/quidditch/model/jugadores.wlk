object quaffle {
	var property quienLaTiene
}

class Cazador {
	const property punteria
	const property fuerza
	
	method habilidad() = self.punteria() * self.fuerza()
	
	method jugarContra(rival, equipo){
		if(self.tieneQuaffle()){
			self.intentarMeterGol(rival, equipo)
			self.perderQuaffle(rival)
		}
	}
	
	method perderQuaffle(rival){
		rival.obtenerQuaffle()
	}
	method tieneQuaffle() = quaffle.quienLaTiene() == self
		
	method intentarMeterGol(rival, equipo){
		if(self.evitarBloqueo(rival)){
			equipo.sumarPuntos(10)
		}
	}
	
	method evitarBloqueo(rival) = !rival.puedeBloquear(self)
	
	method capazDeBloquear() = true
	
	method puedeTenerQuaffle() = true
	
	method obtenerQuaffle(){
		quaffle.quienLaTiene(self)
	}
	
	method esBlancoUtil() = self.tieneQuaffle()
	method recibirGolpe(rival){
		self.perderQuaffle(rival)
	}
}

class Guardian {
	const property reflejos
	method habilidad() = self.reflejos() * 3
	
	method jugarContra(rival, equipo){
		// No hace nada
	}
	
	method capazDeBloquear() = true
	
	method puedeTenerQuaffle() = false
	
	method obtenerQuaffle(){}
	
	method esBlancoUtil() = false
}

class Golpeador {
	const property punteria
	const property fuerza
	
	method habilidad() = self.punteria() + self.fuerza()
	
	method jugarContra(rival, equipo){
		const jugadorGolpeado = self.elegirJugadorParaGolpear(rival)
		jugadorGolpeado.recibirGolpe(equipo)
	}
	
	method elegirJugadorParaGolpear(rival) = rival.blancoUtil()
	
	method capazDeBloquear() = true
	
	method puedeTenerQuaffle() = false
	
	method obtenerQuaffle(){}
	
	method esBlancoUtil() = false
}

class Buscador {
	const property reflejos
	const property vision
	var property distanciaSnitch = 1000
	
	method habilidad() = self.reflejos() * self.vision()
	
	method jugarContra(rival, equipo){
		self.perseguirSnitch()		
		if(distanciaSnitch == 0)
			equipo.sumarPuntos(150)
	}
	
	method perseguirSnitch(){
		distanciaSnitch = 0.max(distanciaSnitch - self.habilidad())
	}
	
	method capazDeBloquear() = false
	
	method puedeTenerQuaffle() = false
	
	method obtenerQuaffle(){}
	
	method esBlancoUtil() = true
	
	method recibirGolpe(rival){
		distanciaSnitch = distanciaSnitch + (25 - reflejos).max(0)
	}
}
