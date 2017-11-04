import estados.*
import items.*

class Unidad {
	var vida = 100
	var armadura = new Armadura(10)
	var estado = normal

	constructor(){}
	constructor(_armadura){
		armadura = _armadura
	}
	
	method perderVida(cantidad) {
		vida = (vida - cantidad).max(0)
		if(vida == 0)
			estado = muerto
	}
	
	method vida() = vida
	
	method vidaQuePierdePorAtaqueDeFuego() = 20
	
	method recibirAtaqueFisico(cantidad) {
		estado.recibeAtaqueFisico(self, cantidad)
	}
	
	method recibirDanioPorAtaqueFisico(cantidad){
		armadura.defender(self, cantidad)
	}
	
	method puedeSerAtacado()= estado.puedeSerAtacado()
	
	method atacar(unaUnidad) {
		if(! unaUnidad.puedeSerAtacado()){
			throw new NoSePuedeAtacar("La otra unidad no puede ser atacada")
		} 	
		if(! estado.permiteAtacar()){
			throw new NoSePuedeAtacar("La unidad no puede atacar")
		} 
	}
	
	method congelar(){
		estado.congelado(self)
	}
	
	method quemar(){
		estado.quemado(self)
	}
	
	method seQuema() = true
	
	method estado(unEstado){
		estado = unEstado
	}
	method estado() = estado
}

class UnidadArmada inherits Unidad {
	var arma
	
	constructor(unArma){
		arma = unArma
	}
	
	override method atacar(unaUnidad){
		super(unaUnidad)
		arma.ataca(self, unaUnidad)
		estado.realizoAtaqueFisico(self, unaUnidad)
	}
	
	method danioQueEfectuaPorAtaqueFisico() =
		estado.danioQueEfectuaPorAtaqueFisico()
	
}

class Arquero inherits UnidadArmada {
	//Por un error de Wollok esto no anda, pero debería
	//constructor() = super(armeria.arco())
	constructor() = super(new Arma(25))
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
	
	override method vidaQuePierdePorAtaqueDeFuego() = super() / 2
	override method seQuema() = false
}

class ChamanHielo inherits Unidad {
	override method atacar(unaUnidad){
		super(unaUnidad)
		unaUnidad.congelar()
		estado.atacoConFrio(self)
	}
}

