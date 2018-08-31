# Introducción al Paradigma Orientado a Objetos

Supongamos que queremos hacer que Maiu y Feche toquen juntos una canción, cada uno va a ser responsable de una parte del problema: Maiu de la melodía y Feche del acompañamiento.

Sabemos que Feche tiene un cancionero donde junta las canciones para las cuales sabe hacer el acompañamiento, y que cuando está contento elige una canción alegre ("Crazy Little Thing Called Love" de Queen) y cuando no, elige una canción bajón ("Wish You Were Here" de Pink Floyd). Para la melodía, luego de que Feche empiece a tocar el acompañamiento, Maiu se ajusta a la canción que haya elegido Feche y toca la melodía.

Vamos a presentar un par de soluciones para este problema, partiendo de una solución inicial que funciona pero es claramente mejorable, y modificándola un poquito en cada versión siguiente basándonos en la filosofía de este paradigma para ver cómo impactan esos cambios en lo que podremos hacer en nuestro programa.