/*
 * A- pirata.esUtilPara(mision)
 * B- mision.esUtil(pirata) <-- 
 * 
 * pirata = new Pirata()
 * mision = new BusquedaDelTesoro()
 * mision.esUtil(pirata)
 * 
 * busquedaDelTesoro.esUtil(pirata)
 * 
 * mision = new ConvertirseEnLeyenda(itemObligatorio = mapa)
 * 
 * mision1 = new Saqueo(victima = ...)
 * mision2 = new Saqueo(victima = ...)
 * 
 * configuracionSaqueos.maximoDeMonedas(7)
 * 
 * -----------
 * 
 * Punto 2:
 * barco.puedeFormarParte(pirata)  <---
 * barco.incorporarATripulacion(pirata)
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
 
 class BarcoPirata {
 	var property mision
 	const property capacidad
 	const property tripulantes = #{}
 	
 	method anclarEn(ciudadCostera){
 		tripulantes.filter {tripulante =>
 			tripulante.puedePagar(ciudadCostera.cuantoCobraElGrogXD())
 		}.forEach {tripulante =>
 			tripulante.tomarTragoDeGrogXD(ciudadCostera)
 		}
 		
 		const elMasEbrio = self.tripulanteMasEbrio()
 		tripulantes.remove(elMasEbrio)
 		ciudadCostera.sumarHabitante(elMasEbrio)
 	}
 	
 	method tripulanteMasEbrio() = tripulantes.max {tripulante => tripulante.ebriedad()}
 	
 	method itemMasRaro() = self.items().min {item => self.cantidadDeTripulantesQueTienen(item)}
 	method cantidadDeTripulantesQueTienen(item) = tripulantes.count {tripulante =>
 		tripulante.tieneItem(item)
 	}
 	method items() = self.tripulantes().flatMap {tripulante => tripulante.items()}
 	
 	method esTemible() = self.puedeRealizarMision()
 		&& tripulantes.count {pirata => mision.esUtil(pirata)} > 5
 		
 	method puedeRealizarMision() = mision.puedeSerRealizadaPor(self)
 	
 	method superaPorcentajeDeOcupacion(porcentaje)
 		= self.cantidadDeTripulantes() >= capacidad * porcentaje / 100
 	method tieneItem(item)
 		= tripulantes.any {tripulante => tripulante.tieneItem(item)}
 	method tripulacionPasadaDeGrogXD()
 		= tripulantes.all {tripulante => tripulante.pasadoDeGrogXD()}
 	
 	
 	method mision(nuevaMision){
 		mision = nuevaMision
 		// echamos a los que no sirven
 		const piratasQueNoSirven = tripulantes.filter({pirata =>
 			not nuevaMision.esUtil(pirata)
 		})
 		tripulantes.removeAll(piratasQueNoSirven)
 	}
 	
 	method puedeSerSaquedoPor(pirata) = pirata.pasadoDeGrogXD()
 	method puedeFormarParteDeTripulacion(pirata)
 	 = self.hayLugar() && mision.esUtil(pirata)
 	 
 	method hayLugar() = capacidad > self.cantidadDeTripulantes()
 	method cantidadDeTripulantes() = tripulantes.size()
 	
 	method incorporarATripulacion(pirata){
 		if(not self.puedeFormarParteDeTripulacion(pirata)){
 			self.error("No se puede subir al barco")
 		}
 		
 		tripulantes.add(pirata)
 	}
 	
 	method esVulnerableA(barco) = 
 		barco.cantidadDeTripulantes() / 2
 	 		>= self.cantidadDeTripulantes() 
 }
 class CiudadCostera {
 	var property cantidadDeHabitantes = 0
 	const property cuantoCobraElGrogXD
 	
 	method puedeSerSaquedoPor(pirata) = pirata.ebriedad() >= 50
 	method esVulnerableA(barco)
 	 = barco.cantidadDeTripulantes() 
 	 	>= self.cantidadDeHabitantes() * 0.4
 	 		|| barco.tripulacionPasadaDeGrogXD()
 	 		
 	method sumarHabitante(pirata){
 		cantidadDeHabitantes += 1
 	}
 }
 
 class Item {
 	const property nombre
 }
 
 const botellaDeGrogXD = new Item(nombre = "botella de GrogXD")
 const mapa = new Item(nombre = "mapa")
 const brujula = new Item(nombre = "brujula")
 const llaveDeCofre = new Item(nombre = "llave de cofre")
 const permisoDeLaCorona = new Item(nombre = "permiso de la corona")
 
 class Pirata {
 	var property monedas = 0
 	const property items = []
 	var property ebriedad = 0
 	
 	method puedePagar(dinero) = monedas >= dinero
 	method tomarTragoDeGrogXD(ciudad) {
 		self.gastar(ciudad.cuantoCobraElGrogXD())
 		ebriedad += 5
 	}
 	
 	method gastar(dinero){
 		if(self.puedePagar(dinero))
 			monedas -= dinero
 		else
 			self.error("No puede pagar esa cantidad de monedas")
 	}
 	method tieneItem(item) = items.contains(item)
 	method cantidadDeItems() = items.size()
 	
 	method seAnimaASaquearA(victima) =
 		victima.puedeSerSaquedoPor(self)
 
 	method pasadoDeGrogXD() = self.ebriedad() >= 90 && self.tieneItem(botellaDeGrogXD)
 }
 
 class EspiaDeLaCorona inherits Pirata {
 	override method pasadoDeGrogXD() = false
 	override method seAnimaASaquearA(victima)
 		= super(victima) && self.tieneItem(permisoDeLaCorona)
 }
 
 class Mision {
 	method puedeSerRealizadaPor(barco){
 		return barco.superaPorcentajeDeOcupacion(90) 
 			&& self.cumpleCondicionesParaRealizarla(barco)
 	}
 	method cumpleCondicionesParaRealizarla(barco) = true
 }
 class BusquedaDelTesoro inherits Mision {
 	method esUtil(pirata)
 		= self.tieneAlgunItemUtil(pirata) && pirata.monedas() <= 5
 	method tieneAlgunItemUtil(pirata) =
 		#{brujula, mapa, botellaDeGrogXD}.any({item => pirata.tieneItem(item)})
 		
 	override method cumpleCondicionesParaRealizarla(barco) = barco.tieneItem(llaveDeCofre)
 }
 
 class ConvertirseEnLeyenda inherits Mision {
 	const property itemObligatorio
 	
 	method esUtil(pirata) = pirata.cantidadDeItems() >= 10
 		&& pirata.tieneItem(itemObligatorio)
 }
 
 class Saqueo inherits Mision {
 	const property victima
 	
 	method esUtil(pirata)
 		= pirata.monedas() < self.maximoDeMonedas()
 			 && pirata.seAnimaASaquearA(victima)
 			 
 	method maximoDeMonedas() = configuracionSaqueos.maximoDeMonedas()
 	
 	override method cumpleCondicionesParaRealizarla(barco) = victima.esVulnerableA(barco)
 }
 
 object configuracionSaqueos {
 	var property maximoDeMonedas = 0
 }
 
 
 
 
 
 
 
 
 
 