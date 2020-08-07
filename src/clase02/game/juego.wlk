import wollok.game.*
import personajesVisuales.*

const tom = tomVisual
const jerry = jerryVisual

object juego {
	const respawnMillis = 2000
	method configurar(){
		tom.configurarJuego(self)
		self.agregarRaton(jerry)
		self.configurarTeclas()
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
	
	method configurarTeclas() {
		keyboard.space().onPressDo { tom.corrida() }
		keyboard.i().onPressDo { tom.informarConveniencia() }
		keyboard.s().onPressDo {self.agregarRaton(speedyGonzalez)}
	}
	
	// Evento de colisión
	method atrapado(raton){
		raton.atrapado()
		self.quitarRaton(raton)
		
		if(raton.revive())
			self.agregarRaton(raton)
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