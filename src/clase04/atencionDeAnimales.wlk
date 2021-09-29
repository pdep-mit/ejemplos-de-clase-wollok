// TODO: Atención de animales - punto de entrada
// Opción 1: dispositivo.atender(animal) <-- 
// Opción 2: animal.atenderseEn(dispositivo)

/////////////////////////////////////
/// Animales
/////////////////////////////////////

/////////////////
// tieneSed()
// tieneHambre()
// peso()
// beber()
// comer(kilos)
/////////////////

class Vaca {
	var property peso
	var property tieneSed = false
	method tieneHambre() = peso < 200
	
	method beber(){
		tieneSed = false
		peso -= 0.5
	}
	method comer(kilos){
		peso += kilos / 3
		tieneSed = true
	}
}

class Cerdo {
	var property peso
	var property tieneHambre = true
	var vecesQueComioSinBeber = 0
	
	method tieneSed()
		= vecesQueComioSinBeber > 3
    
	method beber(){
		tieneHambre = true
		vecesQueComioSinBeber = 0
	}
	method comer(kilos){
		peso += (kilos-0.2).max(0)
		
		if(kilos > 1){
			tieneHambre = false
		}
		
		vecesQueComioSinBeber += 1
	}
}

class Gallina {
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	
	method beber(){
		// Cuando bebe no se observa ningún cambio.
	}
	method comer(kilos){
		// Cuando come no se observa ningún cambio.
	}
}

/////////////////////////////////////
/// Dispositivos
/////////////////////////////////////

///////////////////////////////
// esUtilParaAtender(animal)
// atender(animal)
///////////////////////////////

class Bebedero {
	method esUtilParaAtender(animal) =
		animal.tieneSed()	
		
	method atender(animal){
		animal.beber()
	}
	
	method consumoEnergetico() = 10
}

class Comedero {
	const pesoMaximoSoportado
	// Nota: le puse un default para poder correr los tests de la parte 2
	// que para la mayoría no es relevante
	var property racion = 1   
	
	method esUtilParaAtender(animal) =
		animal.tieneHambre()
			&& animal.peso() < pesoMaximoSoportado
			
	method atender(animal){
		if(animal.peso() > pesoMaximoSoportado)
			self.error("Demasiado pesado")
		animal.comer(racion)
	}
	
	method consumoEnergetico() = 20 * pesoMaximoSoportado
}