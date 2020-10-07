// Para hacer pruebas desde el REPL incluyendo todo lo desarrollado
import clase04.estacionDeAtencion.*
import clase04.atencionDeAnimales.Bebedero
import clase05.comederos_v2.*

// Las gallinas quedan igual que la clase anterior
import clase04.atencionDeAnimales.Gallina

class Mamifero {
	var property peso

	method esPesado() = peso > 50

	method caminar(tiempo) {
		peso -= tiempo * self.pesoQuePierdeCaminandoPorHora()
	}

	method pesoQuePierdeCaminandoPorHora()

}

class Vaca inherits Mamifero {

	var property tieneSed = false

	method tieneHambre() = peso < 200

	method beber() {
		tieneSed = false
		peso -= 0.5
	}

	method comer(racion) {
		peso += racion / 3
		tieneSed = true
	}
	
	override method pesoQuePierdeCaminandoPorHora() = 0.2
}

class Cerdo inherits Mamifero {

	var property tieneHambre = false
	var vecesQueComioSinBeber = 0

	method tieneSed() = vecesQueComioSinBeber > 3

	method beber() {
		tieneHambre = true
		vecesQueComioSinBeber = 0
	}

	method comer(racion) {
		peso += (racion - 0.2).max(0)
		vecesQueComioSinBeber += 1
		if (racion > 1) {
			tieneHambre = false
		}
	}
	
	override method pesoQuePierdeCaminandoPorHora()
		= if(self.tieneHambre()) 0.5 else 0.3
}


