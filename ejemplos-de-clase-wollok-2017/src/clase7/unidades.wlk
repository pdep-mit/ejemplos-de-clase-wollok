import estados.*
import items.*

class Unidad {
	var vida = 100
	var armadura = new Armadura(10)
	var estado = normal

	method perderVida(cantidad) {
		vida = (vida - cantidad).max(0)
		if(vida == 0)
			estado = muerto
	}
	
	method vidaQuePierdePorQuemarse() = 20
	
	method recibirAtaqueFisico(cantidad) {
		estado.recibeAtaqueFisico(self, cantidad)
	}
	
	method recibirDanioPorAtaqueFisico(cantidad){
		self.perderVida(armadura.danioQueDejaPasar(cantidad))
		armadura.daniar()
	}
	
	method puedeSerAtacado()= estado.puedeSerAtacado()
	
	method atacar(unaUnidad) {
		if(! unaUnidad.puedeSerAtacado()){
			throw new NoSePuedeAtacar()
		} 	
		if(! estado.permiteAtacar()){
			throw new NoSePuedeAtacar()
		} 
	}
	
	method congelar(){
		estado.congelado(self)
	}
	
	method quemar(){
		estado.quemado(self)
	}
	
	method estado(unEstado){
		estado = unEstado
	}
}

class UnidadArmada inherits Unidad {
	var arma
	
	constructor(unArma){
		arma = unArma
	}
	
	override method atacar(unaUnidad){
		super(unaUnidad)
		arma.atacar(unaUnidad)
	}
}

class Arquero inherits UnidadArmada {
	constructor() = super(armeria.arco())
}

class Paladin inherits UnidadArmada {
	override method atacar(unaUnidad){
		super(unaUnidad)
		vida += 3
	}
}

class ChamanFuego inherits Unidad {
	override method atacar(unaUnidad){
		super(unaUnidad)
		unaUnidad.quemar()
	}
	
	override method congelar(){
		super()
		self.perderVida(30)
	}
	
	override method vidaQuePierdePorQuemarse() = super() / 2
	
}

class ChamanHielo inherits Unidad {
	override method atacar(unaUnidad){
		super(unaUnidad)
		unaUnidad.congelar()
	}
}

class NoSePuedeAtacar inherits Exception {}

