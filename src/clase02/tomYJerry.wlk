object tom {
	// TODO: La velocidad de tom es 5 metros/seg + (energia medida en joules / 10).
	method velocidad() = 0
	
	// TODO: Debería ser la energía de tom, medida en joules
	method energia() = 0
	
	// Cuando tom come un ratón, su energía aumenta en 
	// (12 joules + el peso del ratón en gramos).
	method comer(raton){
		// TODO algo que produzca el efecto deseado
	}
	
	// Cuando tom corre durante unos segundos, su energía disminuye en 
	// (0.5 x cantidad de metros que corrió) en ese tiempo.
	// La velocidad que se toma es la que corresponde a la energía de 
	// Tom antes de empezar a correr, y no varía durante una carrera.
	method correr(segundos){
		// TODO algo que produzca el efecto deseado
	}
	
	// TODO: Devuelve true si la energía que gana por comer al ratón es mayor a 
	// la que consume corriendo la distancia, que está medida en metros.
	method convieneComerRatonA(raton, distanciaEnMetros) = false
}

object jerry {
	method peso() = 5
}
