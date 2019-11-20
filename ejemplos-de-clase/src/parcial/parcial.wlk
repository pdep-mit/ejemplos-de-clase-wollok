/*
 * Solución posible: Club de Duelo 
 * 
 * Puntos de entrada:
 * 
 * Parte 1:
 *  a) hechizo.impactoEnResistencia(hechiceroQueLoUsa, contrincante)
 *  b) hechicero.lanzarHechizo(hechizo, contrincante)
 *  c) hechicero.hechizoMasConveniente(hechizos, contrincante)
 *  d) balance.valorPara(hechicero)
 * 
 * Parte 2:
 *  a) afecta a: hechizo.conveniencia(hechiceroQueLoUsa, contrincante)
 *  b) afecta a: hechicero.lanzarHechizo(hechizo, contrincante)
 *  c) hechicero.terminoElTurno()
 */
 


class Hechicero {
 	var property resistencia
 	const property resistenciaMaxima
 	
 	var property empatia
 	var property coraje
 	var property conocimiento
 	
 	const property afectadoPorEfectos = []
 	
 	// 1a
 	method resistenciaQuePuedePerder() = self.resistencia()
 	method resistenciaQuePuedeGanar() = self.resistenciaMaxima() - self.resistencia()
 	
 	method diferenciaEnCaracteristica(contrincante, caracteristica)
		= self.valorCaracteristica(caracteristica) - contrincante.valorCaracteristica(caracteristica)	
		
 	method valorCaracteristica(caracteristica) = caracteristica.valorPara(self)
 	
 	// 1b
 	method lanzarHechizo(hechizo, contrincante){
 		self.validarQuePuedeLanzarHechizos() // 2b
 		hechizo.lanzadoPor(self, contrincante)
 	}
 	method perderResistencia(cantidad){
 		resistencia -= self.resistenciaQuePuedePerder().min(cantidad)
 	}
 	method ganarResistencia(cantidad){
 		resistencia += self.resistenciaQuePuedeGanar().min(cantidad)
 	}
 	
 	// 1c
 	method hechizoMasConveniente(hechizos, contrincante)
 		= hechizos.max{hechizo => hechizo.conveniencia(self, contrincante)}
 		
 	// 2b
	method validarQuePuedeLanzarHechizos() {
		 if(! self.afectadoPorEfectos().all({efecto => efecto.permiteLanzarHechizos()}))
		 	self.error("No se puede lanzar hechizos")
	}
	method quedarBajoEfectoDuradero(efectoAIncorporar){
		self.afectadoPorEfectos().add(new EfectoTransitorio(efecto = efectoAIncorporar))
	}
	
	// 2c
	method terminoElTurno(){
		self.afectadoPorEfectos().forEach { efecto =>
			efecto.terminoElTurno(self)
		}
		self.descartarEfectosCaducados()
	}
	
