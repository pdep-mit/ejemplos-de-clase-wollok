object demogorgon {
	var vida = 250
	var danioQueCausa = 15
	
	method danioQueCausa(){
		return danioQueCausa
	}
	
	method sufrirDanio(cant){
		vida = (vida - cant).max(0)
	}
	
	method vida(){
		return vida
	}
}
