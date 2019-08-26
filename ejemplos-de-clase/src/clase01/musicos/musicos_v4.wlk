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
 * Lo que acabamos de hacer fue hacer que maiu sea POLIMÓRFICA con fede, 
 * agregándole los mensajes que necesita para que compartan un tipo.
 * Es importante notar que maiu en ningún momento pregunta quién es el 
 * músico que le pasaron, no importa si era fede o si era maiu. 
 */

object fede {
  var estaSentimental = true
  const cancionero = cancioneroDeFede

  method cancionero() = cancionero
  method estaSentimental() = estaSentimental
  method cambiarDeAnimo() {
    estaSentimental = estaSentimental.negate()
  }

  method tocarAcompaniamiento(cancion){
    // Magia
  }
  
  method elegirCancion() {
    if(estaSentimental) {
       return cancionero.cancionRomantica()
    } else {
       return cancionero.cancionRockera()
    }
  }
  
}
/*
 * Y si le pasan a alguien que no es un músico, el programa se va a romper 
 * obviamente. Por ejemplo si hacemos: maiu.tocaCon(cancioneroDeFede)
 * Eso se va a romper porque cancioneroDeFede no es un músico ni 
 * vamos a pretender que lo sea, o sea que está bien que el programa se rompa, 
 * porque lo estamos usando mal.
 */

object cancioneroDeFede {
	method cancionRomantica() = "More Than Words"
	method cancionRockera() = "Kashmir"
}

 /* 
 * Pero lo importante es que ahora es posible agregar tantos objetos
 * como querramos que respeten esa INTERFAZ y el programa va a 
 * funcionar sin problemas, sin tener que modificar la implementación
 * del método tocarCon(musico) del objeto maiu.
 */