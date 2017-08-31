
class Jugador {
	var skills
	var peso
	var escoba

	constructor(unasSkills, unPeso, unaEscoba) {
		skills = unasSkills
		peso = unPeso
		escoba = unaEscoba
	}
	
	method nivelDeManejoDeEscoba() = skills / peso
	
	method velocidad() = self.nivelDeManejoDeEscoba() * escoba.velocidad() 

	method habilidad() = self.velocidad() + skills
	
	method lePasaElTrapoA(unJugador) =
		self.habilidad() > unJugador.habilidad() * 2 
		
	method skills() = skills
	
	method serGolpeado() {
		skills -= 2
		escoba.recibirGolpe()
	}
}

class Nimbus {
	var anioFabricacion
	var porcentajeDeSalud

	constructor(unAnioFabricacion) {
		anioFabricacion = unAnioFabricacion
		porcentajeDeSalud = 100
	}

	constructor(unAnioFabricacion, unPorcentajeDeSalud) {
		anioFabricacion = unAnioFabricacion
		porcentajeDeSalud = unPorcentajeDeSalud
	}

	method velocidad() = (80 - self.cantidadDeAniosDesdeFabricacion()) * porcentajeDeSalud/100

	method cantidadDeAniosDesdeFabricacion() = 2017 - anioFabricacion
	
	method salud() = porcentajeDeSalud
	
	method recibirGolpe() {
		porcentajeDeSalud -= 10
	}
}

object saetaDeFuego {
	method velocidad() = 100
	
	method recibirGolpe() {}
}
