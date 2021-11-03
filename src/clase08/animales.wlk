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
	
	method image() = "vaca.png"
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
	
	method image() = "cerdo.png"
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
	
	method image() = "gallina.png"
}

/////////////////////////

object conejoPepito {
  var property peso = 3
  method tieneHambre() = true
  method tieneSed() = true
  
  // Este objeto está mal programado porque
  // no respeta la interfaz de los otros animales!!!
  // Al recibir comer(racion) no va a entender el mensaje
  method comer(){
    peso += 1
  }
  method beber(){
    peso += 0.1
  }
  
  method image() = "conejo.png"
}