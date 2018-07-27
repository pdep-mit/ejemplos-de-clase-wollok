# clase-de-laboratorio-wollok

Ejercicio Halloween colaborativo con testeo unitario

Queremos hacer un programa que modele el comportamiento de un grupo de chicos en Halloween cuando visitan una casa para pedir caramelos y/o hacer bullicio.

Los chicos en los cuales estamos interesados son:
- Tito, que cuando visita una casa pide caramelos y aumenta el caos de la misma en una unidad.
- Juanita, es la hermana menor de Tito, cuando visita una casa sólo pide caramelos.
- Rolo, que no está interesado en los caramelos por eso ni se disfraza, cuando visita una casa sólo aumenta su caos en 5 unidades.

La casa que vamos a usar tiene 3 habitantes, que se van rotando para abrir la puerta y dar caramelos. Los habitantes de la casa son:
- Azucena, que si le gusta el disfraz da el equivalente a la ternura del mismo en caramelos, o 5 si no le gusta, y le gustan los disfraces con ternura mayor a 8.
- Sandra, que da 8 caramelos cuando la casa está en orden (si su nivel de caos es menor a 3), en cuyo caso da 2 caramelos. Le gustan los disfraces que son más tiernos que aterradores.
- Jorge, que da 10 caramelos si hay al menos 50 caramelos en la casa, de lo contrario baja su ración a 4, y le gustan los disfraces con terror mayor a 8.

Inicialmente hay 100 caramelos en la casa, y un nivel 0 de caos.

Cuando un chico pide caramelos, el total de caramelos que hay en la casa disminuye en el mínimo entre la cantidad de caramelos que puede conseguir y la cantidad de caramelos que efectivamente hayan en la casa.

Por otro lado nos interesa saber cuántos caramelos podría conseguir un chico en una casa:
- Juanita puede conseguir 2 caramelos más de los que daría normalmente la persona que abra la puerta.
- Rolo puede conseguir 1 caramelo de lástima, sin importar quién le abra la puerta.
- La cantidad de caramelos que puede conseguir Tito en una casa equivale a la cantidad que podría conseguir su hermana menor si están disfrazados iguales. Si se disfrazó distinto, consigue la cantidad de caramelos que da normalmente la persona que abre la puerta.

Respecto a los disfraces que pueden usar Tito y Juanita, tienen un par de disfraces ya armados de años anteriores:
- el disfraz de zombie tiene 0 ternura y terror 8,
- el disfraz de Frozen tiene ternura 5 y terror 0

Además están armando un disfraz nuevo, para el cual debe poder configurarse su ternura y su terror.

Se pide:
- Determinar para cada habitante de la casa si le gusta un disfraz.
- Determinar cuántos caramelos daría cada habitante de la casa en base a un disfraz, teniendo en cuenta que dependerá en algunos casos del estado de la casa.
- Determinar cuántos caramelos podría conseguir cada chico para la casa de Azucena, Sandra y Jorge. Probar esto usando distintos disfraces para Tito y Juanita, cambiando al habitante que abre la puerta en la casa, la cantidad de caramelos que hay en la casa y el caos de la misma.
- Hacer que la casa sea visitada por cada uno de los chicos.