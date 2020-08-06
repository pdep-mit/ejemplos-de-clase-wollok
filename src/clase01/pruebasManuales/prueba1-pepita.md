La interfaz del pepita es:

![Interfaz Pepita](diagramas/interfaz-pepita.jpg)

Consultamos la energía de pepita (no produce efecto, sólo retorna un valor):

```wollok
>>> pepita.energia()
100
```

Lo que se ve en el diagrama inicialmente:

![Pepita inicial](diagramas/pepita-inicial.png)

Le pedimos que vuele 2 kilómetros (produce efecto, no retorna nada):

```wollok
>>> pepita.volar(2)
```
Lo que se ve en el diagrama:

![Pepita luego de volar](diagramas/pepita-luego-de-volar.png)

Si volvemos a consultar su energía, lo que retorna es el nuevo valor referenciado por el atributo de pepita:

```wollok
>>> pepita.energia()
50
```

Le pedimos que coma 8 gramos de alpiste (produce efecto, no retorna nada):

```wollok
>>> pepita.comer(8)
```

![Pepita luego de comer](diagramas/pepita-luego-de-comer.png)

Si volvemos a consultar su energía, lo que retorna es el nuevo valor referenciado por el atributo de pepita:

```wollok
>>> pepita.energia()
66
```