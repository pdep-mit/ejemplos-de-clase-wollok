import wollok.game.*
import tomYJerry.*

object speedyGonzalez {
	var property position
	
	method velocidad() = 7
	method peso() = 2
	method atrapado(){}
	
	method image() = "speedy-gonzalez.png"
}

object juego {
	const respawnMillis = 2000
	method configurar(){
		self.configurarATom()
		self.agregarRaton(jerry)
		keyboard.space().onPressDo { self.corrida() }
		keyboard.i().onPressDo { self.info() }
		keyboard.s().onPressDo {self.agregarRaton(speedyGonzalez)}
	}
	
	method configurarATom(){
		tom.position(game.origin())
		game.addVisualCharacter(tom)
		game.onCollideDo(tom, {raton => 
			self.atrapado(raton)
			if(self.revive(raton))
				self.agregarRaton(raton)
		})
	}
	
	method revive(raton)=
		raton.velocidad() < 5
	
	// Evento de colisión
	method atrapado(raton){
		tom.comer(raton)
		raton.atrapado()
		game.say(tom, "Tengo "+tom.energia().toString()+" joules")
		self.quitarRaton(raton)
	}
	
	// Evento de teclado: espacio
	method corrida(){
		// Ponele que esto da el tiempo a correr
		const tiempo = self.distanciaParaCorrida() /
							1.max(tom.velocidad()-jerry.velocidad())
		tom.correr(tiempo)
		tom.position(jerry.position())
	}
	
	// Evento de teclado: i	
	method info(){
		if(tom.convieneCorrerRatonA(jerry, self.distanciaParaCorrida()))
			game.say(tom, "Es un buen momento para correr!")
		else
			game.say(tom, "No conviene correr ahora")
	}
	
	method distanciaParaCorrida() {
		if(!game.hasVisual(jerry))
			self.error("Ya no está Jerry para perseguir :(")
			
		return tom.position().distance(jerry.position())
	}
	
	method agregarRaton(raton) {
		self.spawnearRaton(raton)
		game.onTick(respawnMillis / raton.velocidad(),
					self.respawnEvent(raton),{ self.respawnear(raton) })
	}
	
	method quitarRaton(raton){
		self.despawnear(raton)
		game.removeTickEvent(self.respawnEvent(raton))
	}
	method respawnEvent(raton) = "respawn"+raton.image()
	
	method spawnearRaton(raton){
		const alturaRandom = 1.randomUpTo(game.height()) - 1
		const anchoRandom = 1.randomUpTo(game.width()) - 1
		const posicionRandom = game.at(anchoRandom, alturaRandom)
		raton.position(posicionRandom)
		game.addVisual(raton)
	}
	method despawnear(raton){
		game.removeVisual(raton)		
	}
	method respawnear(raton){
		self.despawnear(raton)
		self.spawnearRaton(raton)
	}
}