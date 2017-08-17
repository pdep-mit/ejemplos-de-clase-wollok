object pepita {
	var energia = 100
	
	method energia() {
		return energia
	}
		
	method volar(metros){
		energia -= 40 + metros *5
	}
	
	// Como normalmente a pepita se le da de comer 10 gramos,
	// al usuario le sirve que se le pueda dar de comer
	// esa cantidad sin decir nada, pero sin cerrar la 
	// puerta a darle otra cantidad.
	// Podemos reutilizar la logica general delegando al mismo objeto
	// usando la referencia self (que todos los objetos tienen
	// y apuntan a ellos mismos)
	method comer(){
		self.comer(10)
	}
		
	method comer(gramos){
		energia += gramos * 2
	}
	// Nota: que ambos metodos se llamen igual no trae problemas 
	// (podrian llamarse distinto y seria lo mismo) ya que
	// al tener otra cantidad de parámetros no hay duda de cuál método usar
	// cuando le manden el mensaje

}

object josefa {
	var metrosVolados = 0
	var gramosComidos = 0
	
	method energia(){
		return 80 
			+ gramosComidos - metrosVolados 
	} 
		
	method comer(gramos){
		gramosComidos = gramos + gramosComidos
	}
	method volar(metros){
		metrosVolados += metros
	}
}

object entrenador {
	// Tanto pepita como josefa pueden ser entrenadas
	// porque comparten la interfaz que el entrenador necesita
	// Conclusion: pepita y josefa son polimorficas para el entrenador
	method entrenar(pajarito){
		pajarito.comer(10)
		pajarito.volar(20)
		if(pajarito.energia() < 20){
			pajarito.comer(10)
		} else {
			pajarito.comer(2)
		}
	}
}