/*
 * Punto 1:
 * pirata.esUtilPara(mision)
 * mision.esUtil(pirata) <--- vamos por acá
 * 
 * Punto 2:
 * a - pirata.puedeFormarParteDeTripulacion(barco)
 *     barco.puedeFormarParteDeTripulacion(pirata) <-- vayamos por acá
 * b-  barco.incorporarATripulacion(pirata) <-- producir efecto
 * c-  barco.mision(nuevaMision)
 *       
 * Punto 3:
 * barco.esTemible()
 * 
 * Punto 4:
 * barco.itemMasRaro()
 * 
 * Punto 5:
 * barco.anclarEn(ciudadCostera)
 */
 
 object busquedaDelTesoro {
 	method esUtil(pirata)
 		= pirata.tieneAlgunItem(#{"brújula", "botella de GrogXD", "mapa"})
 			&& pirata.monedas() <= 5
 			
 	method puedeRealizarMision(barco)
 	  = barco.algunTripulanteTieneItem("llave de cofre")
 }
 
 class ConvertirseEnLeyenda {
 	const property itemObligatorio
 	
 	method esUtil(pirata)
 		= pirata.cantidadDeItems() >= 10
 			&& pirata.tieneItem(itemObligatorio)
 			
 	method puedeRealizarMision(barco) = true
 }
 
 class Saqueo {
 	const victima
 	
 	method esUtil(pirata)
 	  = pirata.monedas() < self.dineroMaximo()
 	  		&& pirata.seAnimaASaquear(victima)
 	method dineroMaximo() = configuracionSaqueos.dineroMaximo()
 	
 	method puedeRealizarMision(barco) = victima.esVulnerable(barco)
 }
 
 object configuracionSaqueos {
 	var property dineroMaximo = 0
 }
 
 class EspiaDeLaCorona inherits Pirata {
 	override method pasadoDeGrogXD() = false 
 	override method seAnimaASaquear(victima)
 		= super(victima) && self.tieneItem("permiso de la corona")
 }
 class Pirata {
 	const property items = []
 	var property monedas = 0
 	var property nivelDeEbriedad = 0
 	
 	method tieneAlgunItem(itemsBuscados)
 	  = itemsBuscados.any({item => self.tieneItem(item)})
 	
 	method tieneItem(itemBuscado) = items.contains(itemBuscado)
 	method cantidadDeItems() = items.size()
 	
 	method seAnimaASaquear(victima) = victima.pirataSeAnimaASaquear(self)
 	
 	method pasadoDeGrogXD() = self.nivelDeEbriedad() >= 90 &&
 		self.tieneItem("botella de GrogXD")
 		
 	method puedePagar(cantidadDeMonedas) = monedas >= cantidadDeMonedas
 	method tomarUnTragoEn(ciudadCostera){
 		self.gastar(ciudadCostera.costoDelTrago())
 		nivelDeEbriedad += 5
 	}
	method gastar(cantidadDeMonedas) {
		if(not self.puedePagar(cantidadDeMonedas)){
			self.error("No puede pagar la cantidad pedida")
		} 
		
		monedas -= cantidadDeMonedas
	}
 }
 
 class Barco {
 	var property mision
 	const property capacidad
 	const property tripulacion = []
 	
 	method mision(nuevaMision){
 		mision = nuevaMision
 		const piratasQueSeVan = tripulacion.filter({pirata =>
 			not nuevaMision.esUtil(pirata)
 		})
 		tripulacion.removeAll(piratasQueSeVan)
 	}
 	
 	method pirataSeAnimaASaquear(pirata)
 		= pirata.pasadoDeGrogXD()
 		
 	method puedeFormarParteDeTripulacion(pirata)
 		= self.tieneLugarParaOtroTripulante()
 			&& mision.esUtil(pirata)
 	method tieneLugarParaOtroTripulante()
 		=  self.cantidadDeTripulantes() < capacidad
 		
 	method cantidadDeTripulantes() = tripulacion.size()
 		
 	method incorporarATripulacion(pirata){
 		if(self.puedeFormarParteDeTripulacion(pirata)){
 			tripulacion.add(pirata)
 		} else {
 			self.error("El pirata no puede formar parte de la tripulación del barco")
 		}
 	}
 	
 	method esTemible() = tripulacion.count({pirata =>
 		mision.esUtil(pirata)
 	}) >= 5 && self.puedeRealizarMision()
 	
 	method puedeRealizarMision()
 		= self.tieneTripulacionSuficienteParaHacerMision() &&
 			mision.puedeRealizarMision(self)
 	
 	method tieneTripulacionSuficienteParaHacerMision() =
 	  self.cantidadDeTripulantes() >= capacidad * 0.9
 	  
 	method algunTripulanteTieneItem(item) = tripulacion.any({pirata =>
 		pirata.tieneItem(item)
 	})
 	
 	method esVulnerable(otroBarco)
 		= self.cantidadDeTripulantes() < otroBarco.cantidadDeTripulantes() / 2
 		
 	method todaLaTripulacionEstaPasadaDeGrogXD() =
 		tripulacion.all({pirata => pirata.pasadoDeGrogXD() })
 		
 	method itemMasRaro() 
 		= self.todoLosItems().min({item => 
 			tripulacion.count({pirata => pirata.tieneItem(item)})
 		})
 	
 	method todoLosItems() = tripulacion.flatMap({pirata => pirata.items()})
 	
 	method anclarEn(ciudadCostera) {
 		tripulacion.filter({pirata =>
 			pirata.puedePagar(ciudadCostera.costoDelTrago())
 		}).forEach({pirata =>
 			pirata.tomarUnTragoEn(ciudadCostera)
 		})
 		
 		self.perderAlMasEbrioEn(ciudadCostera)
 	}
 	method tripulanteMasEbrio()
 		= tripulacion.max({pirata => pirata.nivelDeEbriedad()})
 		
 	method perderAlMasEbrioEn(ciudadCostera){
 		tripulacion.remove(self.tripulanteMasEbrio())
 		ciudadCostera.sumarHabitante()
 	}
 }
 
 class CiudadCostera {
 	var property cantidadDeHabitantes
 	const property costoDelTrago
 	
 	method pirataSeAnimaASaquear(pirata)
 		= pirata.nivelDeEbriedad() >= 50
 		
 	method esVulnerable(barco)
 		= barco.cantidadDeTripulantes() >= cantidadDeHabitantes * 0.4
 			|| barco.todaLaTripulacionEstaPasadaDeGrogXD()
 			
 	method sumarHabitante(){
 		cantidadDeHabitantes += 1
 	}
 }
 