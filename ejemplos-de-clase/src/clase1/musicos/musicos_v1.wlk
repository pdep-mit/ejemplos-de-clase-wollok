object feche {
  var estaContento = true
  const cancionero = cancioneroDeFeche

  method cancionero() = cancionero
  method estaContento() = estaContento
  method cambiarDeAnimo() {
    estaContento = estaContento.negate()
  }

  method tocarAcompaniamiento(cancion){
    // Magia
  }
}

object maiu {
  method tocarConFeche(){
    var cancion
    if(feche.estaContento()) {
        cancion = feche.cancionero().cancionDeQueen()
    } else {
        cancion = feche.cancionero().cancionDePinkFloyd()
    }

    feche.tocarAcompaniamiento(cancion)
    self.tocarMelodia(cancion)
  }

  method tocarMelodia(cancion){
    // Magia
  }
}

object cancioneroDeFeche {
	method cancionDeQueen() = "Crazy Little Thing Called Love"
	method cancionDePinkFloyd() = "Wish You Were Here"
}