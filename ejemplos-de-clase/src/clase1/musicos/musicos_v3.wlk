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
  
  method elegirCancion() {
    if(estaContento) {
       return cancionero.cancionDeQueen()
    } else {
       return cancionero.cancionDePinkFloyd()
    }
  }
  
}

object maiu {
  method tocarCon(musico){
    const cancion = musico.elegirCancion()
    musico.tocarAcompaniamiento(cancion)
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