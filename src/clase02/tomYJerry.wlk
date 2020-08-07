object tom {
	var property position // Para el juego
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
	
	method image() = "tom.png"  // Para el juego
}

object jerry {	
	var property position  // Para el juego
	var property velocidad = 1
	
	method atrapado(){
		velocidad = velocidad * 1.5
	}
	method peso() = 5
	
	method image() = "jerry.png"  // Para el juego
}

