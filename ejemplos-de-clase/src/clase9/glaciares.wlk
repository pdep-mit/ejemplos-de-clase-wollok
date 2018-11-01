/*
 * Puntos de entrada:
 * 1. unTempano.esAzul()
 * 2. unTempano.cuentoEnfria()
 * 3. masaDeAgua.esAtractiva()
 * 4. glaciar.pesoInicialDeUnTempano()
 * 5. glaciar.desprendimiento()
 * 6. embarcacion.navegar(masaDeAgua)
 */
class UserException inherits Exception{}
class Embarcacion {
	const property tamanio
	const property fuerza
	
	method navegar(masaDeAgua){
		self.validarQuePuedeNavegar(masaDeAgua)
		masaDeAgua.teNavego(self)
	}
	
	method validarQuePuedeNavegar(masaDeAgua){
		masaDeAgua.validarQueEsNavegablePor(self)
	}
}
object compacto {
	method esAzul(unTempano)
		= unTempano.parteVisible() > 100
	
	method cuantoEnfria(unTempano) 
		= unTempano.peso() * 0.01
		
	method perdioPeso(unTempano){
		if(not unTempano.esGrande())
			unTempano.tipo(aireado)
	}
	
}

object aireado {
	method esAzul(unTempano) = false
	method cuantoEnfria(unTempano) = 0.5
	method perdioPeso(unTempano){
		// Todo bien :D
	}
}

class Tempano {
	var tipo = compacto
	var property peso
	
	method esAzul() {
		return tipo.esAzul(self)
	}
	method parteVisible() = self.peso() * 0.15
	
	method cuantoEnfria() = tipo.cuantoEnfria(self)
	
	method esGrande() = self.peso() > 500
	
	method esAtractivo() = self.esGrande() || self.esAzul()
	
	method perderPeso(cantidad){
		peso = (peso - cantidad).max(0)
		tipo.perdioPeso(self)
	}
}


object ambiente {
	var property temperatura
}

class MasaDeAgua {
	const tempanos = #{}
	
	method esAtractiva() 
		= tempanos.size() >= 5 
			&& tempanos.all({tempano => 
				tempano.esAtractivo()		
			})
			
	method temperatura() 
		= self.temperaturaAmbiente() - tempanos.sum {tempano =>
			tempano.cuantoEnfria()
		}
		
	method temperaturaAmbiente() = ambiente.temperatura()
	
	method cantidadDeTempanosGrandes() =
		tempanos.filter({tempano => tempano.esGrande()}).size()
		
	method recibirTempano(tempanoNuevo){
		tempanos.add(tempanoNuevo)
	}
	
	method validarQueEsNavegablePor(embarcacion)
	method teNavego(embarcacion){
		tempanos.forEach({tempano =>
			tempano.perderPeso(1)
		})
	}
}

class Lago inherits MasaDeAgua {
	override method validarQueEsNavegablePor(embarcacion){
		if(self.temperatura() < 0){
			throw new UserException("Agua congelada")
		}
		if(self.cantidadDeTempanosGrandes() > 20 && 
			embarcacion.tamanio() > 10){
				throw new UserException("Embarcacion muy grande para lago complicado")
			}
	}
}

class Rio inherits MasaDeAgua {
	var property velocidadBase
	
	override method temperatura() =
		super() + self.velocidadAgua()
		
	method velocidadAgua() = self.velocidadBase() -
		self.cantidadDeTempanosGrandes()
		
	override method validarQueEsNavegablePor(embarcacion){
		if(self.velocidadAgua() > embarcacion.fuerza())
			throw new UserException("Fuerza insuficiente para río rápido")
	}
}

class Glaciar {
	var property peso
	const property desembocadura
	
	method pesoInicialDeUnTempano() =
		self.desembocadura().temperatura() *
			(self.peso() / 1000000)
			
	method temperatura() = 1
	
	method desprendimiento(){
		const pesoTempano = self.pesoInicialDeUnTempano()
		peso -= pesoTempano
		self.desembocadura()
			.recibirTempano(new Tempano(peso = pesoTempano))
	}
	
	method recibirTempano(tempano){
		peso += tempano.peso()
	}
}