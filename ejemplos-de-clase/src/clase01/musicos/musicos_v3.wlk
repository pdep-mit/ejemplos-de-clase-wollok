/*
 * La solución anterior ya no mete ruido para el problema que teníamos :)
 * Pero ahora nos planteamos, qué pasa si maiu quisiera poder tocar con
 * otros músicos, no sólo con fede, manteniendo el algoritmo general 
 * al que llegamos, y sin repetir lógica?
 * 
 * En primer lugar tenemos que cambiar algo que está hardcodeado y es 
 * con quién es que va a tocar maiu. En vez de describir la solución 
 * mandándole mensajes a fede (referencia global), deberíamos cambiarla 
 * para hablar con un músico (que podría ser fede, o podría no ser fede). 
 * Ese músico pasaría a ser un parámetro del método que ahora llamaremos tocarCon.
 * 
 * Entonces para lograr el mismo resultado que antes lográbamos mandando 
 * el mensaje: maiu.tocarConFede() 
 * Ahora lo lograremos mandando el mensaje: maiu.tocarCon(fede)
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
}

/*
 * Luego cabe preguntarse, qué tiene que cumplir un objeto para que 
 * sea un músico válido para este programa? Necesita entender los mensajes
 * elegirCancion que no recibe parámetros y retorna una canción, 
 * y tocarAcompaniamiento que recibe una canción y no retorna nada,
 * sino que lo esperado es que produzca un efecto (hacer que la canción suene).
 * 
 * De esto se desprende la idea de qué es un TIPO en este paradigma?
 * Es el conjunto de mensajes que tiene que entender el objeto para 
 * considerarse de ese tipo. De esa forma quienes lo usan tienen la certeza 
 * de que pueden mandarle cualquiera de esos mensajes sin que surjan errores 
 * de que el objeto no entiende el mensaje que le está mandando.
 */

// No hace falta que fede cambie para lo que estamos haciendo :)
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

object cancioneroDeFede {
	method cancionRomantica() = "More Than Words"
	method cancionRockera() = "Kashmir"
}
