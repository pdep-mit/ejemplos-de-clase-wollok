/**
Puntos de entrada:
1- mision.esUtil(pirata)
2a- barco.puedeFormarParte(pirata)
2b- barco.incorporarATripulacion(pirata)
  -> caso feliz: el barco agrega al pirata a su tripulacion
  -> caso infeliz: lanzamos excepción
2c- barco.mision(mision)
  -> Seguimos la convención de Wollok para el setter, en vez de llamarlo cambiarMision(mision), así no nos quedan
     dos métodos diferentes para cambiar la misión: el setter generado automáticamente por declarar el atributo
     como ver property y el que resuelve este requerimiento que tiene la lógica adicional que no queremos saltear
     usando el setter autogenerado 
3- barco.esTemible()
  -> Opción 1: la lógica general queda en el barco y sólo delega a la misión los 
                requisitos adicionales que dependen del tipo de misión
  -> Opción 2: la lógica general queda en una superclase abstracta Mision y las subclases
                redefinen sólo los requisitos adicionales.
4- barco.itemMasRaro()
5- barco.aclarEn(ciudadCostera)

6- Se agrega subclase EspiaDeLaCorona redefiniendo:
  - pasadoDeGrogXD()
  - seAnimaASaquear(victima)
*/

// Se agregó para una de las variantes del punto 3 (opción 2)
class Mision {
	method puedeRealizarsePor(barco) = barco.tieneSuficienteTripulacionParaHacerUnaMision()
		&& self.cumpleRequisitosParaRealizarla(barco)
		
	method cumpleRequisitosParaRealizarla(barco) = true
	
	// opcional (agregado a pedido del público luego de que apareciera la clase abstracta Mision para el punto 3)
	method esUtil(pirata)
}

// Alternativamente podría ser un objeto único busquedaDelTesoro, ya que no tiene estado interno que impida
// compartir la misma misión entre distintos barcos
class BusquedaDelTesoro inherits Mision {
	
// Primera iteración: lógica repetida
//	method esUtil(pirata) = (pirata.tieneItem(brujula) ||pirata.tieneItem(mapa) ||
//							pirata.tieneItem(botellaDeGrog)) && pirata.monedas() <= 5
				
// Segunda iteración:			
	override method esUtil(pirata) = [brujula, mapa, botellaDeGrog].any {item => pirata.tieneItem(item)}
								 && pirata.monedas() <= 5
				
			
// Primera iteración: se podría delegar más					 
//    method cumpleRequisitosParaRealizarla(barco) 
//    	= barco.tripulacion().any {pirata => pirata.tieneItem(llaveDeCofre)}

// Segunda iteración:	
    override method cumpleRequisitosParaRealizarla(barco) = barco.alguienTieneItem(llaveDeCofre)
}

class ConvertirseEnLeyenda inherits Mision {
	const property itemObligatorio
	override method esUtil(pirata) = pirata.cuantosItemsTiene() >= 10
		&& pirata.tieneItem(itemObligatorio)
		
	// Con la opción 1 del punto 3 esto es necesario, con la opción 2 directamente quedó como
	// default en la superclase Mision:
	// method cumpleRequisitosParaRealizarla(barco) = true
}

class Saqueo inherits Mision {
	const property victima
	
	// Versión 1: delegamos en el pirata pasando a la víctima, que para el punto 1 sólo era un pasamanos
	// porque el pirata delegaba directamente a la víctima. Luego para el punto 6 fue útil haber hecho esto,
	// porque pudimos redefinir seAnimaASaquear(victima) y no hizo falta cambiar nada :D
	override method esUtil(pirata) = pirata.seAnimaASaquear(victima) && pirata.monedas() < self.maximoDeMonedasParaSaquear()
	
	// Versión 2: delegamos directamente a la víctima en vez de pasar por el pirata
	//method esUtil(pirata) = victima.pirataSeAnimaASaquerala(pirata) && pirata.monedas() < self.maximoDeMonedasParaSaquear()
	
	method maximoDeMonedasParaSaquear() = configuracionSaqueo.maximoDeMonedasParaSaquear()
	override method cumpleRequisitosParaRealizarla(barco) = victima.esVulnerableA(barco)
}

// Permite tener una única referencia mutable para que se pueda configurar fácilmente el máximo de monedas
// y que en consecuencia todas las instancias de Saqueo se vean afectadas por dicho cambio
object configuracionSaqueo {
	var property maximoDeMonedasParaSaquear = 0
}

//////////////////////////

class NoSePudoAgregarElPirata inherits DomainException {}

class BarcoPirata {
	const property capacidad
	const property tripulacion = #{}
	var property mision
	
	method puedeFormarParte(pirata) = self.tieneLugarParaUnTripulanteMas() && mision.esUtil(pirata)
	method pirataSeAnimaASaquerala(pirata) = pirata.pasadoDeGrogXD()
	method esVulnerableA(barco) = barco.cantidadDeTripulantes() /2 >= self.cantidadDeTripulantes()
	
	method cantidadDeTripulantes() = tripulacion.size()
	method tieneLugarParaUnTripulanteMas() = self.cantidadDeTripulantes() < capacidad
	method incorporarATripulacion(pirata) {
		if(self.puedeFormarParte(pirata)){
			tripulacion.add(pirata)
		} else {
			throw new NoSePudoAgregarElPirata(message = "No se pudo incorporar el pirata a la tripulación")
		}
	}
	
	method mision(nuevaMision) {
		mision = nuevaMision
		const tripulantesQueSeVan = tripulacion.filter {pirata => not nuevaMision.esUtil(pirata)}
		tripulacion.removeAll(tripulantesQueSeVan)
	}
	
