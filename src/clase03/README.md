# Rick and Morty

Rick y Morty son las personas que mantienen a salvo la dimensión C-137. Rick es un científico excéntrico que gracias a la ayuda de su nieto Morty, viajan por toda la galaxia peleando contra distintas amenazas.

## Rick Sanchez

Rick posee:
- Energia, inicialmente de 100.
- Poder de 200 más el poder de su pistola de portales (50).
- Al atacar, compara su poder con su contrincante: en caso de ser mayor el propio, aumenta en 10 su poder, sino disminuye 50 su energía. Luego, su contrincante recibe daño en base al poder de rick.

## Morty Smith

Morty posee:
- Energia, inicialmente de 50.
- Poder de 100, aunque se triplica si esta traumado.
- Al atacar, disminuye 10 su energía sin infringir daño a su contrincante.
- Esta traumado si su energía es menor que 30.

## Enemigos

Únicamente vamos a trabajar con dos de los múltiples enemigos que Rick y Morty batallan en su día a día: **gromflomite** y **glorzo**.

Ya tenemos una implementación para ellos y ambos entienden los mensajes `poder()` y `recibirDanio(valor)`.

> Dato relevante para la trama: glorzo tiene un anfitrión. Al recibir daño, le quita energía al anfitrión y su poder depende del poder de ese anfitrión.

# Objetivo inicial

Implementar a Rick y a Morty para cumplir con los requerimientos de modo que:
- puedan atacar tanto a gromflomite como a glorzo
- sean anfitriones válidos para glorzo (qué es un anfitrión en este dominio?)

# Segundo objetivo

En uno de los viajes de Rick y Morty, descubren un planeta peligroso con un ejército enorme al que no podrán vencer únicamente ellos dos. Rick tuvo una gran idea, conseguir un Morty de otra dimensión para que lo ayude a vencer al ejército enemigo.

> Incorporar un segundo Morty que se comporte exactamente como el original.

# Nuevo problema

Al haber tantos Mortys, Rick no sabe cuál es el Morty de su dimensión. Para solucionar esto, vamos a agregarle a Rick la posibilidad de preguntarle a un Morty de qué dimensión es para saber si es de la suya (la C-137) o no. 
