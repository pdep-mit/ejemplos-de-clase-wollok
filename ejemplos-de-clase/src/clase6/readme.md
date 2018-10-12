# Pro-bending

En el universo de Avatar existen maestros que controlan los distintos elementos naturales. Muchos usaron estos poderes para la guerra, pero también pueden ser usados para pasarla bien.

Vamos a usar como modelo para este programa un deporte muy divertido llamado pro-bending, arrancando con lo mínimo e iterando para agregar nuevos features.

Nota: a lo largo de la clase agregamos algunas cosas que se escapan de lo que se pide. El código subido incluye todas esas cosas.

## Primera parte

Sabemos que el pro-bending surgió entre maestros tierra que armaban áreas de combate en donde pintaba y se enfrentaban usando las piedras que encontraban por ahí.

Empecemos por modelar a los maestros tierra, para arrancar sabemos que los maestros tierra tienen un poder de ataque igual a un poder base de cada maestro más a la cantidad de piedras en el campo / 3 y un poder de defensa igual a un poder de defensa base  más  la cantidad de piedras en el campo / 5.

En los principios del deporte los pueblos del reino tierra estaban conquistados por la nación del fuego por lo que empezaron a participar maestros fuego.

De los maestros fuego sabemos  que son muy poderosos pero la potencia de sus ataques disminuye con la distancia. El poder de ataque para estos maestros queda determinado por su distancia al centro de la arena (10/distancia) y su poder de defensa es simplemente igual a su distancia del centro. 

### Sobre la resolución

Tenemos 2 clases que nos determinan 2 tipos distintos, MaestroFuego y MaestroTierra. Pero a su vez ambos comparten cosas en común, los mensajes poderDeAtaque y poderDeDefensa. ¿Eso no implica que hay otra clase? cada uno lo resuelve a su manera a sí que no tienen lógica que extraer en una clase en común, pero sí sabemos que existe un TIPO en común entre ambos. Si bien no la programamos en Wollok, en nuestro modelo existe una **interfaz** para representar el tipo Maestro determinada por los mensajes poderDeAtaque y poderDeDefensa, y tanto MaestroFuego como MaestroTierra **implementan** la interfaz Maestro.

## Segunda parte

Con el tiempo empezaron a surgir maestros metal entre los maestros tierra. Estos son maestros tierra que a su vez aprendieron a manejar el metal y llevan placas de metal encima que pueden usar. En un principio queremos modelar la capacidad de equiparse una armadura, con más de 10 placas de metal un maestro metal tiene una armadura.

Sabemos que los maestros metal al equiparse con la armadura tienen una defensa de 1000. Si no tienen armadura, la defensa es igual que para los maestros tierra.

### Sobre la resolución

Los maestros metal como maestros tierra pueden hacer todo lo que un maestro tierra hace y a su vez más cosas como equiparse una armadura con placas de metal. Por eso tiene sentido hacer una clase MaestroMetal que herede de MaestroTierra.

A su vez podemos redefinir un método de MaestroTierra en MaestroMetal ya sea cambiando completamente el comportamiento o agregando una lógica extra usando super, que fue lo que hicimos para el poder de defensa.

## Tercera parte

Agreguemos el comportamiento relativo al enfrentamiento para completar el modelo:

Sabemos que el objetivo del juego es ir empujando a los contrincantes hasta sacarlos del área, empezaremos asumiendo que todos los participantes empiezan en el centro del área y luego de ser retrocedidos 10 metros quedan fuera de juego.

Cuando un jugador ataca a otro lo desplaza siguiendo la fórmula: `desplazamiento = (poder de ataque - poder de defensa / 10)`.

También queremos saber si un maestro está fuera de juego lo cual se cumple si su posición es >= 10.

Algunas particularidades a tener en cuenta:
- Los maestros tierra cuando atacan y cuando son atacados hacen que disminuya en 1 la cantidad de piedras que hay en el campo de juego.
- Sabemos que Toph es una maestra metal muy grosa y única que nunca está fuera de juego.

### Sobre la resolución 

Sabemos que la lógica para recibir un ataque y para saber si está fuera de juego es igual para todos los maestros, entonces surge la idea de hacer que Maestro sea una clase abstracta. Podemos llevar los atributos en común (en este caso sería la posición) entre los distintos maestros a la clase abstracta también.

En la clase Maestro no tenemos una lógica general para poderDeAtaque y poderDeDefensa, así que los definimos sin cuerpo: son métodos abstractos. Una clase con métodos abstractos necesariamente es abstracta, pero no necesariamente todas las clases abstractas tienen métodos abstractos. Si no tiene sentido que existan instancias de esa clase, entonces se considera abstracta.

Vemos que es posible hacer que un objeto herede de una clase también, que es lo que hicimos para modelar a Toph.