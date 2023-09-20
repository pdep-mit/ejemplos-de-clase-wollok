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

object rick {
	var property energia = 100
	var poderBase = 200 
	const poderDePistolaDePortales = 50

	method poder() = poderBase + poderDePistolaDePortales
	
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

class Morty {
	var property energia = 50
	const poderBase = 100
	const property dimension
			
	method poder() = poderBase * if(self.estaTraumado()) 3 
								 else 1
	
	method estaTraumado() = energia < 30
	method atacar(contrincante) {
		energia -= 10
	}
}

// Podemos referenciar globalmente a una instancia 
// particular que cumpla el rol del "morty original",
// o sea el de la dimensión a la que pertenece rick.
// En las pruebas que usan la referencia morty se usaría esta instancia,
// pero podríamos instanciar otro para lo que querramos.
const morty = new Morty(dimension = "C-137")



