
class Arma {
	const danioQueProduce
	constructor(danio){
		danioQueProduce = danio
	}
	
	method danioQueProduce() = danioQueProduce
	
	method atacar(unaUnidad){
		unaUnidad.recibirAtaqueFisico(danioQueProduce)
	}
}


object armeria {
	method arco() = new Arma(25)
	method espada() = new Arma(20)
	method mandoble() = new Arma(30)
}


class Armadura {
	var resistencia
	constructor(unaResistencia){
		resistencia = unaResistencia
	}
	method daniar() {
		resistencia = (resistencia - 1).max(0)
	}
	method resistencia() = resistencia
	
	method danioQueDejaPasar(danio) = danio - resistencia
	
	method defender(unidad, danio){
		unidad.perderVida(self.danioQueDejaPasar(danio))
		self.daniar()
	}
}

class ArmaduraMagica inherits Armadura {
	override method danioQueDejaPasar(danio) = super(danio / 2)
}