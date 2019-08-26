/*
 * Hay algo que no nos gusta de la solución anterior, y es que maiu 
 * se está metiendo demasiado en la lógica que le corresponde a fede.
 * Hace falta que maiu le diga a fede cómo hacer para elegir la canción? 
 * Hace falta que maiu sepa que fede tiene un cancionero?
 * La respuesta a ambas preguntas es: NO.
 * 
 * En objetos vamos a querer que cada objeto se encargue de aquellas 
 * cosas que puede resolver por su cuenta, sin necesitar que haya otro 
 * objeto que le indique cómo hacerlo, y que aquellos detalles de 
 * implementación que no haga falta que los otros conozcan, se oculten.
 * 
 * En este caso es responsabilidad de fede saber cómo elegir la canción. 
 * De esa forma puede reutilizar esa lógica en otro contexto sin que tenga 
 * que intervenir maiu, después de todo maiu no tiene nada que ver con por 
 * qué es que fede elige una canción sobre otra cuando tiene que elegir una 
 * canción.
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
  
  // Nuevo método: abstraemos la lógica para elegir la canción
  // Es responsabilidad de fede, por eso lo definimos en este objeto.
  method elegirCancion() {
    if(estaSentimental) {
       return cancionero.cancionRomantica()
    } else {
       return cancionero.cancionRockera()
    }
  }
  
}

object maiu {
 /*  
  * Ahora maiu no necesita saber tantas cosas para poder tocar con fede!
  * Si el día de mañana fede dejara de necesitar tener un cancionero 
  * para elegir una canción, se puede hacer un cambio de implementación y 
  * el único que se va a ver afectado es fede.
  * Ese es el beneficio que nos da el ENCAPSULAMIENTO.
  */
  method tocarConFede(){
  	// En esta nueva solución maiu DELEGA en fede 
  	// el problema de elegir la canción.
    const cancion = fede.elegirCancion()
    fede.tocarAcompaniamiento(cancion)
    self.tocarMelodia(cancion)
  }

  method tocarMelodia(cancion){
    // Magia
  }
}

object cancioneroDeFede {
	method cancionRomantica() = "More Than Words"
	method cancionRockera() = "Kashmir"
}