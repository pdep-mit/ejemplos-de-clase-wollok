object tom {
	var property energia = 80
	
	// TODO: Falta implementar
	method velocidad() = 0
	
	method comer(raton){
		// TODO algo que produzca el efecto deseado
		self.error("Falta implementar comer un ratón")
	}
	
	method correr(segundos){
		// TODO algo que produzca el efecto deseado
		self.error("Falta implementar correr x segundos")
	}
	
	// TODO: Falta implementar
	method convieneCorrerRatonA(raton, distanciaEnMetros) = false
}

object jerry {	
	var property velocidad = 1
	
	method acelerar(){
		velocidad = velocidad * 1.5
	}
	method peso() = 5
}

