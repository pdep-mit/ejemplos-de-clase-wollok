# Clase de Clases: Quidditch

El Quidditch es un deporte que juegan los magos y brujas de todo el mundo, donde se enfrentan 2 equipos volando con escobas mágicas.

Queremos armar un sistema usando el paradigma orientado a objetos para modelar este extravagante juego. Se pide workspace, diagrama de clases y métodos para:

1. Saber el nivel de manejo de escoba de un jugador. Esto se calcula como los skills del jugador / su peso.

2. Saber la velocidad de un jugador, que es la velocidad de la escoba que use multiplicado por su nivel de manejo de escoba. Actualmente existen estas escobas:
- Nimbus: La velocidad se calcula como 80 - la cantidad de años desde su fabricación por el porcentaje de salud de la misma. Por ejemplo, una Nimbus 2001 con un 50% de salud tendría una velocidad de (80-12)*0.5 = 34 km/h.
- Saeta de Fuego: es la escoba más veloz fabricada, la velocidad es de 100 km/h.

3. Saber la habilidad de un jugador, que se calcula como su velocidad + sus skills.

4. Saber si un jugador le pasa el trapo a otro; esto sucede si es por lo menos el doble de habilidoso que el otro jugador.

5. Hacer que un jugador sea golpeado por una bludger. Cuando esto pasa el jugador pierde 2 puntos de skills y su escoba recibe un golpe (las Nimbus pierden 10% de salud, a las Saetas de Fuego no les pasa nada).