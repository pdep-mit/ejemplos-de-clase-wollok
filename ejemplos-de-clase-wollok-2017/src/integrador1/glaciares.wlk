class Glaciar{
	var masa
	var desembocadura
	
	constructor(_masa, _desembocadura){
		masa = _masa
		desembocadura = _desembocadura
	}
	
	method pesoInicialDeTempano()= masa/1000000 * desembocadura.temperatura()
	method temperatura()=1
	method desprender(){
	 const tempano=new Tempano(self.pesoInicialDeTempano(),compacto)
	 masa -= tempano.peso()
	 desembocadura.caeTempano(tempano)
	}
	method caeTempano(tempano){
		masa += tempano.peso()
	}
}
class Tempano{
	var peso
	var tipo
	constructor(_peso,_tipo){
		peso=_peso
		tipo=_tipo
	}
	method seVeAzul(){
		return tipo.SeVeAzul(self)
	}
	method peso()=peso
	method parteVisible(){
		return (peso*0.15) 
	}
	method cuantoEnfria(){
		tipo.cuantoEnfria(self)
	}
	method esAtractivo()= self.esGrande() || self.seVeAzul()
	method esGrande()= peso > 500
	method pierdePeso(cantidad){
		peso -= cantidad
		tipo.perdioPeso(self)
	}
}

object compacto{
	method seVeAzul(tempano){
		return (tempano.parteVisible()) > 100
			}
	method cuantoEnfria(tempano)= (tempano.peso())/100
	method perdioPeso(tempano){
		if(!tempano.esGrande()){
			tempano.tipo(aireado)
		}
	}
}

object aireado{
	method seVeAzul(tempano)=false
	method cuantoEnfria(tempano)= 0.5		
	method perdioPeso(tempano){}
}

class MasaDeAgua{
	var tempanos = []
	
	method atractiva()=
		tempanos.size()>5 && 
			tempanos.all({tempano => tempano.esAtractivo()})	
	method temperatura()= 
		ambiente.temperatura() 
			- tempanos.sum({tempano=> tempano.cuantoEnfria()})
	method caeTempano(tempano){
		tempanos.add(tempano)
	}
	method seNavego(embarcacion){
		self.validarNavegacion(embarcacion)
		tempanos.forEach({tempano => tempano.pierdePeso(1)})
	}
	method validarNavegacion(embarcacion)
}

class Rio inherits MasaDeAgua{
	var velocidadBase
	
	constructor(_velocidadBase){
		velocidadBase = _velocidadBase
	}
	override method temperatura() = super() + self.velocidad()
	override method validarNavegacion(embarcacion){
		if(embarcacion.fuerza()> self.velocidad()){
			throw new NoPuedeNavegar("rioRapido")
		}
	}
	method velocidad()= velocidadBase - (tempanos.count({tempano=>tempano.grande()}))
}
class Lago inherits MasaDeAgua{
	override method validarNavegacion(embarcacion){
		if(tempanos.size()>20 && embarcacion.tamanio()>10){
			throw new NoPuedeNavegar("muchosTempanos")
		}
		if(self.temperatura()<0){
			throw new NoPuedeNavegar("BajaTemp")
		}
	}
}
object ambiente{
	var temperatura = 20
	method temperatura() = temperatura
	method temperatura(_temperatura){
		temperatura = _temperatura
	}
}

class Embarcacion{
	var tamanio
	var fuerza
	
	constructor(_tamanio, _fuerza){
		tamanio = _tamanio
		fuerza = _fuerza
	}
	
	method tamanio()=tamanio
	method fuerza()=fuerza
	method navegar(masaDeAgua){
			masaDeAgua.seNavego(self)
	}
}
class NoPuedeNavegar inherits Exception{}