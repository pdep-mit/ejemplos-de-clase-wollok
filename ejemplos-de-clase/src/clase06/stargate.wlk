object comando {
	const exploradores = #{}
	const property planetaOrigen = new Planeta()
	
	method leConvieneExplorar(unPlaneta)
		= exploradores.any({explorador => 
			explorador.leConvieneExplorar(unPlaneta)
		})
		
	method explorar(unPlaneta){
		if(!self.leConvieneExplorar(unPlaneta)){
			self.error("No le conviene explorar el planeta")
		}
		
		self.exploradoresEnElPlaneta().forEach {explorador =>
				const horas = malp.autonomia() - 1
				explorador.explorar(unPlaneta, horas)
			}
	}
	method exploradoresEnElPlaneta()
		= exploradores.filter {explorador => 
			explorador.planetaActual() == self.planetaOrigen()
		}
}
 
class Explorador {
	var property planetaActual
	
	method explorar(unPlaneta, horas){
		self.viajaA(unPlaneta)
		self.reconocimiento(unPlaneta, horas)
		
		if(self.puedeVolver())
			self.viajaA(self.planetaOrigen())
	}
	
	method viajaA(unPlaneta){
		planetaActual = unPlaneta
	}
	
	method reconocimiento(unPlaneta, horas)
	method puedeVolver()
	
	method planetaOrigen() = comando.planetaOrigen()
}
class Soldado inherits Explorador {
	const planetasVisitados = #{}
	var property salud

	override method reconocimiento(unPlaneta, horas){
		self.sufriDanio(unPlaneta.hostilidad() * horas)
	}
	
	method sufriDanio(danio){
		salud = 0.max(salud - danio)
	}
	
	override method puedeVolver() = self.salud() >= 10
	
	method leConvieneExplorar(unPlaneta)
		= ! unPlaneta.peligroso() && ! self.visito(unPlaneta)
	method visito(unPlaneta) = planetasVisitados.contains(unPlaneta)
	
	override method viajaA(unPlaneta){
		if(unPlaneta != self.planetaOrigen())
			planetasVisitados.add(unPlaneta)
		super(unPlaneta)
	}
	
	method cantidadDeMedallasQueMerece() 
		= planetasVisitados.size().div(25)
}

class Cientifico inherits Soldado {
	var conocimientosAdquiridos = 0
	
	method estudiar(unPlaneta){
		conocimientosAdquiridos += 25
		if(!self.visito(unPlaneta)){
			conocimientosAdquiridos += 100
		}
	}
	
	override method reconocimiento(unPlaneta, horas){
		super(unPlaneta, horas)
		self.estudiar(unPlaneta)
	}
	
	override method leConvieneExplorar(unPlaneta)
		= unPlaneta.masAvanzadoQue(self.planetaOrigen())
		
	override method cantidadDeMedallasQueMerece() 
		= super() + self.extraPorConocimiento()
			
	method extraPorConocimiento() {
		if(conocimientosAdquiridos > 9000)
			return 1
		else return 0
	}
}

object malp inherits Explorador {
	var property recursosABuscar = []
	var property bateria
	
	method leConvieneExplorar(unPlaneta)
		= recursosABuscar.any({recursoBuscado =>
			unPlaneta.tieneRecurso(recursoBuscado)
		}) && self.tieneAutonomiaSuficienteParaExploracion()
		
	method tieneAutonomiaSuficienteParaExploracion()
		= self.autonomia() > 5
		
	method autonomia() = bateria / 250
			
	override method viajaA(unPlaneta){
		// TODO: ver si esta bien que si no tiene bateria suficiente
		// se quede en 0 y viaje igual
		self.gastarBateria(self.bateriaNecesariaParaViajar())
		super(unPlaneta)
	}
	
	method gastarBateria(cantidad){
		bateria = 0.max(bateria - cantidad)
	}
	override method reconocimiento(unPlaneta, horas){
		self.gastarBateria(horas * 250)
	}
	override method puedeVolver() {
		return self.bateriaNecesariaParaViajar() <= self.bateria()
	}
	method bateriaNecesariaParaViajar() = 100
}
class Planeta {
	const property hostilidad
	const property nivelTecnologico
	const property recursos = []
	
	method peligroso() 
		= self.hostilidad() * self.nivelTecnologico() > 70
		
	method tieneRecurso(recurso) = recursos.contains(recurso)
	
	method masAvanzadoQue(otroPlaneta) 
		= self.nivelTecnologico() > otroPlaneta.nivelTecnologico()
}