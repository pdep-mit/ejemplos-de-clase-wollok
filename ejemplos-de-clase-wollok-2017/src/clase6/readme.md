# Clase de Errores: Viajeros de la Tierra Media

Un grupo de viajeros está formado por varios integrantes. Cada viajero tiene un nivel y lleva diversos elementos, de los cuales sólo nos interesa su nombre.

Un camino está compuesto por un conjunto de zonas, de las cuales sabemos qué elementos son necesarios para poder superarla y la cantidad de orcos que hay allí.

- Hacer que un grupo atraviese una zona, lo cual sólo debería poder hacerse cuando entre todos tienen los elementos necesarios para esa zona y el nivel total del grupo (la suma de los niveles individuales) supera la cantidad de orcos de la zona. Cuando el grupo atraviesa la zona, cada integrante aumenta su nivel en una unidad y la zona queda sin orcos.

- Hacer que un grupo transite un camino. Para ello hay que atravesar cada zona. Si al intentar atravesar fallan, el integrante de mayor nivel se sacrifica (se debe eliminar del grupo) para permitir que el grupo siga avanzando por las zonas restantes. 

Si bien al sacrificar un integrante pueden seguir transitando el resto del camino, no se deben haber subido niveles ni eliminado los orcos de esa zona.

Tener en cuenta que no debería ser posible sacrificar a un integrante del grupo si ya no hay más nadie para sacrificar, en cuyo caso se considerará que fallaron en transitar el camino.
