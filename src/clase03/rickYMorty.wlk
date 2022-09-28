// ALIENS

class Gromflomite {
	var property energia = 100
	method recibirDanio(danio){
		energia = energia-danio/5
	}
	method poder() = 50
}

class Glorzo {
	var property anfitrion
	method recibirDanio(danio){
		anfitrion.energia(anfitrion.energia() - danio)
	}
	method poder() = anfitrion.poder()
}

// RICK Y MORTY

class Morty {
	var property energia = 50
	const property dimension
	
	const poderBase = 100
	
	method poder() = if(self.traumado()) poderBase else poderBase * 3
	
	method atacar(contrincante){
		energia -= 10
	}
	
	method traumado() = energia < 30
}

const mortyOriginal = new Morty(dimension = "C-137")

object rick {
	var property energia = 100
	
	var poderBase = 200
	var property pistolaDePortales = pistolaOficial
	
	// Alternativa sin definir objetos independientes para las pistolas de portales
	/*
	const poderDePistolaDePortales = 50
	method poder() = poderBase + poderDePistolaDePortales
	 */
	 
	// Alternativa delegando en otro objeto que represente a la pistola de protales
	method poder() = poderBase + pistolaDePortales.poder()
	
	method atacar(contrincante) {
		if(self.poder() > contrincante.poder()){
			poderBase += 10
		} else {
			energia -= 50
		}
		
		contrincante.recibirDanio(self.poder())
	}
	
	method esDeSuDimension(unMorty) = unMorty.dimension() == "C-137"
}

object pistolaOficial {
	//method poder() = 50
	
	// Equivalente con sintaxis de llaves
	method poder() {
		return 50
	} 
}