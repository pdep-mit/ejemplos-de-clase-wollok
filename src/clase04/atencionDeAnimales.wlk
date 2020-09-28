// TODO: Atención de animales - punto de entrada
// Opción 1: dispositivo.atender(animal)
// Opción 2: animal.atenderseEn(dispositivo)

/////////////////////////////////////
/// Animales
/////////////////////////////////////

/////////////////
// tieneSed()
// tieneHambre()
// peso()
/////////////////

class Vaca {
	var property peso
	var property tieneSed = false
	method tieneHambre() = peso < 200
	
	// TODO: Atención de animales
	// Su peso cambia cuando come y bebe. 
	// Si come le da sed, si bebe se le va.
}

class Cerdo {
	var property peso
	var property tieneHambre = false
	var vecesQueComioSinBeber = 0
	
	method tieneSed()
		= vecesQueComioSinBeber > 3
    
	// TODO: Atención de animales
	// Comer y beber impacta al peso y al hambre.
	// Nos interesa saber cuántas veces comió sin beber.
}

class Gallina {
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	
	// TODO: Atención de animales
	// Cuando come y bebe no se observa ningún cambio.
}

/////////////////////////////////////
/// Dispositivos
/////////////////////////////////////

///////////////////////////////
// esUtilParaAtender(animal)
///////////////////////////////

class Bebedero {
	method esUtilParaAtender(animal) =
		animal.tieneSed()	
		
	// TODO: Atención de animales
	// Da de beber a un animal
}

class Comedero {
	const pesoMaximoSoportado
	method esUtilParaAtender(animal) =
		animal.tieneHambre()
			&& animal.peso() < pesoMaximoSoportado
			
	// TODO: Atención de animales
	// Da de comer una cantidad fija que deberá 
	// indicarse para cada comedero.
	// ¿Qué pasa si supera el peso máximo?
}
