# Stargate

La fuerza aérea tiene un proyecto secreto en el cual a través de un portal interestelar (Stargate) se dedica a la exploración del universo. Necesitamos armar un sistema para poder anticipar los resultados de la exploración.

Para llevar a cabo las expediciones a través del portal se formó el Comando Stargate, que cuenta con varios soldados y la sonda MALP (Mobile Analytic Laboratory Probe) que viajan a los distintos planetas para cumplir con la misión.

Respecto a la MALP, debe ser posible configurarle cuáles son los recursos a buscar en los planetas a explorar, y además tiene una batería que se consume durante las expediciones.

## Parte 1

El Comando Stargate necesita poder determinar si conviene explorar un planeta.

De cada planeta sabemos cuál es su nivel tecnológico y su hostilidad. Consideramos que son peligrosos los planetas cuyo nivel tecnológico multiplicado por su hostilidad es mayor a 70. Debe ser posible determinar si un planeta tiene un recurso en particular.

Para el comando va a ser conveniente explorar el planeta si lo es para alguno de los exploradores (los soldados o la MALP):

  - Para la MALP es conveniente explorar ese planeta si tiene algún recurso de los que debe buscar, y además la MALP tiene más de 5 horas de autonomía. Sabemos que la MALP gasta 250 de batería por hora, con lo cual si tiene 2500 de batería, su autonomía sería de 10 horas.
  - Para un soldado es conveniente explorar el planeta si no es peligroso y todavía no lo exploró.

Además necesitamos hacer que el comando explore un planeta, lo cual **sólo debería llevarse a cabo cuando convenga explorarlo**. De momento lo esperado cuando la exploración efectivamente sucede es que cada explorador viaje al planeta en cuestión y regrese al planeta origen del comando.

Cada vez que un soldado viaja a un planeta que no sea el planeta de origen, debe registrar que exploró ese planeta (no nos interesa registrar más de una vez un mismo planeta). La MALP nada más gasta 100 de batería en cada viaje (no debería poder gastar más batería de la que tiene).

## Parte 2

Queremos incorporar a nuestro sistema a unos soldados que son científicos, así que además de comportarse como los soldados que ya modelamos **deben poder estudiar un planeta**. Cuando estudian un planeta incrementan sus conocimientos adquiridos en 25, y si además todavía no exploraron el planeta en cuestión, suman 100 puntos más de conocimiento.

## Parte 3

Necesitamos contemplar unas diferencias entre los científicos y los demás soldados:

- Para un científico es conveniente explorar un planeta si es más avanzado tecnológicamente que su planeta de origen.

- Tanto a los soldados como a los científicos se los recompensará con medallas por sus aportes a la humanidad. Necesitamos saber cuántas medallas va a recibir cada uno considerando que para cualquier soldado esa cantidad es equivalente a la cantidad de planetas que exploró dividido por 25, y en el caso de los científicos, se les da una medalla extra si sus conocimientos adquiridos son más de 9000.

## Parte 4

Por último, queremos cambiar la forma en la cual el comando **explora** un planeta. Lo que debería hacer cada explorador cuando el comando explora el planeta no es simplemente viajar de ida y de vuelta, sino que debe llevar a cabo una exploración que dure tantas horas como la cantidad de horas de autonomía de la MALP - 1.

La exploración para un explorador consiste en:

  - Primero en viajar al planeta en cuestión, que se convertiría en el planeta actual del explorador (además de impactar al explorador como ya veníamos haciendo con la lógica de viaje anterior).
  - Luego, realizar un reconocimiento:
    - Para la MALP implica gastar su batería en 250 por cada hora de exploración;
    - Para los soldados implica sufrir un daño en su salud equivalente al producto entre la hostilidad del planeta y la cantidad de horas que dura la exploración. Adicionalmente, durante el reconocimiento, los científicos estudian el planeta.
  - Finalmente, si su estado actual se lo permite, la exploración concluye en volver a su planeta. Los soldados pueden regresar si están conscientes, esto ocurre cuando su salud es mayor o igual a 10; y para la MALP, si su batería le alcanza para el viaje de regreso (considerando que necesita 100 de batería para viajar, como se mencionó anteriormente). En caso de que el explorador no pueda regresar, debería quedarse en ese planeta.

Además, nuevamente desde el punto de vista del comando, la exploración se debería llevar a cabo sólo sobre los exploradores que estén en el planeta de origen.
