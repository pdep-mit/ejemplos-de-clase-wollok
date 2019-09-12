## Pseudo-LoL

Vamos a tratar de modelar simplificadamente un juego onda League of Legends. En esta versión inicial del juego buscamos que hayan personajes (a los cuales llamaremos “campeones”) que deben ser capaces de atacar una torre.

# Parte 1

Tenemos que modelar a los siguientes campeones:
* Zed, el asesino, que cada vez que ataca inflige tantos puntos de daño como su poder de ataque multiplicado por su daño crítico. Inicialmente su poder de ataque es 110 (pero debe poder cambiar) y su daño crítico se corresponde con el del arma que use (20% si usa una espada, 25% si usa un martillo o 5% si usa un arco).
* Fizz, el hechicero, que arranca con 120 de mana y 80 de habilidad, y cada vez que ataca si tiene por lo menos 60 de mana, consume esa cantidad de mana para lanzar un hechizo que realiza tantos puntos de daño como el doble de su habilidad. Si no tiene mana suficiente, solamente se concentra, lo cual incrementa en 25 su mana actual.

Respecto a la torre, inicialmente tiene 500 puntos de vida, la cual decrementa cada vez que recibe daño por parte de un campeón. Eventualmente, si su vida llega a 0, se destruye.

Ya tenemos a la torre parcialmente implementada, necesitamos terminarla e implementar a los campeones:

```wollok
object torre {
  var vida = 500

  method recibirDanio(danioRecibido){
    vida = 0.max(vida - danioRecibido)
  }

  method recibirAtaque(campeon) {
    // TODO: parte del problema que falta resolver
  }
}

object zed {
  // TODO
}

object fizz {
  // TODO
}
```

Lo que queremos hacer (punto de entrada para el requerimiento) es:

```wollok
torre.recibirAtaque(zed)
torre.recibirAtaque(fizz)
```

# Parte 2

Se agrega un nuevo requerimiento. Si luego de ser atacada la torre es destruida, queremos que el campeón suba de nivel.
* En el caso de Zed, subir de nivel implica ganar 75 de daño de ataque.
* En el caso de Fizz, cuando sube de nivel gana 50 de mana y 100 de poder de habilidad.

# Parte 3

Necesitamos que hayan varias torres, no sólo una. Todas las torres deberían comportarse igual que la que ya programamos y por defecto deberían tener 500 puntos de vida inicialmente, al igual que la torre que ya programamos.

# Parte 4

Resulta que Zed y Fizz tampoco eran tan especiales. Dijimos que Zed es un asesino y Fizz es un hechicero, y vamos a querer tener más de un asesino y más de un hechicero, pero nos va a interesar que cada campeón tenga valores distintos al momento de crearlos (no hay buenos defaults para esta información).

¿Qué haría falta modificar sobre la solución a la que llegamos para lograr esto?