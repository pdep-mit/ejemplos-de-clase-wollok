object pepita {
	var energia = 100
	
	method volar(kilometros){
		energia = 
		  energia - 40 - 5 * kilometros
	}
	method energia() {
		return energia
	}
	method energia(nuevaEnergia){
		energia = nuevaEnergia
	}
	
	method comer(gramos){
		energia = energia + 2 * gramos
	}
}