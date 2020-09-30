// TODO: Atención de animales - punto de entrada
// Opción 1: dispositivo.atender(animal) <-- :D
// Opción 2: animal.atenderseEn(dispositivo)

/////////////////////////////////////
/// Animales
/////////////////////////////////////

/////////////////
// tieneSed()
// tieneHambre()
// peso()
// beber()
// comer(racion)
/////////////////

class Vaca {
	var property peso
	var property tieneSed = false
	method tieneHambre() = peso < 200
	
	method beber(){
		tieneSed = false
		peso -= 0.5
	}
	method comer(racion){
		peso += racion / 3
		tieneSed = true
	}
}

class Cerdo {
	var property peso
	var property tieneHambre = false
	var vecesQueComioSinBeber = 0
	
	method tieneSed()
		= vecesQueComioSinBeber > 3
    
	method beber(){
		tieneHambre = true
		vecesQueComioSinBeber = 0
	}
	method comer(racion){
		peso += (racion - 0.2).max(0)
		vecesQueComioSinBeber +=1
		if(racion > 1){
			tieneHambre = false
		}
	}
}

class Gallina {
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	
	method beber(){
		// No se observan cambios
	}
	method comer(racion){
		// No se observan cambios
	}
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

	method atender(animal){
		animal.beber()
	}
	
	method consumoEnergetico() = 10
}

class Comedero {
	const pesoMaximoSoportado
	const racion 
	method esUtilParaAtender(animal) =
		animal.tieneHambre()
			&& animal.peso() < pesoMaximoSoportado
			
	method atender(animal){
		if(self.superaPesoMaximo(animal))
			self.error("El animal es demasiado pesado para atenderlo")
		animal.comer(racion)
	}
	method superaPesoMaximo(animal) = animal.peso() > pesoMaximoSoportado
	
	method consumoEnergetico() = 20 * pesoMaximoSoportado
}
