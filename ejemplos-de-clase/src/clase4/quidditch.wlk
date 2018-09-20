class Jugador {
	var skills
	var peso
	var escoba = saetaDeFuego
	
	method skills() = skills
	
	method nivelDeManejoDeEscoba(){
		return skills / peso
	}
	
	method velocidad(){
		return escoba.velocidad() * self.nivelDeManejoDeEscoba()
	}
	
	method habilidad(){
		return self.velocidad() + skills
	}
	
	method lePasaElTrapoA(otroJugador) {
		return self.habilidad() >= otroJugador.habilidad() * 2
	}
	
	method recibirGolpe(){
		skills -= 2
		escoba.recibirGolpe()
	}
}

// Podría ser una clase en vez de un object también.
// No hay necesidad de que sea una única instancia,
// pero tampoco es un problema que lo sea ya que no tiene
// un estado que pueda diferir entre las distintas saetas.
// Lo dejamos como object por simplicidad nada más, a sabiendas
// de que si en el futuro eso cambia, tendríamos que cambiar
// object saetaDeFuego por class SaetaDeFuego, y agregar las instanciaciones
// que correspondan.
object saetaDeFuego {
	method velocidad() = 100
	
	method recibirGolpe(){
		// No pasa nada
	}
}

class Nimbus {
	var salud = 100
	const anioFabricacion = 2000
	
	method salud() = salud
	
	method velocidad() = (80 - self.vejez()) * salud / 100
	
	method vejez() = new Date().year() - anioFabricacion
	
	method recibirGolpe(){
		salud -= 10.min(salud)
	}
}
