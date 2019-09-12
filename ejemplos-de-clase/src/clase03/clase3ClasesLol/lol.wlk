class Torre {
  var property  vida = 500
  
  method recibirDanio(danioRecibido){
    vida = 0.max(vida - danioRecibido)
  }

  method recibirAtaque(atacante) {
    var danioARecibir = atacante.danioACausar()
    self.recibirDanio(danioARecibir)
    atacante.impactoDeAtaque()
    
    if(self.estaDestruida()){
    	atacante.subirDeNivel()
    }
  }
  
  method estaDestruida() = vida == 0
}

object fizz {
	var property mana = 120
	var property habilidad = 80
	const property consumoPorHabilidad = 60
	
	method suficienteManaParaRealizarHabilidad() = mana >= consumoPorHabilidad
	method danioACausar(){
		if(self.suficienteManaParaRealizarHabilidad()){
			return habilidad * 2
		} else{
			return 0
		}
	}
	
	method concentrarse(){
		mana = mana + 25
	}
	
	method gastarManaPorAtaque(){
		mana = mana - consumoPorHabilidad
	}
	
	method impactoDeAtaque(){
		if(self.suficienteManaParaRealizarHabilidad()){
			self.gastarManaPorAtaque()
		} else{
			self.concentrarse()
		}
	}
	
	method subirDeNivel(){
		mana = mana + 50
		habilidad = habilidad + 100
	}
}

object zed {
	var property arma
	var property ataque = 110
	
	method danioACausar() = ataque + arma.porcentajeCritico() * ataque
	
	method impactoDeAtaque() {}
	
	method subirDeNivel(){
		ataque = self.ataque() + self.bonusDeAtaquePorNivel()
	}
	
	method bonusDeAtaquePorNivel()= 75
	
}

object espada {
	method porcentajeCritico()= 0.2
}

object martillo {
	method porcentajeCritico()= 0.25
}

object arco {
	method porcentajeCritico()= 0.05
}