	method descartarEfectosCaducados(){	
		var efectosCaducados = self.afectadoPorEfectos().filter { efecto =>
			not efecto.sigueAfectando()
		}
		self.afectadoPorEfectos().removeAll(efectosCaducados)
	}
 }
 
 // Características 1a
 object empatia {
 	method valorPara(hechicero) = hechicero.empatia()
 }
 object coraje {
 	method valorPara(hechicero) = hechicero.coraje()
 }
 object conocimiento {
 	method valorPara(hechicero) = hechicero.conocimiento()
 }
 
 // 1d
 object balance {
 	method valorPara(hechicero) 
 		= #{empatia, coraje, conocimiento}.sum {caracteristica => caracteristica.valorPara(hechicero)} / 3
 }
 
 class Hechizo {
 	const property potencia
 	const property caracteristica
 	
 	const property efectosDuraderosQueGenera = []
 	
 	//1a
	method impactoEnResistencia(hechiceroQueLoUsa, contrincante){
		return 0.max(self.potencia() + 2 * hechiceroQueLoUsa.diferenciaEnCaracteristica(contrincante, caracteristica))
				.min(self.maximoImpactoPosible(hechiceroQueLoUsa, contrincante))
	}
	
	method maximoImpactoPosible(hechiceroQueLoUsa, contrincante) 
	
	//1b
	method lanzadoPor(hechicero, contrincante){
		self.impactarResistencia(hechicero, contrincante)
		self.generarEfectosDuraderos(self.hechiceroSobreElCualSeLanza(hechicero, contrincante)) //2b
	}
	method impactarResistencia(hechicero, contrincante)
	
 	//1c
 	method conveniencia(hechiceroQueLoUsa, contrincante) 
 		= self.impactoEnResistencia(hechiceroQueLoUsa, contrincante)
 			+ self.convenienciaPorEfectosDuraderos() //2a
 		
 	//2a
	method convenienciaPorEfectosDuraderos() 
		= self.efectosDuraderosQueGenera().sum {efectoDuradero => efectoDuradero.conveniencia()}

	//2b
	method generarEfectosDuraderos(hechiceroImpactado){
		self.efectosDuraderosQueGenera().forEach({efectoDuraderoAGenerar =>
			hechiceroImpactado.quedarBajoEfectoDuradero(efectoDuraderoAGenerar)
		})
	}
	// En base a hechiceroSobreElCualSeLanza se podrían refactorizar maximoImpactoPosible e impactarResistencia
	// para evitar repetir esta idea de que los de ataque impactan al contrincante y los curativos impactan al que lo usa
	method hechiceroSobreElCualSeLanza(hechiceroQueLoUsa, contrincante) 
	
 }
 
 class HechizoDeAtaque inherits Hechizo {
 	//1a
 	override method maximoImpactoPosible(hechiceroQueLoUsa, contrincante)
 		= contrincante.resistenciaQuePuedePerder()
 		
 	//1b
 	override method impactarResistencia(hechiceroQueLoUsa, contrincante){
 		contrincante.perderResistencia(
 			self.impactoEnResistencia(hechiceroQueLoUsa, contrincante)
 		)
 	}

 	//1c
 	override method conveniencia(hechiceroQueLoUsa, contrincante){
 		if(self.impactoSuficienteParaTerminarElDuelo(hechiceroQueLoUsa, contrincante)) 
 			return 2 * super(hechiceroQueLoUsa, contrincante)
 		else 
 			return super(hechiceroQueLoUsa, contrincante)

 	}
	method impactoSuficienteParaTerminarElDuelo(hechiceroQueLoUsa, contrincante) 
		= self.impactoEnResistencia(hechiceroQueLoUsa, contrincante) >= contrincante.resistenciaQuePuedePerder()
	
	//2b
	override method hechiceroSobreElCualSeLanza(hechiceroQueLoUsa, contrincante) = contrincante
 }
 
 class HechizoCurativo inherits Hechizo {
 	 //1a
 	override method maximoImpactoPosible(hechiceroQueLoUsa, contrincante)
 		= hechiceroQueLoUsa.resistenciaQuePuedeGanar()
 		
 	//1b
 	override method impactarResistencia(hechiceroQueLoUsa, contrincante){
 		hechiceroQueLoUsa.ganarResistencia(
 			self.impactoEnResistencia(hechiceroQueLoUsa, contrincante)
 		)
 	}
 	
 	//2b
 	override method hechiceroSobreElCualSeLanza(hechiceroQueLoUsa, contrincante) = hechiceroQueLoUsa
 }
 
 class EfectoDuradero {
 	const property turnosQueDura
 	
 	// 2a
 	method conveniencia() = self.multiplicadorConveniencia() * self.turnosQueDura()
	method multiplicadorConveniencia()
	
	// 2b
	method permiteLanzarHechizos() = true
	
	// 2c
	method terminoElTurno(hechiceroAfectado){
 		// Por default no se hace nada.
 		// Redefinir si sí hay un efecto a producir por el fin del turno.
 	}
 } 
 
 class CuracionDiferida inherits EfectoDuradero {
 	const property resistenciaACurar
 	
 	override method multiplicadorConveniencia() = 2 * resistenciaACurar
 	
 	override method terminoElTurno(hechiceroAfectado){
 		hechiceroAfectado.ganarResistencia(resistenciaACurar)
 	}
 }
 class DanioDiferido inherits EfectoDuradero {
 	const property resistenciaAReducir
 	
 	override method multiplicadorConveniencia() = 3 * resistenciaAReducir
 	
 	override method terminoElTurno(hechiceroAfectado){
 		hechiceroAfectado.perderResistencia(resistenciaAReducir)
 	}
 }
 class Aturdimiento inherits EfectoDuradero {
 	override method multiplicadorConveniencia() = 5
 	override method permiteLanzarHechizos() = true
 }
 
// Se separa al efecto duradero a generar por un hechizo del efecto que está afectando a un hechicero.
// De esa forma un mismo efecto puede ser usado tantas veces como se quiera, incluso en paralelo.
class EfectoTransitorio {
	const property efecto
	var property turnosTranscurridos = 0
	
	method terminoElTurno(hechiceroAfectado){
		turnosTranscurridos += 1
		efecto.terminoElTurno(hechiceroAfectado)
	}
	
	method sigueAfectando() = turnosTranscurridos < efecto.turnosQueDura()
	
	method permiteLanzarHechizos() = efecto.permiteLanzarHechizos()
}