	method tripulantesUtilesParaMisionActual() = tripulacion.filter {pirata => mision.esUtil(pirata)}
	
// Punto 3 - Opción 1
	
//	method esTemible() = self.puedeRealizar(mision) 
//		&& self.tripulantesUtilesParaMisionActual().size() >= 5

//	method puedeRealizar(unaMision) = self.tieneSuficienteTripulacionParaHacerUnaMision()
//	  && unaMision.cumpleRequisitosParaRealizarla(self)
	  

// Punto 3 - Opción 2
	
	method esTemible() = mision.puedeRealizarsePor(self)
			&& self.tripulantesUtilesParaMisionActual().size() >= 5
	
	  
	method tieneSuficienteTripulacionParaHacerUnaMision()
		= self.cantidadDeTripulantes() * 0.9 >= capacidad
	
	method alguienTieneItem(item) = self.tripulacion().any {pirata => pirata.tieneItem(item)}
	method estanTodosPasadosDeGrogXD() = self.tripulacion().all {pirata => pirata.pasadoDeGrogXD()}
	
	method aclarEn(ciudadCostera){
		const losQuePuedenTomar = tripulacion.filter {pirata => pirata.puedePagarTrago(ciudadCostera)}
		losQuePuedenTomar.forEach {pirata => pirata.tomarTragoEn(ciudadCostera)}
		
		tripulacion.remove(self.elMasEbrio())
		ciudadCostera.sumarUnHabitante()
	}
	method elMasEbrio() = tripulacion.max {pirata => pirata.nivelDeEbriedad()}
	
	method itemMasRaro() {
		const todosLosItems = tripulacion.flatMap {pirata => pirata.items()}.asSet()
		return todosLosItems.min {item => tripulacion.count {pirata => pirata.tieneItem(item)} }
	} 
}

class CiudadCostera {
	var property cantidadDeHabitantes
	const property cuantoSaleElTrago
	method pirataSeAnimaASaquerala(pirata) = pirata.nivelDeEbriedad() < 50
	method esVulnerableA(barco) = barco.cantidadDeTripulantes() >= cantidadDeHabitantes * 0.4
		|| barco.estanTodosPasadosDeGrogXD()
	method sumarUnHabitante() { cantidadDeHabitantes += 1 }
}

////////////////////////
class Pirata {
	const property items = []
	var property monedas = 0
	var property nivelDeEbriedad
	
	method pasadoDeGrogXD() = nivelDeEbriedad >= 90 && self.tieneItem(botellaDeGrog)
	method puedePagarTrago(ciudadCostera) = monedas >= ciudadCostera.cuantoSaleElTrago()
	
	// Por más que el barco primero le mande puedePagarTrago, no podemos asumir que siempre
	// se va a hacer el chequeo desde afuera. Este método debería asegurar que si no puede pagar, falle
	method tomarTragoEn(ciudadCostera) {
		if(not self.puedePagarTrago(ciudadCostera))
			throw new MonedasInsuficientesException()
			
		nivelDeEbriedad += 5
		monedas -= ciudadCostera.cuantoSaleElTrago()
	}
	
	method cuantosItemsTiene() = self.items().size()
	
	// Iteración 1: 
	// method tieneItem(item) = items.any {itemQueTiene => itemQueTiene == item}
	
	// Iteración 2: usando un mensaje más apropiado para lo que necesitamos 
	method tieneItem(item) = items.contains(item)
	
	method seAnimaASaquear(victima) = victima.pirataSeAnimaASaquerala(self)
}

class EspiaDeLaCorona inherits Pirata {
	override method pasadoDeGrogXD() = false
	override method seAnimaASaquear(victima) = super(victima) && self.tieneItem(permisoDeLaCorona)
}

class MonedasInsuficientesException inherits Exception {}

// De los ítems lo único que nos interesa es que se puedan comparar por ==

// - Podrían ser simplemente strings, a estos en particular los referenciamos con
// constantes para usarlas desde el código
const brujula = "brújula"
const mapa = "mapa"
const botellaDeGrog = "botella de GrogXD"
const llaveDeCofre = "llave de cofre"
const permisoDeLaCorona ="permiso de la corona"

// - También podrían ser objetos bien conocidos, sin comportamiento agregado, pero siendo que sería esperable
// tener una gran cantidad de ítems más allá de estos que usamos explícitamente, es poco práctico
/*
object brujula {}
object mapa {}
object botellaDeGrog {}
object llaveDeCofre {}
object permisoDeLaCorona {}
*/
 
// - Si se definiera una clase Item con un nombre que los describa
// tendríamos el problema de que a menos que estemos usando la misma instancia de la clase Item para
// los que representan el mismo ítem, a menos que redefinamos la igualdad para que responda true si
// tienen el mismo nombre, esto no va a funcionar como esperamos y tampoco nos agrega mucho valor
// porque no tenían comportamiento particular.
// Así quedaría una solución que cumple con todo lo necesario para usarlos cómodamente 
// y redefiniendo la igualdad, así logramos que esto de true:
//     new Item(nombre = "mapa") == new Item(nombre = "mapa")

/* 
class Item {
	const property nombre
 	override method ==(otroItem) = nombre == otroItem.nombre()
}
 
const brujula = new Item(nombre = "brújula")
const mapa = new Item(nombre = "mapa")
const botellaDeGrog = new Item(nombre = "botella de GrogXD")
const llaveDeCofre = new Item(nombre = "llave de cofre")
const permisoDeLaCorona = new Item(nombre = "permiso de la corona")
*/