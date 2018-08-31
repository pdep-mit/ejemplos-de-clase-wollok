/*
 * Hay algo que no nos gusta de la solución anterior, y es que maiu 
 * se está metiendo demasiado en la lógica que le corresponde a feche.
 * Hace falta que maiu le diga a feche cómo hacer para elegir la canción? 
 * Hace falta que maiu sepa que feche tiene un cancionero?
 * La respuesta a ambas preguntas es: NO.
 * 
 * En objetos vamos a querer que cada objeto se encargue de aquellas 
 * cosas que puede resolver por su cuenta, sin necesitar que haya otro 
 * objeto que le indique cómo hacerlo, y que aquellos detalles de 
 * implementación que no haga falta que los otros conozcan, se oculten.
 * 
 * En este caso es responsabilidad de feche saber cómo elegir la canción. 
 * De esa forma puede reutilizar esa lógica en otro contexto sin que tenga 
 * que intervenir maiu, después de todo maiu no tiene nada que ver con por 
 * qué es que feche elige una canción sobre otra cuando tiene que elegir una 
 * canción.
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
  
  // Nuevo método: abstraemos la lógica para elegir la canción
  // Es responsabilidad de feche, por eso lo definimos en este objeto.
  method elegirCancion() {
    if(estaContento) {
       return cancionero.cancionDeQueen()
    } else {
       return cancionero.cancionDePinkFloyd()
    }
  }
  
}

object maiu {
 /*  
  * Ahora maiu no necesita saber tantas cosas para poder tocar con feche!
  * Si el día de mañana feche dejara de necesitar tener un cancionero 
  * para elegir una canción, se puede hacer un cambio de implementación y 
  * el único que se va a ver afectado es feche.
  * Ese es el beneficio que nos da el ENCAPSULAMIENTO.
  */
  method tocarConFeche(){
  	// En esta nueva solución maiu DELEGA en feche 
  	// el problema de elegir la canción.
    const cancion = feche.elegirCancion()
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