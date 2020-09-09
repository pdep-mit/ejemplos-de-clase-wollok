object tom {
	var property energia = 80
	
	method velocidad() = 5 + energia / 10
	
	method comer(raton){
		energia += self.energiaQueGanariaComiendo(raton)
	}
	
	method correr(segundos){
		energia -= self.energiaQuePerderiaCorriendo(self.metrosQueCorre(segundos))
	}
	method metrosQueCorre(segundos) = segundos * self.velocidad()
	
	method convieneCorrerRatonA(raton, distanciaEnMetros)
		= self.velocidad() > raton.velocidad() &&
		    self.energiaQueGanariaComiendo(raton)
		      > self.energiaQuePerderiaCorriendo(distanciaEnMetros)
		      
	method energiaQueGanariaComiendo(raton) = 12 + raton.peso()
	method energiaQuePerderiaCorriendo(distanciaEnMetros) = 0.5 * distanciaEnMetros
}

object jerry {	
	var property velocidad = 1
	
	method acelerar(){
		velocidad = velocidad * 1.5
	}
	method peso() = 5
}

