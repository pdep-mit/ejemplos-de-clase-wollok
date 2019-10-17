# Pokegotchi

## Parte 1

Estamos haciendo un juego de pokemon similar a un tamagotchi, en el cual vamos a tomar el rol de un entrenador. Un entrenador tiene un equipo de pokemon, y las acciones que puede realizar son:

- Dar de comer: da una baya de comer a su pokemon actual, lo cual le baja 1 de hambre. (como en cada momento solo se puede interactuar con un pokémon a la vez, vamos a tomar que el actual es el primero de su equipo)

- Ordenar al pokémon actual que use su habilidad. La habilidad va a depender de la especie de pokémon en cuestión.

- Cambiar de pokémon actual. El siguiente pokémon actual debería ser el segundo del equipo, la siguiente vez el tercero, y así…

Además, nos interesa saber cuál es la felicidad de los pokémon en cada momento, esto se representa con un número y es igual a su alegría menos su hambre. La forma de calcular la alegría de un pokemon depende de la especie del mismo. El hambre puede aumentar cuando los pokemon utilizan sus habilidades y disminuye en 1 cuando un pokémon come.

Los pokémon que vamos a querer representar son:

### Charmander

Como le gusta el calor, su alegría es igual a la sensación térmica en grados del estadio.
Su habilidad aumenta la temperatura del estadio en 3 grados, y cada vez que la usa aumenta su hambre en 1 unidad.
La sensación térmica del estadio es la temperatura, a menos que esté lloviendo, en ese caso es la mitad.

### Squirtle

La alegría de todos los squirtle es 3, a menos que esté lloviendo en el estadio, en ese caso es 7. Su habilidad hace que se largue a llover, y usarla aumenta su hambre en 3 unidades.

### Bulbasaur

Con su habilidad obtiene energía del sol por lo que disminuye su hambre en 10 si está soleado o en 1 si está lloviendo. La alegría de bulbasaur es igual a 3 por la cantidad de veces que obtuvo energía del sol.

## Parte 2

Ahora nos pidieron que un entrenador le pueda pedir a su pokémon actual que evolucione.

Un pokémon sólo evoluciona si tiene 5 o más de felicidad y su especie tiene una evolución, cuando un pokémon evoluciona cambia su especie (pero mantiene el hambre y cualquier otra cosa que tuviese desde antes).

Las evoluciones para los pokémon que teníamos son:

### Charmeleon

Es la evolución de charmander, su alegría es 5 más la mitad de la temperatura.
Su habilidad sube la temperatura en 3 y le da 2 de hambre.

### Wartortle

La evolución de squirtle, su alegría empieza en 4 y aumenta en 1.2* cada vez que usa su habilidad, la cual también le da 1 de hambre.

### Ivysaur

Un bulbasaur evolucionado, su alegría es 2 * la cantidad de bayas que comió desde que es un Ivysaur, su habilidad hace que deje de llover y aumenta su hambre en 1.
