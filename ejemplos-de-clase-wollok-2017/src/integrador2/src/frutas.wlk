object banana {
	method valor() = 10
}

object manzana {
	method valor() = 5
}

object uva {
	method valor() = 1
}


//Con verduler�a

class Fruta {
	const valor
	constructor(unValor){
		valor = unValor
	}
	method valor() = valor
}

object verduleria {
	method banana() = new Fruta(10)
	
	method manzana() = new Fruta(5)
	
	method uva() = new Fruta(1)
}