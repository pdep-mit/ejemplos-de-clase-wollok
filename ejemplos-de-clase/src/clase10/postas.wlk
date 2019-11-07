class Posta {
	var property competidores 
	method esMejor(competidor1, competidor2)
	
	method jugarse(participantes, dragonesDisponibles){
		self.inscribir(participantes, dragonesDisponibles)
		self.ordenarResultados()
		self.generarEfectoSobreCompetidores()
	}
	
	// La inscripción debería producir un efecto sobre la colección
	// de dragones disponibles, para que no lo pueda elegir otro vikingo.
	// Habría que replantear la lógica un poco más para cumplir la consigna.
	method inscribir(participantes, dragonesDisponibles){
		/*Podrian ser vikingos o jinetes */
		competidores = participantes.map({p => 
			p.comoLeConvieneParticipar(self, dragonesDisponibles)
		}).filter({p => 
			p.puedeParticipar(self)
		})
		 	
	}
	
	// Se usa sortBy que produce un efecto sobre el conjunto de competidores
	// dejándolo ordenado en base al criterio indicado
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