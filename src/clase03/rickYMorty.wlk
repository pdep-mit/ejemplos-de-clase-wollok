object rick {
  var property energia = 100
  var poderBase = 200
  const poderDePistola = 50
  
  method poder() = poderBase + poderDePistola
  
  method atacarA(contrincante){
  	if(self.poder() > contrincante.poder()){
  		poderBase += 10
  	} else {
  		energia -= 50
  	}
  	contrincante.recibirDanio(self.poder())
  }
  
  method esDeSuDimension(morty)
    = morty.dimension() == "C-137"
}

class Morty {
  var property energia = 50
  const poderBase = 100
  const property dimension
  
  method poder(){
  	if(self.traumado()){
  		return poderBase * 3
  	}
  	else
  	  return poderBase
  }
  
  method traumado() = energia < 30
  
  method atacarA(contrincante){
  	energia -= 10
  }
}

const mortyOriginal = new Morty(dimension = "C-137")


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