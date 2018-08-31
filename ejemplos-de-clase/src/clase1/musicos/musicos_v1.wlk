/*
* Lo que hace maiu cuando alguien le pide que toque con feche 
* mandando el mensaje maiu.tocaConFeche() es:
* - Preguntarle a feche si está contento…
*   - si dice que sí, pedirle su cancionero y al cancionero 
*     pedirle la canción de Queen
*   - si dice que no, pedirle su cancionero y al cancionero 
*     pedirle la canción de Pink Floyd
* - Darle una orden a feche para que toque el acompañamiento 
*   de la canción que nos dio el cancionero
* - Darse una orden a sí misma para tocar la melodía de esa canción.
 */

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
    /*
     * Cuando un objeto necesita mandarse un mensaje a sí mismo, o si
     * necesitara pasarse a sí mismo por parámetro en otro mensaje,
     * hay que usar la referencia self que todos los objetos tienen y apuntan
     * a sí mismos.
     * Los objetos no hablan en 3a persona, o sea que
     * no vale decir maiu en un método de maiu. Más adelante veremos por qué.
     */
  }

  // el objetivo sería producir un efecto, no lo programamos
  // pero al ejecutarlo en la vida real sí pasan cosas ;)
  method tocarMelodia(cancion){
    // Magia
  }
}

/*
 * El objeto feche tiene dos atributos, uno variable, porque nos
 * interesa que pueda cambiar de ánimo, y el otro constante.
 * Podríamos directamente usar cancioneroDeFeche en todos los lugares
 * donde usamos el atributo cancionero porque cancioneroDeFeche
 * es una referencia global. Fue una decisión nuestra no hacerlo,
 * para mostrar que un objeto puede tener una referencia a un objeto
 * más interesante que simplemente un booleano, y que existen las
 * referencias constantes que a diferencia de las variables, no pueden
 * ser reasignadas.
 */
object feche {
  var estaContento = true
  const cancionero = cancioneroDeFeche

  // Los métodos cancionero() y estaContento() lo único que hacen
  // es retornar el valor al que apuntan dichas referencias.
  // A métodos de ese estilo le llamamos "getters".
  method cancionero() = cancionero
  method estaContento() = estaContento
  
  // Acá vemos cómo es posible modificar el objeto al que apunta
  // una referencia variable, mediante la asignación.
  method cambiarDeAnimo() {
    estaContento = estaContento.negate()
  }

  // el objetivo sería producir un efecto, no lo programamos
  // pero al ejecutarlo en la vida real sí pasan cosas ;)
  method tocarAcompaniamiento(cancion){
    // Magia
  }
}

// Las canciones las vamos a representar con un String
// por una cuestión de simplicidad, ya que no necesitamos nada más que eso
// para lo que necesitamos hacer con ellas.
object cancioneroDeFeche {
	method cancionDeQueen() = "Crazy Little Thing Called Love"
	method cancionDePinkFloyd() = "Wish You Were Here"
}