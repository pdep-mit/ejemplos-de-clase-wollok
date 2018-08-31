
object pepita {
  var energia = 100
  
  method volar(kilometros){
  	energia = energia - (40 + 5 * kilometros)
  }
  
  method energia() = energia
  method energia(joules){
  	energia = joules
  }
  
  method comer(gramos){
  	energia = energia + gramos * 2
  }

}

object josefa {
	var kilometrosVolados = 0
	var gramosComidos = 0
	const energiaInicial = 80
	
	method volar(kilometros){
		kilometrosVolados += kilometros
	}
	
	method comer(gramos){
		gramosComidos += gramos
	}
	method energia() {
		return energiaInicial + 5 * gramosComidos 
			- 3 * kilometrosVolados
	}
}

object entrenador {
	method entrenar(pajaro){
		pajaro.comer(10)
		pajaro.volar(20)
		if(pajaro.energia() < 20){
			pajaro.comer(10)
		} else {
			pajaro.comer(2)
		}
	}
}
