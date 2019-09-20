# Quidditch en acción

Retomando el ejercicio de los equipos de Quidditch, ahora sí vamos a hacer una versión muy naif (por turnos) de cómo jugar al Quidditch. Queremos hacer que un equipo juegue un turno contra otro equipo.

Cuando el equipo juega su turno, cada jugador del equipo en cuestión juega un turno contra el otro equipo, haciendo lo que corresponda para la posición en la que juega.

### Guardianes

El turno del guardián es bastante aburrido, porque no hace nada. Los guardianes están a la espera de que un cazador contrario trate de meter gol, para poder evitarlo.

### Buscadores

Un buscador lo que hace en su turno es perseguir la snitch que implica:
 - Decrementar a la distancia que necesita recorrer para atrapar la snitch (que inicialmente es 1000) en la cantidad correspondiente a su habilidad.
 - Si al final de su turno la distancia bajó hasta 0, su equipo gana 150 puntos.

### Cazadores

El cazador cuando juega, si tiene la quaffle debe intentar meter gol, evitando bloqueos por parte del equipo contrario. Si lo logra, su equipo gana 10 puntos.

Independientemente de si pudo meter gol o no, el cazador pierde la quaffle. Siempre que un cazador pierde la quaffle, ésta es atrapada por el rival más habilidoso que pueda obtener la quaffle (vamos a hacer que sólo los cazadores cumplan con esa condición, pero no queremos cerrar la puerta a cambios futuros).

Un cazador puede ser bloqueado por un jugador contrario si se cumple que el otro jugador puede bloquear goles (los buscadores no pueden, los otros sí) y además el otro jugador es al menos el doble de habilidoso que ese cazador.

### Golpeadores

Cuando juega un golpeador lo que hace es elegir a alguien del otro equipo para tirarle una bludger. Para eso necesita saber si es útil golpear a otro jugador, y luego le apuntará al primer blanco útil del equipo contrario. De momento sabemos que es útil golpear a un buscador o a un cazador que tiene la quaffle.

Si a un buscador le tiran una bludger, la distancia para atrapar la snitch debe aumentar en 25 - su nivel de reflejos. En el caso de los cazadores, si tienen la quaffle, la pierden.