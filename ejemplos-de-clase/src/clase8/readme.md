# Herencia vs Composición

## Primera parte

Queremos armar un programa donte tenemos hechiceros que se comportan de formas diversas dependiendo de si son aprendices de brujo, archimagos o hechiceros supremos.

De un hechicero queremos:
- Saber cuál es la energía mágica máxima.
  - En el caso de los aprendices es 50.
  - Para los archimagos es 100 + el doble de su nivel.
  - Para los hechiceros supremos es 500.
- Saber si puede usar cierto hechizo
  - Esto se cumple cuando tienen suficiente energía mágica disponible y aparte:
    - Los aprendices de brujo sólo pueden usar hechizos que requieren menos de 40 de energía mágica.
    - Los archimagos pueden usar cualquier hechizo que no esté prohibido.
  - Los hechiceros supremos pueden usar cualquier hechizo sin importar la cantidad de energía mágica que tengan disponible.

### Sobre la resolución

Avanzamos sobre dos soluciones, una en la cual planteamos subtipos de hechiceros y otra en la cual el hechicero conoce a su rango.

Con estos requerimientos iniciales, ambas soluciones son igual de válidas. La que usa subtipado resulta ser un poco más sencilla, ya que al modelar con un solo objeto al hechicero junto con su rango, de seguro ese objeto va a tener toda la información necesaria para resolver el problema y se aprovecha el method lookup para resolver aquellas cosas que dependen del rango y aquellas que no, y por ende aplican para todos los hechiceros.

Es importanten entender que en la solución con composición si bien estamos usando dos objetos para modelar lo mismo que en la otra solución representábamos con uno solo, la interfaz del hechicero queremos que sea la misma. No queremos desde afuera tener que saber cómo está representado un hechicero, entonces para encapsular bien este detalle de implementación vamos a querer que, independientemente de cuál sea la solución, el punto de entrada sea el mismo, por ejemplo:

Solución de herencia.wlk:
```
const minerva = new Archimago(nivel = 15)
minerva.energiaMagicaMaxima()
```

Solución de composicion.wlk:
```
const minerva = new Hechicero(rango = new Archimago(nivel = 15))
minerva.energiaMagicaMaxima()
```

## Segunda parte

Agregamos otro requerimiento, hacer que un hechicero efectivamente use un hechizo con otro hechicero:
- Si el hechicero que usa el hechizo es aprendiz de brujo, esto le hace perder tanta energía mágica como requiera el hechizo. En caso de que quede con energía mágica por debajo del 10% de su máximo, su tutor (que es otro hechicero) usa el hechizo curativo para que el aprendiz recupere su energía mágica al máximo.
- Si es archimago sólo pierde la mitad de energía mágica requerida para invocar el hechizo (aún así necesita tener disponible la que diga el hechizo para lanzarlo).
- El hechicero supremo no pierde energía mágica.

### Sobre la resolución

Para introducir la idea de tutor, agregamos sólo para los hechiceros aprendices de brujo un atributo tutor que haría referencia a otro hechicero (que podría ser de cualquiera de esos rangos que ya conocemos).

Este requerimiento es posible implementarlo sin problemas en ambas soluciones, siguiendo el mismo enfoque que la parte anterior.

## Tercera parte

Ya vimos que los Aprendices de Brujo tienen un tutor, y nos enteramos que el tutor los habilita para cambiar de rango a Archimago. Cada vez que el aprendiz usa un hechizo, el tutor debe determinar si ya es suficientemente groso para dejar de ser aprendiz. Cada tutor podría tener su propio criterio para evaluar al aprendiz, no nos interesa ahondar en eso ahora mismo.

Luego, como Archimago, es posible subir de nivel cada vez que se usa un hechizo que requiera más del 50% de su energía máxima. A partir del nivel 20, se vuelve Hechicero Supremo, que es el último rango alcanzable.

### Sobre la resolución

Al llegar a este requerimiento ya no da lo mismo qué modelo hayamos elegido para implementar el problema, porque un objeto no puede cambiar de clase, y no podemos sólo crear un nuevo objeto haciendo de cuenta que es el original pero cambiado, porque la identidad de los objetos es importante, y no hay una buena forma de asegurar que todos los que conocían al objeto anterior dejen de conocerlo y referencien a la instancia nueva de la otra clase. Sin embargo no hay ningún problema en cambiar el rango de un hechicero al resolver el problema usando composición.

Dado que no podemos anticiparnos a cualquier requerimiento futuro que podría no ajustarse perfectamente a la solución que hicimos inicialmente, lo mejor es ir por la so,ución más simple y abrazar la idea de que en cualquier momento podría pasar que tengamos que cambiar el modelo, siendo lo más prolijos posibles en el proceso de desarrollo, para que el impacto no sea muy grande en caso de que eso pase. Las buenas abstracciones y el encapsulamiento ayudan mucho en este aspecto.

Si en cambio tenemos información suficiente para saber que las limitaciones de una solución resultarán siendo problemáticas, obviamente lo más práctico es analizar qué otras alternativas existen para no llegar a un problema evitable.

## Para pensar

Podría tener sentido querer **que no todos los hechiceros entiendan el mensaje para saber si un hechicero puede dejar de ser aprendiz** (y cualquier otro mensaje que sea propio de ser un tutor), y por ende no se considerarían tutores.

Qué alternativas hay para que un tutor sea un hechicero que puede tener cualquiera de esos rangos también, sin que sea instancia de la misma clase que instanciamos para crear un hechiciero que no se considera tutor y pudiendo agregar lógica propia de los tutores?

Si no existe una necesidad de que los hechiceros que no son tutores pasen a ser tutores, o que un tutor deje de serlo, en principio se podría plantear una herencia para indicar que un Tutor es un Hechicero, conviviendo con la solución que usa composición para los rangos sin ningún problema. Agregar lógica propia de los tutores en la subclase Tutor resolvería el problema.

Otra alternativa podría ser definir una clase Tutor que conozca un hechicero, y que delegue en el hechicero cuando haga falta. De esa forma el tutor puede entender más mensajes de los que entienden los hechiceros y para aquellos métodos para los cuales que queremos que se comporte como un hechicero común, se puede delegar en la instancia de Hechicero. Esta solución es más compleja porque nuevamente hay más de un objeto para representar una misma idea, y la mecánica se puede llegar a complicar más de lo que queremos y tener problemas luego a los cuales no nos anticipamos (por ejemplo, redefinir cosas en el tutor sería trivial usando herencia, pero con esta solución una vez que delegamos algo al hechicero difícilmente podamos usar lógica propia del tutor, porque desde el código del hechicero `self` es la instancia de Hechicero, no de Tutor).

Como conclusión, ya vimos que existe más de un mecanismo para modelar problemas similares. Es importante no sólo saber manejar ambos sino también entender las consecuencias que trae aparejada cada solución. La herencia simple es muy útil, pero está lejos de ser una bala de plata, por eso a medida que van surgiendo problemas más complejos toma más importancia ser capaces de solucionarlos de más de una forma para luego decidir cuál es más adecuada, para evitar problemas a futuro sin volvernos locos.