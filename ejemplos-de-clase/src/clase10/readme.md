# Wollolok!!!

Con el hype generalizado producido por el anuncio de la salida de Age of Empires 4, un grupo de fanáticos wollokeros nos pidió ayuda para desarrollar una versión (muy) simplificada del juego contemplando algunas nociones básicas y otras más locas que se inventaron.

En el Age los jugadores eligen una civilización y entablan partidas con otros, donde es importante que un jugador recolecte recursos para construir imponentes edificios y eliminar a los jugadores enemigos. Sabemos que en una partida hay varios jugadores, donde los jugadores pueden ser aliados o enemigos dependiendo del equipo en el que estén. Los recursos de los que dispone cada jugador son oro, comida, madera y piedra (seguramente se incorporen más recursos en otro momento). Nunca debería pasar que un jugador gaste más de un recurso de lo que disponía.

Para esto se requiere:

1. Hacer que un jugador explote una mina de un determinado recurso natural (como ser oro o piedra) o un bosque, lo cual debería hacer que el jugador gaste 50 de oro por el simple hecho de trabajar en la explotación y aumente lo que tiene de ese recurso en la cantidad que la mina o el bosque aporte.
Para las minas, que aportan recursos no renovables, la cantidad que aportan del recurso es un valor que puede ir bajando a lo largo del tiempo (cuándo y cómo disminuye este valor para la mina queda fuera del alcance del problema).
Para los bosques, que son renovables, depende de si hay árboles al momento de la explotación. Si hay, aportan 200 unidades de madera, si no hay dan 0 unidades. Al ser explotado, el bosque debe quedar sin árboles.

2. Un jugador debe poder rendirse en cualquier momento de la partida. Cuando esto sucede, el jugador que se rinde envía todos sus recursos a sus aliados que siguen en pie de forma equitativa. Los edificios que tenía el jugador al rendirse se destruyen.

3.Saber para un equipo:

  a. Si fue derrotado, que se da si todos sus jugadores se quedaron sin recursos.

  b. Cuántos edificios construyó durante la partida (incluso los destruidos).

A continuación queremos concentrarnos más en los edificios, que pueden ser de distintos tipos y requieren de ciertos recursos para ser construidos:
- Galería de tiro: requiere 1000 de oro, 500 de madera, 350 de comida (por la mano de obra).
- Fuerte: requiere 2000 de oro, 1500 de piedra, 200 de comida, y 300 de madera.
- Templo: requiere 8000 de oro, 750 de piedra, 500 de comida.

4. Saber si un edificio está en buen estado, lo cual se cumple si su resistencia es al menos un 50% de su resistencia máxima. La resistencia del edificio es la diferencia entre la resistencia máxima y el daño del mismo (que puede subir al ser atacado y bajar mediante reparaciones), con un mínimo de 0.
La resistencia máxima equivale a la suma de la resistencia que aportan los recursos requeridos para construirlo, a menos que el edificio haya sido destruído en cuyo caso la resistencia máxima es 0.

En general se desea configurar cuál es la resistencia que aporta cada tipo de recurso por cada unidad requerida del mismo para la construcción del edificio, de modo que si la madera por ejemplo aportase 5 de resistencia, un edificio con 100 de madera tendrá 500 de resistencia por dicho material.
En el caso del oro se debe considerar que la resistencia que aporta ese recurso se duplica si la cantidad de oro requerida supera 5000.

5. Hacer que un jugador construya un edificio de un tipo determinado, teniendo en cuenta que el jugador debe tener los recursos requeridos para poder construir el edificio en cuestión. Al construirlo, además de consumirle los recursos requeridos al jugador, el nuevo edificio se debe agregar a sus edificios.

6. La gracia de tener edificios es activar su poder especial contra otro equipo:
- Al activar una galería de tiro se lanza un ataque a un edificio conveniente del otro equipo (explicado más abajo). El daño que se realiza al otro edificio es 100 si el otro edificio está en buen estado y el triple si está en mal estado.
- Al activar un fuerte en buen estado se producen 500 unidades de comida para el jugador al que pertenece ese edificio; si el fuerte está en mal estado se repara 20 de daño.
- Además se lanza un ataque de 50 a un edificio conveniente del otro equipo.
- Al activar un templo se convierte a un edificio del otro equipo que pueda ser convertido (cualquiera excepto edificios destruidos y templos), haciendo que su nuevo dueño sea el jugador dueño del templo.
- Activar un edificio destruido no debería producir ningún efecto.

Siempre conviene atacar un templo o un edificio en mal estado, teniendo en cuenta que a un edificio destruido nunca es conveniente atacarlo. Si la resistencia luego del ataque es igual a 0, el edificio se destruye.

7. Por último queremos poder aplicar mejoras sobre los edificios. El costo para el dueño del edificio equivale al 150% de los recursos requeridos para la construcción de ese tipo de edificio. Cuando un edificio pasa a estar mejorado:
No puede ser convertido por otro equipo.
La resistencia máxima del edificio se corresponde a la de los recursos requeridos por la mejora, y al aplicarse la mejora también se arreglan los daños del edificio quedando con su resistencia al máximo.
Activarlo produce los mismos efectos que antes de la mejora.
No debe ser posible mejorar un edificio destruido ni uno mejorado.