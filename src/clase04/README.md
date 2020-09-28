# Atención de Animales

## Parte 1: Animales y Dispositivos

En un campo hay que atender a los animales, que tienen varias necesidades. Consideremos vacas, gallinas y cerdos, que tienen estas características.

**Vaca**

* Cuando come aumenta el peso en lo que comió / 3 y le da sed.
* Cuando bebe se le va la sed y pierde 500 g de peso.
* Tiene hambre si pesa menos de 200 kg.	

**Cerdo**

* Cuando come aumenta el peso en lo que comió – 200 g (si come menos de 200 g no aumenta nada); sólo se le va el hambre si come más de 1 kg.
* Tiene sed si comió más de tres veces, sin beber entre cada comida.
* Cuando bebe le da hambre.

**Gallina**
		
* Cuando come y bebe no se observa ningún cambio, siempre pesa 4 kg.
* Siempre tiene hambre, nunca tiene sed.

También hay distintos dispositivos de atención automática a los animales:

* Bebederos: dan de beber a un animal, son útiles para atender a los animales con sed. 
* Comederos: cada comedero da de comer una cantidad fija que deberá indicarse para cada dispositivo. Son útiles para atender a los animales con hambre que pesen menos de lo que soporta el comedero. Debemos considerar que **no debería ser posible atender en un comedero a animales que pesen más que lo que el dispositivo soporta**.


Modelar lo que se describió de forma tal de poder:

* Saber si un dispositivo es útil para atender a un animal.
* Hacer que un animal se atienda en un dispositivo.

### Intro a Colecciones

A partir de un conjunto de animales queremos... 
 - Saber si todos tienen hambre
 - Encontrar los que tienen sed
 - Obtener la suma de los pesos de los animales
 - Saber cuál es el más pesado
 - Encontrar alguno que pese más de 250 kg
 - Hacer que todos coman 300g

## Parte 2: Estaciones de atención de animales

1. Queremos agregar al modelo a las estaciones de atención para animales. Una estación de atención tiene múltiples dispositivos de atención automática y necesitamos:
 - Agregar y quitar un dispositivo a una estación de atención.
 - Saber cuánta energía consume, que es un 10% más de la suma del consumo energético de sus dispositivos.
   Los bebederos tienen un consumo fijo de 10 kwatts, mientras que los comederos tienen un consumo de 20 kwatts * el peso máximo que soporta.
 - Saber si un animal puede ser atendido por una estación, que se cumple si tiene algún dispositivo útil para que se atienda.
 - Saber cuáles son los dispositivos útiles de una estación para un animal.
 - Darle una atención básica a un animal en una estación, para lo cual se deberá buscar el dispositivo de menor consumo energético que sea útil para atenderlo, y hacer que ese dispositivo lo atienda.
 - Darle una atención completa a un animal, haciendo que todos los dispositivos útiles de la estación lo atiendan.
 
 > Pensar qué queremos que pase si tratamos de darle una atención básica o completa a un animal en una estación que no puede atenderlo con los dispositivos que tiene.

2. Incorporar al modelo a los vacunatorios, que son dispositivos que vacunan a un animal. Lógicamente deberían poder incorporarse a una estación de servicio para atender animales.

   Sabemos que a las vacas sólo conviene vacunarlas una vez, o sea, si no se la vacunó conviene vacunarla, y si ya se la vacunó no conviene volverla a vacunar. A las gallinas nunca conviene vacunarlas, mientras que a los cerdos siempre conviene vacunarlos.
   
   Será útil siempre y cuando tenga alguna dosis de la vacuna (las mismas se recargan manualmente) y convenga vacunar al animal. Cada vez que se vacuna un animal, se consume una dosis (debe haber alguna dosis para que esto sea posible).
   
   Los vacunatorios consumen 50 kwatts si tienen alguna dosis de la vacuna, de lo contrario no consumen nada.