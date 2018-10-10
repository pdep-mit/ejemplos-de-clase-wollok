class MaestroTierra {
	var base = 50
	
	method base() = base
	
	method poderDeAtaque() 
		= self.base() + campo.piedras() / 3
	method poderDeDefensa() 
		= self.base() + campo.piedras() / 5
}
class MaestroMetal inherits MaestroTierra {
	var property placasDeMetal = 0
	constructor(){
		base = 100
	}
	method tieneArmadura() = self.placasDeMetal() >= 10
	method esFuerte() = self.tieneArmadura() 
		|| self.base() > 120
		
	override method poderDeDefensa() {
		if(self.tieneArmadura())
			return 1000
		else
			return self.base()
	}
	
	override method base() = base * 2
}

class MaestroFuego {
	var property distanciaAlCentro = 1
	
	method poderDeAtaque() = 10 / self.distanciaAlCentro()
	method poderDeDefensa() = self.distanciaAlCentro()
}

object campo {
	var property piedras = 100
}