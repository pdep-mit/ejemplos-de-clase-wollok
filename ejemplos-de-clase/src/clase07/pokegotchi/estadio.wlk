object estadio {
	var property temperatura = 0
	var property estaLloviendo = false
	
	method aumentarTemperatura(aumento){
		temperatura += aumento
	}
	
	method llover() {
		self.estaLloviendo(true)
	}
	
	method sensacionTermica(){
		if(estaLloviendo){
			return temperatura/2
		}
		else{
			return temperatura
		}
	}
}
