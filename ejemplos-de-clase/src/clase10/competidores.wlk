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
	method hambreQueProduce(posta){
		return posta.hambreQueProduce()
	}
	method puedeMontar(dragon){
	return dragon.permiteSerMontadoPor(self)
	}
	method montadoEn(dragon){
		if(!self.puedeMontar(dragon)){
			self.error("No se pudo montar al dragon")
		}
		return new Jinete(vikingo=self, dragon=dragon)
	}
	method comoLeConvieneParticipar(posta, dragones){
		/*Filtro los dragones que sí puedo montar */
		const dragonesQuePuedoMontar = dragones.filter({d => self.puedeMontar(d)})
		/*Creo todos los jinetes posibles a partir de los dragones que 
		 * si pude montar
		 */
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
		nivelDeHambre = 0.max(nivelDeHambre -item.hambreQueDisminuye())
	}
}

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
	method hambreQueProduce(posta) = 5
	
	// Algo que se planteó en clase, no necesariamente se ajusta al enunciado
	method puedeParticipar(posta) 
	  = vikingo.nivelDeHambre() < self.hambreQueProduce(posta)
}
