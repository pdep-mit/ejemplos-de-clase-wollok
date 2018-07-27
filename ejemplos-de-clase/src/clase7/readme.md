# Clase de composición: Juego de Rol

## Primera iteración: Punto de partida

Un importante miembro de las industrias de los videojuegos, está modelando su primer universo de rol para lo cual (por el momento) existen  de tres tipos de unidades: caballero, paladín y arquero.

Los arqueros cuando atacan a otras unidades realizan 25 puntos de daño, los caballeros 30 y los paladines 20. Además los paladines al atacar recuperan 3 puntos de vida.

## Segunda iteración: Armas y armaduras

Se incorpora a lo anterior que toda unidad tiene una armadura, de modo que al recibir daño por un ataque la vida que pierde será el daño del ataque - la resistencia de la armadura. Cada vez que la unidad es atacada, la resistencia de la armadura disminuye en 1.

Por otro lado, el daño que realizaba cada tipo de unidad era en realidad lo que se correspondía a su arma:
- Espada: al atacar realiza 20 de daño
- Mandoble: al atacar realiza 30 de daño
- Arco: al atacar realiza 25 de daño

Y queremos poder crear una unidad que use un arma cualquiera. Eso implica que podrían haber paladines con espada, con mandoble o con arco.

## Tercer iteración: Chamanes

Muy contentos con nuestra solución nos piden un último requerimiento, modelar a los Chamanes de fuego y de hielo:

Los chamanes se diferencian de las unidades que modelamos hasta ahora en que no usan armas, y por ende su ataque es distinto. Cuando atacan a una unidad si es un chamán de fuego, queman a la unidad y si es un chamán de hielo, la congelan.

Cuando una unidad es congelada pierde 10 puntos de vida y no puede atacar hasta que se descongele, lo cual sucede si es quemado o si recibe 3 ataques físicos ya que rompen el hielo (que serían los ataques de las unidades armadas). Los chamanes de fuego se comportan igual pero pierden 30 puntos de vida extra.

Cuando una unidad es quemada, si estaba congelado sólo se descongela, de lo contrario al ser quemado pierde 20 puntos de vida en ese momento y queda quemado, a menos que sea un chamán de fuego, que sólo pierde 10 puntos de vida . Si una unidad quemada es congelada, deja de estar quemada y sigue las mismas reglas que se explicaron recién.

Una unidad que está quemada recibe el doble de daño por ataques físicos, y a su vez cuando ataca:
- si es un chamán de hielo, además de congelar al enemigo, deja de estar quemado
- las unidades armadas aumentan en 10 el daño que realizan con su ataque a la unidad contraria, pero también pierden un punto de vida al finalizar su ataque por estar quemados.

Un chaman además puede usar una habilidad especial: Curar una unidad, lo que aumenta 10 de vida de una unidad.
Además cuando un chamán de fuego cura una unidad congelada, la descongela, y si un chamán de hielo cura una unidad quemada, deja de estar quemada.

Ah! Y si una unidad se muere en algún momento (porque su vida baja a 0):
no puede realizar ataques
no puede ser curada
no puede ser atacada
