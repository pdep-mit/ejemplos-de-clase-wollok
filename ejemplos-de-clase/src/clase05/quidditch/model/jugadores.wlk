class Cazador {
	const property punteria
	const property fuerza
	var tieneQuaffle = false
	
	method habilidad() = self.punteria() * self.fuerza()
	
	method jugarContra(rival, equipo){
		if(tieneQuaffle){
			self.intentarMeterGol(rival, equipo)
			self.perderQuaffle(rival)
		}
	}
	
	method perderQuaffle(rival){
		tieneQuaffle = false
		rival.obtenerQuaffle()
	}
		
	method intentarMeterGol(rival, equipo){
		if(self.evitarBloqueo(rival)){
			equipo.sumarPuntos(10)
		}
	}
	
	method evitarBloqueo(rival) = !rival.puedeBloquear(self)
	
	method capazDeBloquear() = true
	
	method puedeTenerQuaffle() = true
	
	method obtenerQuaffle(){
		tieneQuaffle = true
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
}

class Golpeador {
	const property punteria
	const property fuerza
	
	method habilidad() = self.punteria() + self.fuerza()
	
	method jugarContra(rival, equipo){
		
	}
	
	method capazDeBloquear() = true
	
	method puedeTenerQuaffle() = false
	
	method obtenerQuaffle(){}
}

class Buscador {
	const property reflejos
	const property vision
	var property distanciaSnitch = 1000
	
	method habilidad() = self.reflejos() * self.vision()
	
	method jugarContra(rival, equipo){
		distanciaSnitch -= self.habilidad()
		
		if(distanciaSnitch == 0)
			equipo.sumarPuntos(150)
	}
	
	method perseguirSnitch(){
		distanciaSnitch = 0.max(distanciaSnitch - self.habilidad())
	}
	
	method capazDeBloquear() = false
	
	method puedeTenerQuaffle() = false
	
	method obtenerQuaffle(){}
}
