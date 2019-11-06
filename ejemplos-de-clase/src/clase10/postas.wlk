class Posta {
	var property competidores 
	method esMejor(competidor1, competidor2)
	
	method jugarse(participantes, dragones){
		self.inscribir(participantes)
		self.ordenarResultados()
		self.generarEfectoSobreCompetidores()
	}
	method inscribir(participantes, dragones){
		/*Podrian ser vikingos o jinetes */
		competidores = participantes.map({p => p.comoLeConvieneParticipar(self, dragones)}).
		filter({p => p.puedeParticipar(self)})
		 	
	}
	method ordenarResultados(){
		competidores.sortBy({mejor, peor => self.esMejor(mejor, peor)})
	}
	method generarEfectoSobreCompetidores(){
		competidores.forEach({c => c.sufrirEfectosDe(self)})
	}
}	

class PostaDePesca inherits Posta{
	override method esMejor(competidor1, competidor2){
		return competidor1.cuantoPuedeCargar() > competidor2.cuantoPuedeCargar()
	}
	method hambreQueProduce() = 5
}

class PostaDeCombate inherits Posta{
	override method esMejor(competidor1, competidor2){
		return competidor1.danioQueProduce() > competidor2.danioQueProduce()
	}
	method hambreQueProduce()= 10
}

class PostaDeCarrera inherits Posta{
	var property kmsQueCorrer
	override method esMejor(competidor1, competidor2){
		return competidor1.velocidad() > competidor1.velocidad()
		}
	method hambreQueProduce() = kmsQueCorrer
}