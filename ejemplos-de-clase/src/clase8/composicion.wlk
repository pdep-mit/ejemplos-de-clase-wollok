import excepciones.*
import hechizos.*

class Hechicero{
	var property rango
	var property energia
	
	method energiaMagicaMaxima() = 
		rango.energiaMagicaMaxima()
	
	
	method puedeUsarHechizo(unHechizo) =
		rango.puedeUsarHechizo(unHechizo, self)
	
	method tieneSuficienteEnergiaMagica(unaCantidadEnergia)
		= self.energia() >= unaCantidadEnergia
	
	method usarHechizo(unHechizo, otroHechicero){
		rango.validarQuePuedeUsarHechizo(unHechizo, self)
		unHechizo.usadoSobre(otroHechicero)
		rango.usarHechizo(unHechizo, self)
	}
	
	method disminuirEnergia(unaCantidad) {
		energia -= unaCantidad
	}
	
	method recuperarEnergiaMagica(){
		energia = self.energiaMagicaMaxima()
	}
	
	method cambiarRango(unRango){
		self.rango(unRango)
	}
	
	method promoverAprendizSiCorresponde(unAprendiz){
		//Se podría agregar cierta lógica para determinar si debería
		//o no promoverse
		unAprendiz.cambiarRango(new Archimago())
	}	
}

class Aprendiz inherits Rango{
	var property tutor

	method energiaMagicaMaxima() = 50

	override method puedeUsarHechizo(unHechizo, unHechicero){
		return self.esInvocable(unHechizo) && super(unHechizo, self)
	}
	
	method esInvocable(unHechizo) = unHechizo.energiaRequerida() < 40
	
	override method usadoSobre(unHechizo, unHechicero){
		unHechicero.disminuirEnergia(unHechizo.energiaRequerida())
		
		// Se le manda energiaMagicaMaxima al hechicero en vez de a self
		// para asegurar que si tiene algo para agregar, pueda hacerlo
		if(unHechicero.energia() < unHechicero.energiaMagicaMaxima() / 10){
			tutor.usarHechizo(new HechizoCurativo(), unHechicero)
		}
		
		tutor.promoverAAprendizSiCorresponde(unHechicero)	
	}
	override method validarQuePuedeUsarHechizo(unHechizo, unHechicero){
		super(unHechizo, unHechicero)
		if(! self.esInvocable(unHechizo)){
			throw new NoSePuedeInvocarHechizo(message = "El hechizo es muy complejo para un aprendiz")
		}
	}
}

class Archimago inherits Rango{
	var property nivel

	method energiaMagicaMaxima() = 100 + self.nivel() * 2

	override method puedeUsarHechizo(unHechizo, unHechicero) {
		return !unHechizo.estaProhibido() && super(unHechizo, self)
	}
	
	override method usadoSobre(unHechizo, unHechicero){
		unHechicero.disminuirEnergia(unHechizo.energiaRequerida() / 2)
		
		// Se le manda energiaMagicaMaxima al hechicero en vez de a self
		// para asegurar que si tiene algo para agregar, pueda hacerlo
		if(unHechizo.energiaRequerida() > unHechicero.energiaMagicaMaxima())
		  self.subirDeNivel(unHechicero)
	}
	
	override method validarQuePuedeUsarHechizo(unHechizo, unHechicero){
		super(unHechizo, unHechicero)
		if(unHechizo.estaProhibido()){
			throw new NoSePuedeInvocarHechizo(message = "No se puede invocar un hechizo prohibido")
		}
	}
	method subirDeNivel(unHechicero){
		if(nivel < 20){
			nivel += 1
		} else {
			unHechicero.cambiarRango(new HechiceroSupremo())
		}
	}
}

class HechiceroSupremo inherits Rango{

	method energiaMagicaMaxima() = 500

	override method puedeUsarHechizo(unHechizo, unHechicero) = true

	override method validarQuePuedeUsarHechizo(unHechizo, unHechicero){
		// Puede usarlo independientemente de su energía
	}
}

class Rango{

	method puedeUsarHechizo(unHechizo, unHechicero) = unHechicero.tieneSuficienteEnergiaMagica(unHechizo.energiaRequerida())

	method usadoSobre(unHechizo, unHechicero){}
	
	method validarQuePuedeUsarHechizo(unHechizo, unHechicero){
		if(! unHechicero.tieneSuficienteEnergiaMagica(unHechizo)){
			throw new EnergiaMagicaInsuficiente(unHechizo)
		}
	}
}
