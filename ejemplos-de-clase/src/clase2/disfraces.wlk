object zombie {
	method ternura() = 0
	method terror() = 8
}

object frozen {
	// Usamos la otra notación para que no
	// queden dudas de que es lo mismo.
	// Usen la que más les guste.
	method ternura(){
		return 5
	}
	method terror(){
		return 0
	}
}

object disfrazCustom {
	var ternura = 0
	var terror = 0
	
	method ternura() = ternura
	method ternura(valor){
		ternura = valor
	}
	
	method terror() = terror
	method terror(valor) {
		terror = valor
	}
}