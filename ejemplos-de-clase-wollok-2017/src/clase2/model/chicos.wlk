object juanita {
	var disfraz
	method disfraz(unDisfraz) {
		disfraz = unDisfraz
	}
	
	method disfraz() = disfraz
	
	method visita(unaCasa) {
		unaCasa.pideCaramelos(self)
	}
	
	method cuantosCaramelosRecibe(unaCasa){
		return unaCasa.cuantosCaramelosDa(disfraz) + 2
	}

}

object tito {
	var disfraz 
	method disfraz(elDisfraz) {
		disfraz = elDisfraz
	}
	
	method disfraz(){
		return disfraz
	}
	
	method cuantosCaramelosRecibe(unaCasa) {
		if(juanita.disfraz() == self.disfraz()){
			return juanita.cuantosCaramelosRecibe(unaCasa)
		} else {
			return unaCasa.cuantosCaramelosDa(disfraz)
		}
	}
	method visita(unaCasa) {
		unaCasa.aumentarCaos(1)
		unaCasa.pideCaramelos(self)
	}
	
}

object rolo {
	method cuantosCaramelosRecibe(){
		return 1
	}
	
	method visita(unaCasa) {
		unaCasa.aumentarCaos(5)
	}

}