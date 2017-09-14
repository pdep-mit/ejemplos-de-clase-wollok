# Clase de Clases: Quidditch

Seguimos con el enunciado de Quidditch. Hasta ahora lo que teníamos era una clase Jugador, y los distintos tipos de escobas que podían usar.

1. Ahora se incorpora a nuestro modelo un nuevo tipo de jugador, los guardianes. Estos se comportan de la misma manera que el resto de los jugadores exceptuando que tienen también un nivel de reflejo (que siempre arranca en 20) y además pueden concentrarse, lo cual les mejora su nivel de reflejo en 10.

2. Los guardianes también se diferencian de los jugadores comunes en el cálculo de la habilidad. La habilidad de un guardián es su nivel de reflejo + sus skills, la velocidad no es relevante.

3. Se agregan dos nuevas posiciones de Quidditch, los cazadores y los golpeadores. Ambos son también jugadores, la diferencia que calculan su habilidad de forma diferente. Para los cazadores su habilidad de calcula a partir de su velocidad + sus skills + su puntería / su peso. Y para los golpeadores se calcula en base a su velocidad + sus skills + su fuerza.