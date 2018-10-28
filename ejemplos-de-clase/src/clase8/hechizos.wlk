class Hechizo{
	var property energiaRequerida
	var property estaProhibido
	
	method usadoSobre(unHechicero){
		// No importa mucho para el problema
	}
}

class HechizoCurativo {
	method energiaRequerida() = 50
	method estaProhibido() = false
	
	method usadoSobre(unHechicero){
		unHechicero.recuperarEnergiaMagica()
	}
}