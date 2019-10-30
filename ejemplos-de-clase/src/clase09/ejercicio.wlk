class Tempano{
	
	var property tipo
	
	var property peso
	
	method esAzul() = tipo.seVeAzul(self)
	
	method kgDeParteVisible() =	peso * 0.15	
	
	method cuantoEnfriaElAgua() = tipo.enfriamiento(self)
	
	method esGrande() = peso > 500
	
	method esAtractivo()  = self.esGrande() or self.esAzul()
	
	method perderPeso(cantidad){
		peso -= cantidad
		self.airearSiCorresponde()
	}
	
	method airearSiCorresponde(){
		tipo = tipo.proximoEstado(self)
		
		/* Opcion 2
		 * 
		 * tipo.airearSiCorresponde(self)
		 */
	}
}

object aireado{
	
	method seVeAzul(tempano) = false
	
	method enfriamiento(tempano) = 0.5
	
	method proximoEstado(tempano) = self
	
	method airearSiCorresponde(tempano){
		//No hay que hacer nada
	}
}

object compacto{
	
	method seVeAzul(tempano) = tempano.kgDeParteVisible() > 100
	
	method enfriamiento(tempano) = tempano.peso() * 0.01
	
	method proximoEstado(tempano){
		if(tempano.esGrande()){
			return self
		} else{
			return aireado
		}
	}	
	
	method airearSiCorresponde(tempano){
		
		if(not tempano.esGrande()){
			tempano.tipo(aireado)
		}
	}
}

class MasaDeAgua {
	
	const tempanos = []
	
	method esNavegable(embarcacion)
	
	method serNavegada(){
		tempanos.forEach({unTempano => unTempano.perderPeso(1)})
	}
	
	method esAtractiva() = self.hayMuchosTempanos() and 
		tempanos.all({unTempano => unTempano.esAtractivo()})
	
	method hayMuchosTempanos() = tempanos.size() > 5
	
	method temperatura() = 
		self.temperaturaAmbiente() - self.temperaturaDeTempanos()
	
	method temperaturaDeTempanos() = 
		tempanos.sum({unTempano => unTempano.cuantoEnfriaElAgua()})
		
	method temperaturaAmbiente() = ambiente.temperatura()
	
	method incorporarTempano(tempano){
		tempanos.add(tempano)
	}
	
	method cantidadDeTempanosGrandes() = 
		tempanos.filter({unTempano => unTempano.esGrande() }).size()
}

class Lago inherits MasaDeAgua{
	
	 override method esNavegable(embarcacion) = 
	 (embarcacion.tamanio() < 10 or self.cantidadDeTempanosGrandes() < 20 ) 
	 and not(self.temperatura() < 0)
}

class Rio inherits MasaDeAgua{
	
	var velocidadBase
	
	override method temperatura() = 
		super() + self.velocidadDeAgua()
		
	override method esNavegable(embarcacion) = 
		self.velocidadDeAgua() < embarcacion.fuerza()
	
	method velocidadDeAgua() = 
		velocidadBase - self.cantidadDeTempanosGrandes()
}

object ambiente{
	var property temperatura
}

class Glaciar{
	
	var masa
	var desembocadura
	
	
	method pesoDeDesprendimiento() = 
		desembocadura.temperatura() * masa / 1000000
	
	method temperatura() = 1
	
	method desprender(){
		const pesoInicial = self.pesoDeDesprendimiento()
		var unTempano = new Tempano(tipo = compacto, peso = pesoInicial)
		masa -= pesoInicial
		desembocadura.incorporarTempano(unTempano)
	}
	
	method incorporarTempano(tempano){
		masa += tempano.peso()
	}
}

class Embarcacion{
	
	var property fuerza
	
	var property tamanio
	
	method navegarSobre(masaDeAgua){
		
		//Ver si puedo navegar
		//Si puedo navegar, producir efecto en masa de agua
		if(self.puedoNavegar(masaDeAgua)){
			self.producirEfecto(masaDeAgua)
		}
		
		//Si no puedo navegar, tirar error
		else{
			self.error("No puedo navegar")
		}
	}
	
	method puedoNavegar(masaDeAgua) = 
		masaDeAgua.esNavegable(self)

	
	method producirEfecto(masaDeAgua) {
		masaDeAgua.serNavegada()
	}
}