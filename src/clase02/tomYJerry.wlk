object tom {
	var property energia = 80
	
	method velocidad() = 5 + energia / 10
	
	method comer(raton){
		energia += self.energiaQueGanariaComiendo(raton)
	}
	
	method correr(segundos){
		energia -= self.energiaQueConsumiriaCorriendo(self.cantidadDeMetrosQueCorre(segundos))
	}
	
	method cantidadDeMetrosQueCorre(segundos)
	  = self.velocidad() * segundos
	
	method convieneCorrerRatonA(raton, distanciaEnMetros)
	  = self.velocidad() > raton.velocidad() &&
	    self.energiaQueGanariaComiendo(raton) 
	    	> self.energiaQueConsumiriaCorriendo(distanciaEnMetros)
	    	
	method energiaQueGanariaComiendo(raton) = 12 + raton.peso()
	
	method energiaQueConsumiriaCorriendo(distanciaEnMetros) = 0.5 * distanciaEnMetros
}

object jerry {	
	var property velocidad = 1
	
	method acelerar(){
		velocidad = velocidad * 1.5
	}
	method peso() = 5
}

