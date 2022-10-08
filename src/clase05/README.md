# Atención de Animales - Continuación

Continuando con el programa para [atender animales de granja](https://github.com/pdep-mit/ejemplos-de-clase-wollok/tree/master/src/clase04#atenci%C3%B3n-de-animales) de la clase anterior...

## Parte 1 - Comederos Recargables

### Requerimientos iniciales

Queremos extender nuestro sistema de atención de animales con comederos recargables.

Deberían comportarse como comederos normales, y además inicialmente necesitamos:

- Que tengan una cantidad variable de raciones en stock.
- Saber si tiene raciones de comida.
- Recargarle una cantidad de comida (en kgs), aumentando la cantidad de raciones en stock en base al tamaño de la ración configurada para ese comedero.

> Los comederos programados anteriormente no deberían verse afectados por este agregado.

### Consumo energético

Queremos cambiar el comportamiento de los **comederos recargables** respecto a su **consumo energético**.

A diferencia de los comederos normales, el consumo energético debería ser el doble de la cantidad de raciones que tiene.

### ¿Es útil?

Queremos mejorar comportamiento de los comederos recargables respecto a su utilidad para atender animales.

Sólo se considerará útil para atender a un animal si **tiene raciones** y además cumple con **las mismas condiciones** que los comederos normales, que son:

- Que el animal tenga hambre
- Que el animal no supere el peso máximo que el comedero soporta

### Atención de animales

Tenemos una mejora más para el comportamiento de los comederos recargables: cómo atiende a un animal.

Los comederos recargables deberían atender igual que los comederos normales, considerando también que:

- **deben tener raciones** para que puedan atender al animal
- **debe decrementarse el stock de raciones** luego de alimentarlo.

## Parte 2 - Generalización

Nos enteramos de que hay aspectos en común entre los mamíferos que se crían en la granja.

Queremos agregar a la funcionalidad desarrollada anteriormente para las vacas y cerdos:

- Poder saber si son **pesados**, que se cumple si su peso supera los 50 kgs.
- Hacer que **caminen** durante un tiempo indicado. Al caminar el mamífero pierde tantos kilos como las horas a caminar multiplicado por una cantidad de peso que se calcula de la siguiente forma:
  - Para las **vacas** es siempre 0.2 kgs.
  - Para los **cerdos** es 0.5 si tienen hambre, o 0.3 kgs en caso contrario.
