class Dragon{
	method requisitos(){
		//Todo
		return #{}
	}
	method permiteSerMontadoPor(vikingo){
		self.requisitos().all({req => req.cumpleRequisito(vikingo, self)})
	}
	method cuantoPuedeCargar()
	method danioQueProduce()
	method velocidad()
}

object requisitoBase{
	method cumpleRequisito(vikingo, dragon) = vikingo.peso() < dragon.peso()
}

