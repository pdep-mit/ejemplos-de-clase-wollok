# Ejercicio integrador #1: Los Glaciares

Los glaciares son grandes masas de hielo que descienden de las montañas y se mantienen en ese estado gracias a las continuas nevadas que caen sobre ellos. Un glaciar desemboca en un solo lugar, que puede ser otro glaciar o una masa de agua (o sea, un río o un lago). Es allí donde van cayendo los témpanos que se desprenden cada tanto del glaciar.

La masa de un glaciar aumenta normalmente por las nevadas diarias (la nevada en sí queda fuera del modelo que queremos desarrollar) y a causa de los témpanos que caen desde sus afluentes (otros glaciares que desembocan en él), y disminuye por sus propios desprendimientos de témpanos.

Por ejemplo, en el sur argentino, el glaciar Peineta y el glaciar Mayo Norte son afluentes del glaciar Spegazzini, y el glaciar Spegazzini desemboca a su vez en el Lago Argentino. El famoso glaciar Perito Moreno no tiene afluentes, y desemboca también en el Lago Argentino.

Los témpanos (cachos de glaciar que se desprenden y caen) son inicialmente de tipo compacto cuando caen y eventualmente mientras están flotando en el agua se convierten en témpanos de tipo aireado. 

## Se pide

Codificación, puntos de entrada y diagrama de clases para los siguientes requerimientos:

1. Saber si un témpano se ve azul. 
  - Los témpanos compactos se ven azules cuando su parte visible tiene más de 100kg, considerando que la parte visible de un témpano es sólo el 15% de su peso total.
  - Los témpanos aireados no se ven azules nunca.  

2. Saber cuánto enfría el agua un témpano, que es tantos grados como la centésima parte de su peso para los compactos, y medio grado para los aireados.

3. Saber si una masa de agua (lago o río) es atractiva. Lo es cuando tiene más de 5 témpanos flotando y a su vez cada témpano es grande (pesa más de 500kg) ó se ve azul.

4. Saber para un glaciar cuál sería el peso inicial de un témpano si surgiera un desprendimiento. El peso inicial es la millonésima parte de la masa del glaciar multiplicado por la temperatura de su desembocadura.
  - Sabemos que la temperatura de un glaciar es siempre de 1 grado.
  - En general, la temperatura de una masa de agua se calcula como la temperatura ambiente (que es igual para cualquier masa de agua) - la cantidad de grados totales que enfríen los témpanos flotando.
  - Además, en el caso de los ríos, a la temperatura descrita anteriormente se le suma la velocidad a la que se mueve el agua. La velocidad del agua es igual a su velocidad base (es propia de cada río) menos la cantidad de témpanos grandes que tiene.

5. Hacer que se produzca un desprendimiento de un glaciar. Cuando esto sucede, se genera un témpano compacto con el peso inicial correspondiente, el glaciar pierde tanta masa como pese el témpano generado e inmediatamente el mismo cae sobre su desembocadura.

Si el témpano cae en el agua, éste queda flotando a la deriva en ese lago o río. En el caso de caer en otro glaciar, dicho glaciar crece en masa tanto como el peso del témpano.

6. Como cualquier fenómeno natural, los glaciares atraen turistas. Sabemos que hay embarcaciones de distintos tamaños y con distinta fuerza en su motor, queremos agregar a nuestro programa que una embarcación navegue por un lago o un río con el objetivo de predecir qué efectos podría producir sobre su entorno, teniendo en cuenta a su vez que dicha embarcación tal vez no pueda realizar la navegación pedida.

Sólo es posible navegar en un lago con más de 20 témpanos grandes si el tamaño de la embarcación es menor a 10 metros, y además la temperatura del lago no debe ser menor a 0°. En el caso de los ríos, sólo son navegables si la velocidad del agua es menor a la fuerza de la embarcación.

El efecto que se produce al navegar por cualquier masa de agua es que todos los témpanos que están flotando allí pierden 1 kilo, y aquellos témpanos compactos que no sean grandes luego de perder peso se vuelven aireados.