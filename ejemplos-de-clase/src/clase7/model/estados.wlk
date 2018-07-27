
class Estado {
	
	method puedeSerAtacado() = true
	method quemado(unaUnidad){
		unaUnidad.perderVida(unaUnidad.vidaQuePierdePorAtaqueDeFuego())
		if(unaUnidad.seQuema())
			unaUnidad.estado(quemado)
	}
	
	method permiteAtacar() = true
	
	method congelado(unaUnidad){
		unaUnidad.perderVida(10)
		unaUnidad.estado(self.estadoPostCongelacion())
	}
	method estadoPostCongelacion() = new Congelado()
	
	method recibeAtaqueFisico(unaUnidad, cantidad) {
		unaUnidad.recibirDanioPorAtaqueFisico(cantidad)
	}
	
	method atacoConFrio(unaUnidad){
		//No pasa nada
	}
	
	method realizoAtaqueFisico(unaUnidad, otra){
		//No pasa nada
	}
	
	method danioQueEfectuaPorAtaqueFisico() = 0
}
object normal inherits Estado {}

class Congelado inherits Estado {
	var resistencia = 3
	override method quemado(unaUnidad){
		unaUnidad.estado(normal)
	}
	
	override method permiteAtacar() = false
	
	override method recibeAtaqueFisico(unaUnidad, cantidad) {
		if(resistencia == 1){
			unaUnidad.estado(normal)
		} else {
			resistencia -= 1
		}
	}
}

object quemado inherits Estado {
	override method estadoPostCongelacion() = normal
	
	override method atacoConFrio(unaUnidad){
		unaUnidad.estado(normal)
	}
	
	override method realizoAtaqueFisico(unaUnidad, otra){
		super(unaUnidad, otra)
		unaUnidad.perderVida(1)
	}
	override method recibeAtaqueFisico(unaUnidad, cantidad) {
		super(unaUnidad, cantidad * 2)
	}
	
	override method danioQueEfectuaPorAtaqueFisico() = 10
}

object muerto {
	method permiteAtacar() = false
	
	method recibeAtaqueFisico(unaUnidad, cantidad){
		throw new EstaMuerto()
	}
	
	method congelado(unaUnidad){
		throw new EstaMuerto()
	}
	
	method quemado(unaUnidad){
		throw new EstaMuerto()
	}
	
	method puedeSerAtacado() = false
}

class EstaMuerto inherits Exception {
	
}

class NoSePuedeAtacar inherits Exception {}