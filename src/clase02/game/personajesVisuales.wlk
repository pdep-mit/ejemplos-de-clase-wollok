import wollok.game.*
import tomYJerry.*

object tomVisual {
	var property position = game.origin()
	const perseguido = jerryVisual
	
	method image() = "tom.png"  
	
	method configurarJuego(juegoTomYJerry){
		game.addVisualCharacter(self)
		game.onCollideDo(self, {raton => 
			self.atrapado(raton, juegoTomYJerry)
		})
	}
	
	method atrapado(raton, juegoTomYJerry){
		self.comer(raton)
		self.informarEnergia()
		juegoTomYJerry.atrapado(raton)
	}
	
	method corrida(){
		// Ponele que esto da el tiempo a correr
		const tiempo = self.distanciaParaCorrida() /
							1.max(self.velocidad() - perseguido.velocidad())
		tom.correr(tiempo)
		self.position(perseguido.position())
	}
	method distanciaParaCorrida() {
		if(!game.hasVisual(perseguido))
			self.error("Ya no está " + perseguido.nombre() + " para perseguir :(")
			
		return self.position().distance(perseguido.position())
	}
	
	
	method informarEnergia(){
		self.informar("Tengo " + tom.energia().toString() + " joules")
	}
	method informarConveniencia(){
		if(tom.convieneCorrerRatonA(jerry, self.distanciaParaCorrida()))
			self.informar("Es un buen momento para correr!")
		else
			self.informar("No conviene correr ahora")
	}
	
	method informar(texto){
		game.say(self, texto)
	}
	
	// Delegado al tom original	
	method comer(raton){ tom.comer(raton) }
	method velocidad() = tom.velocidad()
	method correr(tiempo){ tom.correr(tiempo) }
}

object jerryVisual {
	var property position  
	method image() = "jerry.png"  
	method nombre() = "Jerry"
	
	method peso() = jerry.peso()
	method velocidad() = jerry.velocidad()
	method atrapado(){
		jerry.acelerar()
	}
	
	method revive() = self.velocidad() < 5
}

object speedyGonzalez {
	var property position
	
	method velocidad() = 7
	method peso() = 2
	method atrapado(){}
	
	method image() = "speedy-gonzalez.png"
	method nombre () = "Speedy"
	
	method revive() = false
}