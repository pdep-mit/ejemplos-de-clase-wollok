# Práctica: Yaaar!

[Enunciado](https://docs.google.com/document/d/e/2PACX-1vTHVcM-A2FmFpJBKnkpjr8MXI-KsqUp6fm9_GrcP2TUr8aWc5h-Sfj9FY28vVtCwoJ6R-gm1ACIbW8-/pub)

## Diagrama Estático

Diseño general de la solución final (el de la ppt pero con notas adicionales respecto a cómo nos quedó al final de la clase)

![Diagrama](diagrama-yaaar.png)

> Este diagrama fue armado para la clase del 2020 que quedó [subida a youtube](https://www.youtube.com/watch?v=GBjjVAoqpqg), y el código de esa cursada está [acá](https://github.com/pdep-mit/ejemplos-de-clase-wollok/blob/4466e5af1edae07f2e3dc55bdd91d524fb5234c7/src/clase06/yaaar.wlk).
>
> Si bien las soluciones de cursadas posteriores puede que difieran, debería ser suficientemente representativo.

En la solución de la cursada de 2022 adelantamos el tema de manejo de errores, por lo que se usa `throw` con excepciones de dominio propias en vez de `self.error(mensaje)`.
