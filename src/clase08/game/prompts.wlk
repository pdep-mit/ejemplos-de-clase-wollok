import wollok.game.*
import clase08.game.juegoGranja.*

class Prompt {
	method image()
	method position() = game.at(4, 4)
	method mostrar(){
		if(not game.hasVisual(self)){
			self.configurarAcciones()
			game.addVisual(self)
		}
	}
	method ocultar(){
		if(game.hasVisual(self))
			game.removeVisual(self)
	}
	method configurarAcciones()
}
object promptError inherits Prompt {
	override method image() = "prompt_error_salir.png"
	override method configurarAcciones(){
		keyboard.enter().onPressDo { self.ok() }
	}
	method ok(){
		game.stop()
	}
	
}

class PromptRecargar inherits Prompt {
	const recargable
	override method image() = "prompt_recarga.png"
	override method configurarAcciones(){
		keyboard.s().onPressDo { self.ok() }
		keyboard.n().onPressDo { self.cancelar() }
	}

	method ok() {
		juegoGranja.recargar(recargable)
		self.ocultar()
	}
	method cancelar(){
		self.ocultar()
	}
}