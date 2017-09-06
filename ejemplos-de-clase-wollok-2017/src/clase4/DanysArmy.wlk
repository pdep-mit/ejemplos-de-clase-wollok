
object dany {
	var dragones = [ ]
	var soldados = [ ]

	method agregarDragon(_dragon) {
		dragones.add(_dragon)
	}

	method agregarSoldado(_soldado) {
		soldados.add(_soldado)
	}
	
	method seguidores() = soldados + dragones
	
	method darDiscurso() {
		self.seguidores().forEach({seguidor => 
			seguidor.escucharDiscurso()
		})
	}
	
	method trueQueen() {
		return soldados.all({soldado => 
			soldado.motivacion() > 100
		})
	}
	method puedeCombatir() {
		return self.puedeLanzarAtaqueAereo() ||
				self.fuerzaEjercito() > 10000
	}
	method puedeLanzarAtaqueAereo() {
		return dragones.any({dragon => 
			dragon.puedeAtacar()
		})
	}
	
	method fuerzaEjercito() {
		return soldados.sum({soldado =>
			soldado.fuerza()
		})
	}
	method kamikazes() {
		return soldados.filter({soldado =>
			soldado.kamikaze()
		})
	}
	method lanzarAtaqueAereo(enemigo) {
		var dragon = dragones.find(
			{dragon => dragon.puedeAtacar()}
		)
		dragon.atacar(enemigo) 
	}

}

class Caballero {
	var motivacion
	var romantico

	constructor(_motivacion, _romantico) {
		motivacion = _motivacion
		romantico = _romantico
	}
	
	method motivacion() = motivacion
	method kamikaze() = romantico
	
	method fuerza() = motivacion * 3
	
	method escucharDiscurso(){
		if(romantico)
			motivacion += 70
		else
			motivacion += 30
	}
}

class ExEsclavo {
	var motivacion
	var odioAlExAmo

	constructor(_motivacion, _odioAlExAmo) {
		motivacion = _motivacion
		odioAlExAmo = _odioAlExAmo
	}
	
	method motivacion() = motivacion
	method kamikaze() = odioAlExAmo > 20
	method fuerza() = motivacion + odioAlExAmo
	
	method escucharDiscurso(){
		motivacion += 20
	}
}

class ExMercenario {
	var motivacion

	constructor(_motivacion) {
		motivacion = _motivacion
	}
	
	method motivacion() = motivacion
	method kamikaze() = true
	method fuerza() = motivacion + 50
	
	method escucharDiscurso(){
		motivacion += 10
	}
}

class Dragon {
	var felicidad
	var altura
	var potenciaDeFuego

	constructor(_felicidad, _altura, _potenciaDeFuego) {
		felicidad = _felicidad 
		altura = _altura 
		potenciaDeFuego = _potenciaDeFuego
	}
	
	method felicidad() = felicidad
	
	method puedeAtacar() = self.esFeliz()
		 && self.esAdulto()
		 
	method esFeliz() = felicidad > 50
	
	method esAdulto() = altura > 15
		 && potenciaDeFuego >= 10
		 
	method atacar(enemigo){
		enemigo.recibirAtaqueAereo()
		felicidad += 20
	}
	
	method escucharDiscurso(){
		felicidad += 40
	}
}

class EjercitoEnemigo {
	var soldados
	
	constructor(_soldados){
		soldados = _soldados
	}
    
    method soldados() = soldados
    
    method recibirAtaqueAereo() {
    	soldados = soldados.sortedBy({fuerte, debil => 
    		fuerte.fuerza() > debil.fuerza()
    	}).take((soldados.size()/2).roundUp())
    }
}