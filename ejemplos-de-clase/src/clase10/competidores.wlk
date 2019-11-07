class Vikingo{
	var property peso
	var property barbarosidad
	var property item
	var property velocidad
	var property nivelDeHambre
	
 	method cuantoPuedeCargar(){
 		return (peso/2) + (2*barbarosidad)
 	}
 	method danioQueProduce() = barbarosidad + item.danioQueProduce()
	method puedeParticipar(posta){
		return nivelDeHambre + posta.hambreQueProduce() < 100
	}
	
	method sufrirEfectoDe(posta){
		nivelDeHambre += self.hambreQueProduce(posta)
	}
	// Abstracción que generamos para poder redefinir sólo esto en patapez
	method hambreQueProduce(posta){
		return posta.hambreQueProduce()
	}
	
	method puedeMontar(dragon){
		return dragon.permiteSerMontadoPor(self)
	}
	
	method montadoEn(dragonAMontar){
		if(!self.puedeMontar(dragonAMontar)){
			self.error("No se pudo montar al dragon")
		}
		return new Jinete(vikingo = self, dragon = dragonAMontar)
	}
	
	/*
	 * A partir de los dragones que el vikingo puede montar, buscamos
	 * al mejor competidor para la posta considerando todos los jinetes
	 * que se pueden conseguir a partir del vikingo.
	 */
	method comoLeConvieneParticipar(posta, dragones){
		const dragonesQuePuedoMontar = dragones.filter({d => self.puedeMontar(d)})
		const jinetes = dragonesQuePuedoMontar.map({d => self.montadoEn(d)})
		
		/*Comparo cual de todas las versiones es mejor y retorno esa */
		return jinetes.fold(self, {mejorCompetidor, jinete => 
			if(posta.esMejor(mejorCompetidor, jinete)) mejorCompetidor
			else jinete
		})
	}
	
	method incrementarHambreEn(cantidad){
		nivelDeHambre += cantidad
	}
}

object patapez inherits Vikingo{
	override method puedeParticipar(posta){
		return nivelDeHambre < 50
	}
	override method hambreQueProduce(posta){
		return super(posta)*2
	}
	override method sufrirEfectoDe(posta){
		super(posta)
		self.comer()
	}
	method comer(){
		nivelDeHambre = 0.max(nivelDeHambre - item.hambreQueDisminuye())
	}
}

/*
 * Como los jinetes son posibles competidores, necesitamos que sean polimórficos
 * con los vikingos para las distintas postas
 */
class Jinete{
	var property dragon
	var property vikingo
	
	method velocidad(){
		return dragon.velocidad() - vikingo.peso()
	}
	method cuantoPuedeCargar(){
		return dragon.cuantoPuedeCargar() - vikingo.peso() 
	}
	method danioQueProduce(){
		return dragon.danioQueProduce() + vikingo.danioQueProduce()
	}
	method sufrirEfectosDe(posta){
		vikingo.incrementarHambreEn(self.hambreQueProduce(posta))
	}

	// Algo que se planteó en clase, no necesariamente se ajusta al enunciado
	method puedeParticipar(posta) 
	  = vikingo.nivelDeHambre() < self.hambreQueProduce(posta)
	  
	method hambreQueProduce(posta) = 5
}
