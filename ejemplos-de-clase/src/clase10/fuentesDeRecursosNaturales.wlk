import recursos.*

class Mina {
	const property recursoQueAporta
	var property cantidadDeRecursoQueAporta
	
	method consecuenciasDeExplotacion(){
		//No pasa nada por el simple hecho de explotar la mina
	}
}

class Bosque {
	var property hayArboles = true
	
	method recursoQueAporta() = madera
	
	method cantidadDeRecursoQueAporta()
		= if(hayArboles) 200 else 0
		
	method consecuenciasDeExplotacion(){
		hayArboles = false
	}
}
