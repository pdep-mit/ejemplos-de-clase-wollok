import clase08.excepciones.*

object granja {
	var property dineroDisponible = 5000
	var property buenasAtenciones = 0
	method image() = "granja.png"
	
	/*
	 * TODO: Agregado para el juego
	 * Cuando la granja le da atención a un animal con un dispositivo queremos que:
	 * - El dispositivo atienda al animal
	 * - Sólo si la atención fue exitosa, gastar tanto dinero como el consumo energético 
	 * del dispositivo y ganar los puntos que correspondan por la buena atención.
	 * - Si la atención no fue exitosa, además de fallar por ese motivo, 
	 * penalizar por la mala atención.
	 * 
	 * Los dispositivos entienden:
	 *   - consumoEnergetico()
	 *   - atender(animal)  <-- Puede fallar por:
	 * 							- NoSePudoAtenderException
	 * 							- NoHayRacionesException
	 */
	method daAtencion(dispositivo, animal){
		const consumo = dispositivo.consumoEnergetico()
		const puntos = self.puntosQueGanaPorBuenaAtencion(dispositivo, animal)
		
		try {
			dispositivo.atender(animal)
			self.gastarDinero(consumo)
			self.ganarPuntos(puntos)
		} catch e : NoSePudoAtenderException {
			self.penalizarPorAtencionFallida()
			
			// Versión que analizamos, pero no cumple con lanzar la excepción del mismo tipo que la que se atrapó:
//
//			throw new NoSePudoAtenderException(message = "No se atendio correctamente al animal",
//				cause = e
//			)

			// Versión que cumple con lo pedido, vale directamente lanzar la excepción que atrapamos nuevamente:
			throw e
		}
				
	}
	method gastarDinero(dinero){
		if(dinero >= dineroDisponible)
			throw new GranjaEnQuiebraException(message = "La granja quebró")
			
		dineroDisponible -= dinero
	}
	method recargar(recargable) {
		self.gastarDinero(500)
		recargable.recargar(20) 
	}
	method puntosQueGanaPorBuenaAtencion(dispositivo, animal) =
		if(dispositivo.esUtilParaAtender(animal)) 5 else 1
	method penalizarPorAtencionFallida(){
		buenasAtenciones = (buenasAtenciones - 3).max(0)
	}
	method ganarPuntos(puntos) {
		buenasAtenciones += puntos 
	}
}
