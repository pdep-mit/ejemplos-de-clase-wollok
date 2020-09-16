object rick {
  // TODO: implementar a Rick
}

object morty {
  // TODO: implementar a Morty
}


// ALIENS

object gromflomite {
	var property energia = 100
	method recibirDanio(danio){
		energia = energia-danio/5
	}
	method poder() = 50
}

object glorzo {
	var property anfitrion
	method recibirDanio(danio){
		anfitrion.energia(anfitrion.energia() - danio)
	}
	method poder() = anfitrion.poder()
}