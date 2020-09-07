import wollok.game.*
import personajesVisuales.*

object juegoTomYJerry {
	const respawnMillis = 2000
	const tom = tomVisual
	const jerry = jerryVisual
	
	method jugar(){
		self.configurar()
		game.start()
	}
	
	method configurar(){
		self.configurarVentana()
		tom.configurarJuego(self)
		self.agregarRaton(jerry)
		self.configurarTeclas()
	}
	
	method configurarTeclas() {
		keyboard.space().onPressDo({ tom.corrida() })
		keyboard.i().onPressDo({ tom.informarConveniencia() })
		keyboard.s().onPressDo({self.agregarRaton(speedyGonzalez)})
	}
	
	method agregarRaton(raton) {
		spawner.spawnear(raton)
		game.onTick(respawnMillis / raton.velocidad(),
					spawner.respawnEvent(raton),{ spawner.respawnear(raton) })
	}
	
	method quitarRaton(raton){
		spawner.despawnear(raton)
		game.removeTickEvent(spawner.respawnEvent(raton))
	}
	
	// Evento de colisión
	method atrapado(raton){
		raton.atrapado()
		self.quitarRaton(raton)
		
		if(raton.revive())
			self.agregarRaton(raton)
	}
	method configurarVentana() {
		game.width(15)
		game.height(10)
		game.title("Tom y Jerry")
	}
}

object spawner {
	method respawnEvent(visual) = "respawn"+visual.nombre()
	
	method spawnear(visual){
		const alturaRandom = 1.randomUpTo(game.height()) - 1
		const anchoRandom = 1.randomUpTo(game.width()) - 1
		const posicionRandom = game.at(anchoRandom, alturaRandom)
		visual.position(posicionRandom)
		game.addVisual(visual)
	}
	method despawnear(visual){
		game.removeVisual(visual)		
	}
	method respawnear(visual){
		self.despawnear(visual)
		self.spawnear(visual)
	}
}