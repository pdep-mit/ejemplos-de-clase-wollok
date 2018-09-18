object barraDeCereal {
	var nutrientes = 30
	
	method puntosQueAporta(persona){
		return nutrientes
	}
	
}

object eggos {
	var nutrientes = 12
	method puntosQueAporta(persona){
		return nutrientes
	}
}

object postrecitosDeChocolate{
	var nutrientesHerido = 7
	var nutrientesSano = 16
	
	method puntosQueAporta(persona){
		if (persona.estaHerido()){
			return nutrientesHerido
		}
		return nutrientesSano
	}
}