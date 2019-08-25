import excepciones.*
import hechizos.*

// Definimos una clase abstracta para poder incluir el estado
// y métodos comunes a todos los hechiceros
class Hechicero {
	var property energia
	
	method energiaMagicaMaxima()
	
	method puedeUsarHechizo(unHechizo) 
		= self.tieneSuficienteEnergiaMagica(unHechizo.energiaRequerida())
	
	method tieneSuficienteEnergiaMagica(unaCantidadEnergia) 
		= energia >= unaCantidadEnergia
	
	method usarHechizo(unHechizo, otroHechicero){
		self.validarQuePuedeUsarHechizo(unHechizo)
		unHechizo.usadoSobre(otroHechicero)
		self.consecuenciasDeUsarHechizo(unHechizo)
	}
	
	method disminuirEnergia(unaCantidad) {
		energia -= unaCantidad
	}
	
	method recuperarEnergiaMagica(){
		energia = self.energiaMagicaMaxima()
	}
	
	method validarQuePuedeUsarHechizo(unHechizo){
		if(! self.tieneSuficienteEnergiaMagica(unHechizo)){
			throw new EnergiaMagicaInsuficiente(unHechizo)
		}
	}
	method consecuenciasDeUsarHechizo(unHechizo){}
	
	method promoverAprendizSiCorresponde(unAprendiz){
		// Los requerimientos de la tercera parte no se pueden hacer:
		// No se puede cambiar la clase de self para que sea un archimago
	}
	
}

class Aprendiz inherits Hechicero{
	var property tutor
	
	override method energiaMagicaMaxima() = 50
	
	override method puedeUsarHechizo(unHechizo){
		return self.esInvocable(unHechizo) && super(unHechizo) 
	}
	
	method esInvocable(unHechizo) = unHechizo.energiaRequerida() < 40
	
	override method consecuenciasDeUsarHechizo(unHechizo){
		self.disminuirEnergia(unHechizo.energiaRequerida())
		
		if(self.energia() < self.energiaMagicaMaxima() / 10){
			tutor.usarHechizo(new HechizoCurativo(), self)
		}
		
		tutor.promoverAAprendizSiCorresponde(self)	
	}
	
	override method validarQuePuedeUsarHechizo(unHechizo){
		super(unHechizo)
		if(! self.esInvocable(unHechizo)){
			throw new NoSePuedeInvocarHechizo(message = "El hechizo es muy complejo para un aprendiz")
		}
	}
}

class Archimago inherits Hechicero{
	var property nivel 
	
	override method energiaMagicaMaxima(){
		return 100 + self.nivel() * 2
	}
	
	override method puedeUsarHechizo(unHechizo){
		return !unHechizo.estaProhibido() && super(unHechizo)
	}
	
	override method consecuenciasDeUsarHechizo(unHechizo){
		self.disminuirEnergia(unHechizo.energiaRequerida() / 2)
		
		if(unHechizo.energiaRequerida() > self.energiaMagicaMaxima())
		  self.subirDeNivel()
	}
	
	method subirDeNivel(){
		if(nivel < 20){
			nivel += 1
		} else {
			// Los requerimientos de la tercera parte no se pueden hacer:
			// No se puede cambiar la clase de self para que sea un hechicero supremo
		}
	}
	
	override method validarQuePuedeUsarHechizo(unHechizo){
		super(unHechizo)
		if(unHechizo.estaProhibido()){
			throw new NoSePuedeInvocarHechizo(message = "No se puede invocar un hechizo prohibido")
		}
	}
}

class HechiceroSupremo inherits Hechicero{
	
	override method energiaMagicaMaxima() = 500
	
	override method puedeUsarHechizo(unHechizo) = true
	
	override method validarQuePuedeUsarHechizo(unHechizo){
		// Puede usarlo independientemente de su energía
	}
}

