import ninios.*

object barraDeCereal {
	method puntosQueAportaPara(persona){
		return 30
	}
}

object eggos {
	method puntosQueAportaPara(persona){
		return 12
	}
}

object postrecitoDeChocolate{
	method puntosQueAportaPara(persona){
		if ( persona.estaHerido() ){
			return 7
		}
		return 16
	}
}