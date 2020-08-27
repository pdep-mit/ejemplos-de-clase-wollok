// Para poder correr este archivo desde el REPL
// y que pepita y josefa estén disponibles para usar 
import pepita.*
import josefa.*

object entrenador {
 	method entrenar(pajaro){
 		pajaro.comer(10)
 		pajaro.volar(20)
 		if(pajaro.energia() < 20){
 			pajaro.comer(10)
 		} else {
 			pajaro.comer(2)
 		}
 	}
 }