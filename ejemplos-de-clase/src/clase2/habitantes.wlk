object azucena {
	method leGusta(disfraz){
		return disfraz.ternura() > 8
	}
	
	method cuantosCaramelosDaria(disfraz){
		if(self.leGusta(disfraz)){
			return disfraz.ternura()
		} else {
			return 5
		}
	}
	
}

object casa {
	// Les dejo los defaults para el estado interno
	// mínimo y necesario para resolver el problema
	var caramelos = 100
	var caos = 0
	var quienAbreLaPuerta = azucena
	
	// Agregar los métodos que hagan falta para
	// terminar los requerimientos pedidos
}