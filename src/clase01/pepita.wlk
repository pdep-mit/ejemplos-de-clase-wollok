object pepita {
	var energia = 100
	
	method energia() {
		return energia
	}
	
	method volar(kilometros){
		energia = 
		  energia - 40 - 5 * kilometros
	}
	
	method comer(gramos){
		energia = energia + 2 * gramos
	}
}