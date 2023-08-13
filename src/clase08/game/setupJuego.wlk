import wollok.game.*
import clase08.dispositivos.*
import clase08.animales.*
import clase08.granja.*
import clase08.game.juegoGranja.*

object configuracionJuego {
	const personaje = new PersonajeControlado(animal = gallina)
	method configurar(){
		self.configurarVentana()
		self.configurarVisuales()
	}
	method configurarVisuales(){
		self.configurarDispositivos()
		self.configurarGranja()
		self.configurarPersonaje()
	}
	method configurarVentana() {
		game.width(15)
		game.height(10)
		game.title("Atención de Animales")
	}
	method configurarDispositivos() {
		const comederoNormal 
			= new Comedero(pesoMaximoSoportado = 30, racion = 2)
		const comederoRecargable
			= new ComederoRecargable(pesoMaximoSoportado = 80, 
				racion = 5, stockDeRaciones = 5	)
		const bebedero = new Bebedero()
		const dispositivos = [comederoNormal, comederoRecargable, bebedero]
		game.addVisual(comederoNormal)
		game.addVisual(bebedero)
		game.addVisual(comederoRecargable)
		
		dispositivos.forEach {dispositivo =>
			game.showAttributes(dispositivo)
			game.onCollideDo(dispositivo, {animalControlado => 
				animalControlado.atenderEn(dispositivo)
			})
		}
		
		keyboard.i().onPressDo({
			dispositivos.forEach {dispositivo =>
				game.say(dispositivo, "Consumo: " + dispositivo.consumoEnergetico())
			}
		})
		keyboard.r().onPressDo {
			juegoGranja.recargar(comederoRecargable)
		}
	}
	method configurarGranja() {
		game.addVisual(granja)
		game.showAttributes(granja)
	}
	method animal(animalAControlar) {
		personaje.animal(animalAControlar) 
	}
	method configurarPersonaje() {
		game.addVisualCharacter(personaje)	
		
		keyboard.c().onPressDo({ self.animal(cerdo) })
		keyboard.v().onPressDo({ self.animal(vaca) })
		keyboard.g().onPressDo({ self.animal(gallina) })
		
		/// conejo pepito que se rompe
		keyboard.p().onPressDo({ self.animal(conejoPepito) })
	}
}

class PersonajeControlado {
	var property animal
	var property position = game.origin()
	method image() = animal.image()
	
	method atenderEn(dispositivo) {
		juegoGranja.seAtiende(animal, dispositivo)
	}
}

const cerdo = new Cerdo(peso = 50)
const vaca = new Vaca(peso = 110)
const gallina = new Gallina()
