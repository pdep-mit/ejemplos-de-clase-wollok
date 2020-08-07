# Tom y Jerry

## Parte 1

Estamos armando un juego en el que tenemos a Tom, el gato, que se la pasa persiguiendo a Jerry, un ratón.

Sabemos que Tom tiene una cantidad de energía que varía a lo largo del juego, dependiendo de sus actividades de comer ratones y de correr. También será relevante la velocidad a la que son capaces de correr Tom y Jerry.

Cuando Tom come un ratón, su energía aumenta en 12 joules + el peso del ratón. La velocidad de Tom es 5 metros x segundo + (energia medida en joules / 10). 

Cuando Tom corre durante una cantidad de segundos indicada, su energía disminuye en (0.5 x cantidad de metros que corrió).

> Observar que la cuenta está en joules consumidos por metro, pero cuando me dicen cuánto corrió, me lo dicen en segundos. La velocidad que se toma es la que corresponde a la energía de Tom antes de empezar a correr, y no varía durante una carrera.

### Pruebas mínimas

Debemos validar que:
- La velocidad de Tom depende de su energía. Por ejemplo, si tiene 20 joules de energía, su velocidad debería ser 7.
- Cuando Tom come un ratón, su energía aumenta en relación al peso del ratón comido.
- Cuando Tom corre una cantidad de segundos, pierde energía. Debería perder más energía cuando corre rápido que cuando corre lento.

## Parte 2

Necesitamos poder determinar si a Tom le conviene correr a un ratón que se encuentra a una distancia indicada (en metros). Esto será cierto si Tom es más veloz que el ratón, y además la energía que gana por comer al ratón es mayor a la que consume corriendo esa distancia.

### Pruebas mínimas

Debemos validar que:
- A Tom le conviene correr a un ratón que le aporta más energía de la que perdería por correrlo
- A Tom no le conviene correr a un ratón que le aporta menos energía de la que perdería corriéndolo
- A Tom no le conviene correr a un ratón que es más veloz que él, independientemente de la distancia a la que se encuentre

## Para pensar

- ¿Tom es capaz de trabajar con otros ratones con la implementación actual?
- ¿Qué hace falta cumplir para ser considerado un ratón?

---------

## Wollok Game

Disponemos de una interfaz gráfica para "jugar al juego". Si Tom consigue atrapar a Jerry se lo come siguiendo la lógica definida, y luego Jerry reaparece más veloz.

Con las flechas se puede mover a Tom de a un casillero sin que eso impacte a su energía. 

Y además:
- Con el espacio se le indica a Tom que corra a Jerry
- Con la tecla i Tom nos dice si le conviene correr a Jerry
- Con la tecla s... pasa algo inesperado