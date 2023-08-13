import pepita.*

object beti {
	var companiera = pepita 
	method companiera(nuevaCompaniera){
		companiera = nuevaCompaniera
	}
	method comer(gramos){
		companiera.comer(gramos/2)
	}
	method volar(kms){
		companiera.volar(kms)
	}
	method energia(){
		return companiera.energia()
	}
}
