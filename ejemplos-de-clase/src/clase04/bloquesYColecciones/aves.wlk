class Ave {
	var property energia = 100
	method vola(){
		energia -= 10
	}
	method volaNVeces(vecesAVolar){
		// Dentro del bloque que le pasamos a times producimos efecto
		// y además notamos que podemos usar self, y hace referencia al
		// mismo objeto que si usábamos self afuera del bloque
		vecesAVolar.times({n => self.vola()})
	}
}

const muchasAves = [new Ave(energia = 30), 
	new Ave(energia = 50),
	new Ave()
]