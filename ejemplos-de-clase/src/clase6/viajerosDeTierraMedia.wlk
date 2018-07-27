
class Grupo {
	const viajeros 
	constructor(losViajeros){
		viajeros = losViajeros
	}

	method nivelTotal() = viajeros.sum({viajero => viajero.nivel()})
	
	method validarNivel(zona){
		if(self.nivelTotal() < zona.cantidadDeOrcos()){
			throw new NivelInsuficiente()
		}
	}
	method validarElementos(zona){
		if(!self.tieneElementos(zona)){
			throw new NoTieneElementos()
		}
	}
		
	method atravesarZona(zona){
		self.validarNivel(zona)
		self.validarElementos(zona)
			
		viajeros.forEach({viajero => viajero.subirNivel()})
		zona.matarOrcos()	
	}
	method tieneElementos(zona) = 
		zona.elementosNecesarios().all({elemento =>
			self.tieneElemento(elemento)
		})
	method tieneElemento(elemento) =
		viajeros.any({viajero => viajero.tieneElemento(elemento)})
		
	method cantidadDeIntegrantes() = viajeros.size()
	
	method quitarViajero(viajero){
		viajeros.remove(viajero)
	}
	
	method sacrificarAUno(){
		try {
			self.quitarViajero(
				viajeros.max({viajero => viajero.nivel()})
			)
		} catch e:Exception {
			throw new NoHayMasGente("No es posible sacrificar a alguien", e)
		}
		
	}
	method intentarAtravesarMedianteSacrificio(zona){
		try {
			self.atravesarZona(zona)
		} catch e:YouShallNotPass {
			self.sacrificarAUno()
		}
	}

}

class Zona {
	var cantidadDeOrcos
	var elementosNecesarios
	
	constructor(elementos, cantOrcos){
		cantidadDeOrcos = cantOrcos
		elementosNecesarios = elementos
	}
	
	method cantidadDeOrcos() = cantidadDeOrcos
	method elementosNecesarios() = elementosNecesarios
	
	method matarOrcos(){
		cantidadDeOrcos = 0
	}
	
}

class NivelInsuficiente inherits YouShallNotPass {}
class NoTieneElementos inherits YouShallNotPass {}
class YouShallNotPass inherits Exception {}
class NoHayMasGente inherits Exception {}

class Viajero {
	var nivel
	var elementos
	
	constructor(unNivel, unosElementos){
		nivel = unNivel
		elementos = unosElementos
	}
	
	method nivel() = nivel
	
	method subirNivel(){
		nivel += 1
	}
	
	method tieneElemento(elemento) = elementos.contains(elemento)
}

class Camino {
	var zonas = []
	
	method agregarZona(zona){
		zonas.add(zona)
	}
	
	method transitadoPor(grupo){
		zonas.forEach({zona => 
			grupo.intentarAtravesarMedianteSacrificio(zona)
		})
	}
}