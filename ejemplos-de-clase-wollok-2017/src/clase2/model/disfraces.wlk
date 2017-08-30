

object disfrazFrozen {
	method ternura() = 5
	method terror() = 0
}

object disfrazZombie {
	method ternura() = 0
	method terror() = 8
}


object disfrazCustom {
	var ternura = 0
	var terror = 0

	method ternura() = ternura
	method ternura(nuevaTernura){
		ternura = nuevaTernura
	}
	method terror() = terror
	method terror(nuevoTerror){
		terror = nuevoTerror
	}
}