import estadio.*

// La primer parte se puede resolver, pero no se puede hacer evolucionar un pokemon
// con este modelo porque si se instancia un Charmander, ese objeto va a ser de clase
// Charmander siempre. No es válido crear un pokemon nuevo de otra especie, setteándole
// el hambre del original y hacer de cuenta que es el mismo pokemon, porque el entrenador
// (y cualquier otro que conociera al original), va a seguir referenciando al pokemon
// sin haber evolucionado.
class Pokemon {
	var property hambre = 20
	
	method felicidad() = 0.max(self.alegria() - hambre)
	
	method alegria()
	
	method comerBaya(){
		self.restarHambre(1)
	}
	
	method usoDeHabilidad()
	
	method restarHambre(cantidad){
		hambre = 0.max(hambre - cantidad)
	}
	
	method aumentarHambre(cantidad){
		hambre += cantidad
	}
	
}


class Charmander inherits Pokemon {
	
	override method usoDeHabilidad(){
		estadio.aumentarTemperatura(3)
		self.aumentarHambre(1)
	}
	

	override method alegria() = estadio.sensacionTermica()
	
}

class Squirtle inherits Pokemon {
	
	override method alegria(){
		if(estadio.estaLloviendo()){
			return 7
		}else{
			return 3
		}
	}
	
	override method usoDeHabilidad(){
		estadio.llover()
		self.aumentarHambre(3)
	}
	
}

class Bulbasaur inherits Pokemon {
	var property vecesQueObtuvoEnergiaDelSol = 0
	
	override method usoDeHabilidad(){
		
		vecesQueObtuvoEnergiaDelSol += 1
		
		if(estadio.estaLloviendo()){
			self.restarHambre(1)
		}
		
		else{
			self.restarHambre(10)
		}
		
	}
	
	override method alegria() = 3 * vecesQueObtuvoEnergiaDelSol
	
}

