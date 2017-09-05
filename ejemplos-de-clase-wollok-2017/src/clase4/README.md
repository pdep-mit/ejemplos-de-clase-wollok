# Clase de Colecciones: El ejército de Dany

Los seguidores de Dany son caballeros, ex-mercenarios, ex-esclavos, y ¡dragones! Nos mandó un cuervo con los siguientes requerimientos para implementar en Wollok, y mejorar sus chances para quedarse con el trono de hierro:

1. Dany necesita saber si es una “true queen”, que se cumple si la motivación de todos sus soldados (que pueden ser caballeros, ex-esclavos o ex-mercenarios) es mayor a 100.

2. También desea saber cuáles de sus soldados son kamikazes para mandarlos a una misión suicida.
- Un caballero es kamikaze si es romántico,
- un ex-esclavo si su odio al ex-amo es mayor a 20,
- y un ex-mercenario siempre lo es.

3. Determinar si Dany puede lanzar un ataque aéreo, que se sumple si alguno de sus dragones puede atacar. Un dragón puede atacar si está feliz (si su felicidad es mayor a 50) y si es adulto. Un dragón es adulto si mide más de 15 metros y su potencia de fuego es mayor o igual a 10.

4. Para las reuniones estratégicas, Dany quiere saber la fuerza de su ejército, esto se calcula sumando las fuerzas de todos sus soldados.
- La fuerza del caballero es el triple de su motivación,
- la del ex-mercenario su motivación aumentada en 50,
- y la del ex-esclavo la suma de su motivación y su odio al ex-amo.

5. Nuestra reina quiere saber si puede combatir, que será cierto si la fuerza de su ejército es mayor a 10000 ó si puede lanzar un ataque aéreo.

6. Cuando ella da un discurso, aumenta la motivación de sus soldados:
- Para los caballeros en 70 si es romántico, sino en 30,
- para los ex-esclavos en 20,
- y para los ex-mercenarios en 10.

Además, a sus dragones les aumenta la felicidad en 40 puntos porque les gusta escuchar la voz de su mamá.

7. Finalmente necesitamos simular un ataque aéreo contra un enemigo. Para lanzar un ataque aéreo, Dany busca un dragón apto para la tarea y lo manda a atacar a su enemigo. Cuando un ejército enemigo sufre un ataque aéreo, pierde a la mitad más débil de sus soldados.
