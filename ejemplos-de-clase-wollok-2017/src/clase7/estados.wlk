
class Estado {
	
	method puedeSerAtacado() = true
	method quemado(unaUnidad){
		unaUnidad.perderVida(unaUnidad.vidaQuePierdePorQuemarse())
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
}
object normal inherits Estado {}

class Congelado inherits Estado {
	var resistencia = 3
	override method quemado(unaUnidad){
		unaUnidad.estado(normal)
	}
	
	override method permiteAtacar() = false
	
	override method recibeAtaqueFisico(unaUnidad, cantidad) {
		if(resistencia == 0){
			unaUnidad.estado(normal)
		} else {
			resistencia -= 1
		}
	}
}

object quemado inherits Estado {
	override method estadoPostCongelacion() = normal
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