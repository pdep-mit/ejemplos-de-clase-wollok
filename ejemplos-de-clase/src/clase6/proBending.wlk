class MaestroTierra inherits Maestro {
	var base = 50
	
	method base() = base
	
	override method poderDeAtaque() 
		= self.base() + campo.piedras() / 3
		
	override method poderDeDefensa() 
		= self.base() + campo.piedras() / 5
		
	override method atacar(defensor){
		campo.perderPiedra()
        super(defensor)
	}
	
	override method recibirAtaque(atacante){
		campo.perderPiedra()
        super(atacante)
	}
}

class MaestroMetal inherits MaestroTierra {
	var property placasDeMetal = 0
	
	// Definimos un constructor explícito en este caso para mostrar
	// cómo se puede hacer para inicializar distinto el atributo base
	constructor(placas){
		base = 100
		placasDeMetal = placas
	}
	method tieneArmadura() = self.placasDeMetal() >= 10
	method esFuerte() = self.tieneArmadura() || self.base() > 120
		
	override method poderDeDefensa() {
		if(self.tieneArmadura())
			return 1000
		else
			return super()
	}
	
	override method base() = super() * 2
	
}

class MaestroFuego inherits Maestro {
	// Nota: inicialmente teníamos un atributo distanciaAlCentro.
	// Luego de determinar que todos los maestros tienen una posición
	// definimos el mensaje distancia al centro, que ya teníamos de antes, en base a eso.
	method distanciaAlCentro() = self.posicion()
	
	override method poderDeAtaque() = 10 / self.distanciaAlCentro()
	override method poderDeDefensa() = self.distanciaAlCentro()
}

class Maestro {
	var property posicion = 1
	method poderDeAtaque()
	method poderDeDefensa()
	
	method recibirAtaque(atacante){
		posicion += 
			(atacante.poderDeAtaque() - self.poderDeDefensa()) / 10
	}
	method estaFueraDeJuego() = posicion >= 10
	
	method atacar(defensor){
		defensor.recibirAtaque(self)
	}
}

object toph inherits MaestroMetal(20) {
	override method estaFueraDeJuego() = false
}

object campo {
	var property piedras = 100
	// Pusimos esto como ejemplo de lo que podrían ser jugadores válidos.
	// No se puede instanciar Maestro porque es abstracta. Incluso si me dejara,
	// conceptualmente no sería correcto porque desde el punto de vista de dominio,
	// no existen los maestros genéricos
	const jugadores = [new MaestroFuego(posicion = 5), toph, new MaestroMetal(50)]
	
	method perderPiedra(){
		piedras -= 1
	}
}