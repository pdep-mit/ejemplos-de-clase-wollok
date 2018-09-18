import ninios.*
import armas.*
import alimentos.*
import demogorgon.*

object grupoDeAmigos {
	var grupo = [mike, eleven, dustin, lucas]
	
	method comerBarraDeCereal(){
		grupo.min({integrante => integrante.vida()}).comer(barraDeCereal)
	}
	method danioQueCausa(){
		return grupo.sum({integrante => integrante.danioQueCausa()})
	}
	method puedeAtacar(rival){
		return self.danioQueCausa() > rival.danioQueCausa()
	}
	
	method atacar(rival){
		rival.sufrirDanio(self.danioQueCausa())
		self.sufrirDanio(rival.danioQueCausa())
	}
	
	method sufrirDanio(cantidad){
		grupo.map({integrante => integrante.perderVida(cantidad)})
	}
	
	method estaHerido(){
		grupo.all({integrante => integrante.estaHerido()})
	}
	
	method alimentar(alimento){
		grupo.forEach({integrante => integrante.comer(alimento)})
	}
}