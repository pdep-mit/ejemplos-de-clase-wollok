# Atención de Animales - El juego!

## El modelo

Al ejercicio de atención de animales desarrollado en clases anteriores se le agrega una capita de interfaz de usuario con Wollok Game (puede encontrarse en la carpeta `game`).

En este contexto se declaran tipos específicos de excepciones de dominio (ver `excepciones.wlk`), las cuales se lanzan desde los dispositivos (ver las distintas implementaciones para el mensaje `atender(animal)` en `dispositivos.wlk`).

También se agrega un requerimiento, de la mano de un objeto de dominio nuevo, desarrollado para el juego que representa a la granja (ver `granja.wlk`).

Cuando la granja le da atención a un animal con un dispositivo queremos que:
 - El dispositivo atienda al animal
 - Sólo si la atención fue exitosa, gastar tanto dinero como el consumo energético del dispositivo y ganar los puntos que correspondan por la buena atención.
 - Si la atención no fue exitosa, además de fallar por ese motivo, penalizar por la mala atención.

## Manejos avanzados - Interfaz gráfica

Los otros manejos de errores más avanzados relacionados con la vista están en el archivo `game/juegoGranja.wlk`. Ahí está la lógica para mostrar carteles en caso de que no hayan raciones o que surja un error inesperado, incluyendo múltiples catch para manejar los distintos errores de más particular a más general (similar a como se trabajaba con pattern matching en Haskell).

Se incluyen comentarios que explican a detalle el por qué de cada catch.