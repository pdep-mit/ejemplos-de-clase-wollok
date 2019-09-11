object torre {
  var property vida = 500

  method destruida() {
    return vida == 0
  }
  method recibirDanio(danioRecibido){
    vida = 0.max(vida - danioRecibido)
  }

  method recibirAtaque(campeon) {
    campeon.realizarAtaque(self)
  }
}

object fizz {

}

object zed {
}