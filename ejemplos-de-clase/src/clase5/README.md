#The alchemist and the mysterious objects

Los alquimistas exploran diferentes regiones en busca de materiales para crear todo tipo de objetos y hacer que el mundo sea un lugar feliz. Sin embargo, para conseguir los mejores materiales deben ir a zonas peligrosas en las que hay muchos tipos de monstruos que quieren defender lo que les pertenece. 

Para enfrentar a estos enemigos, los alquimistas poseen diversos ítems de combate que pueden ser: bombas, pociones y debilitadores. Cada ítem fue obtenido por alquimia, por lo que contiene los diferentes materiales que se emplearon para crearlo. Ejemplo: Sophie tiene una bomba, esta bomba la fabricó usando una flor roja, un uni y pólvora.

Un ítem de combate es efectivo si se cumple que:
Bombas: Su daño es mayor a 100 
Pociones: Su poder curativo es mayor a 50 y fue creada con algún material místico
Debilitadores: Infringe algún decrecimiento de los stats del enemigo  (potencia mayor que 0) y además no fue creado con algún material místico

¡Pero eso no es todo! Con el fin de obtener aún mejores materiales, al explorar utilizan diferentes ítems de recolección que… ¡también son creados con alquimia! Es decir, también contienen los elementos de fabricación. Por ejemplo: cañas de pescar, red para atrapar insectos, bolsa de viento mágica que contiene un tornado para obtener los frutos de algún árbol… entre otros objetos cotidianos.

La calidad de los ítems de combate se calcula como: 

 -Bombas: la calidad del material con menor calidad
 -Pociones: calidad del primer material místico, o del primer material de no tener alguno místico
 -Debilitadores: promedio entre los dos ítems de mayor calidad

En cambio, si son de recolección, se considera una base de 30 más la décima parte de la calidad de los materiales con los que fue creado (sin importar con cuántos se haya creado).
 
##Parte A: Los alquimistas

Para llevar un control efectivo del desempeño, los alquimistas nos piden que puedan saber si cumplen algunas condiciones básicas sobre su profesión:

1. Saber si tienen criterio. Esto se cumple si al menos la mitad de sus ítems de combate son efectivos.

2. Saber  si son buenos exploradores, esto se cumple si poseen al menos tres tipos diferentes de ítems de recolección.

3. Saber su capacidad ofensiva, que es la suma de la capacidad de cada ítem de combate. La capacidad de un ítem se calcula como:
   -Bombas: la mitad del daño
   -Pociones: su poder curativo más 10 puntos extras por cada material místico que contiene
   -Debilitadores: un valor por defecto de 50, salvo que contenga algún material místico, en cuyo caso el valor pasa a ser 0.

4. Saber si es profesional, esto se cumple si la calidad promedio de todos sus ítems es mayor a 50, todos sus ítems de combate son efectivos y es buen explorador.

##Parte B: ¡La cosa se pone seria!

También aparecen los monstruos, que tienen puntos de vida, un potencial defensivo y un daño de ataque. Al recibir daño, este se ve reducido según este valor: 
daño real = daño total – potencial defensivo, y además 
vida después del ataque = vida antes del ataque – daño real. 
Si el daño resulta menor que 0 entonces debe considerarse como 0.

Cuando el alquimista usa las bombas en un monstruo le inflige daño, pero el monstruo también lo ataca infligiendo tanto daño como el daño de ataque. Cuando usa las pociones no inflige daño pero se cura tanta vida como su poder curativo. Cuando usa los debilitadores el monstruo pierde tantas unidades de potencial defensivo como potencia tenga el item. 
Tanto la vida como el potencial defensivo no pueden ser menores que 0. Si la vida llega a 0, entonces el monstruo o el alquimista está muerto.

Junto con esto aparece un nuevo requerimiento:

Lograr que un alquimista ataque a un enemigo. Esto consiste en usar algún ítem de combate según alguno de estos criterios:
 -Cómodo: Se elige el primero de los ítems que le pertenezcan
 -Estratégico: Se elige aquel que tenga la mayor capacidad
El alquimista después de usar un item lo pierde y no puede usarlo más.
