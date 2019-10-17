import estadio.*

class Pokemon{	
	var property hambre = 20	
	var especie 

	method felicidad() = 0.max(self.alegria() - hambre)
	
	method alegria() = especie.alegria()
	
	method comerBaya(){
		self.restarHambre(1)
	}
	
	method restarHambre(cantidad){
		hambre = 0.max(hambre - cantidad)
	}
	
	method evolucionar(){
		if(self.puedeEvolucionar()){
			especie = especie.evolucion()
		} else {
			self.error("El pokemon no puede evolucionar")
		}
	}
	
	method puedeEvolucionar() = self.felicidad() > 5 && especie.tieneEvolucion()
	
	method usoDeHabilidad() { 
		especie.usoDeHabilidad(self)
	}
	
	method aumentarHambre(cantidad){
		hambre += cantidad
	}	
	method especie() = especie
}

// Especies de pokemon

class Charmander {
	method usoDeHabilidad(pokemon){
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(1)
	}
	
	method evolucion() = new Charmeleon()
	
	method tieneEvolucion() = true

	method alegria() = estadio.sensacionTermica()
	
}

class Squirtle {
	method alegria(){
		if(estadio.estaLloviendo()){
			return 7
		}else{
			return 3
		}
	}
	
	method usoDeHabilidad(pokemon){
		estadio.llover()
		pokemon.aumentarHambre(3)
	}
	
	// TODO: falta implementar
	// method evolucion() = ...
	
	method tieneEvolucion() = true
}

class Bulbasaur {
	var property vecesQueObtuvoEnergiaDelSol = 0
	
	method usoDeHabilidad(pokemon){
		vecesQueObtuvoEnergiaDelSol += 1
		
		if(estadio.estaLloviendo()){
			pokemon.restarHambre(1)
		}
		
		else{
			pokemon.restarHambre(10)
		}
	}
	
	method alegria() = 3 * vecesQueObtuvoEnergiaDelSol
	
	// TODO: falta implementar
	// method evolucion() = ...
	
	method tieneEvolucion() = true
}


// Especie a la que puede evolucionar un charmander
class Charmeleon {
	method alegria() = 5 + ( estadio.temperatura() / 2 )
	
	method usoDeHabilidad(pokemon){
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(2)
	}
	
	method evolucion() {
		self.error("No tengo evolucion")
	}
	
	method tieneEvolucion() = false
}
