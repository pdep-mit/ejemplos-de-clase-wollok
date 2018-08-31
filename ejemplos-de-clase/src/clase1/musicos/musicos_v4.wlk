/*
 * Será válido entonces hacer esto?
 * maiu.tocarCon(maiu)
 * Con la implementación de la versión anterior de maiu eso no va a funcionar,
 * porque maiu no define métodos para los mensajes que necesita entender
 * para ser de tipo músico.
 * Pero qué pasa si se los definimos?
 */

object maiu {
  method tocarCon(musico){
    const cancion = musico.elegirCancion()
    musico.tocarAcompaniamiento(cancion)
    self.tocarMelodia(cancion)
  }

  method tocarMelodia(cancion){
    // Magia
  }
  
  method elegirCancion() = "All of Me"
  
  method tocarAcompaniamiento(cancion){
  	// Magia
  }
}

/*
 * Con este código, va a ser válido hacer maiu.tocarCon(maiu) ?
 * Sí, porque ahora maiu es de tipo músico porque entiende los mensajes 
 * que se esperan de un músico. Probamos el programa y validamos que funciona.
 * 
 * Lo que acabamos de hacer fue hacer que maiu sea POLIMÓRFICA con feche, 
 * agregándole los mensajes que necesita para que compartan un tipo.
 * Es importante notar que maiu en ningún momento pregunta quién es el 
 * músico que le pasaron, no importa si era feche o si era maiu. 
 * 
 * Y si le pasan a alguien que no es un músico, el programa se va a romper 
 * obviamente. Por ejemplo si hacemos: maiu.tocaCon(cancioneroDeFeche)
 * Eso se va a romper porque cancioneroDeFeche no es un músico ni 
 * vamos a pretender que lo sea, o sea que está bien que el programa se rompa, 
 * porque lo estamos usando mal.
 * 
 * Pero lo importante es que ahora es posible agregar tantos objetos
 * como querramos que respeten esa INTERFAZ y el programa va a 
 * funcionar sin problemas, sin tener que modificar la implementación
 * del método tocarCon(musico) del objeto maiu.
 */

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

object cancioneroDeFeche {
	method cancionDeQueen() = "Crazy Little Thing Called Love"
	method cancionDePinkFloyd() = "Wish You Were Here"
}
