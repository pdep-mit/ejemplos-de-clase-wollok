object azucena {
	method leGusta(disfraz) {
		return disfraz.ternura() > 8 
	}
	method cuantosCaramelosDa(unaCasa, unDisfraz){
		if(self.leGusta(unDisfraz)){
			return unDisfraz.ternura()
		} else {
			return 5
		}
	}
}

object sandra {
	method leGusta(disfraz) {
		return disfraz.ternura() > disfraz.terror()
	}
	method cuantosCaramelosDa(unaCasa, unDisfraz){
		if(unaCasa.caos() < 3){
			return 8
		} else {
			return 2
		}
	}
}

object jorge {
	method leGusta(disfraz) {
		return disfraz.terror() > 8
	}
	method cuantosCaramelosDa(unaCasa, unDisfraz){
		if(unaCasa.cuantosCaramelosHay() >= 50){
			return 10
		} else {
			return 4
		}
	}
}