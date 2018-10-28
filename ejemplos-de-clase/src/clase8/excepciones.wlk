class NoSePuedeInvocarHechizo inherits Exception {

}

class EnergiaMagicaInsuficiente inherits NoSePuedeInvocarHechizo {
	
	constructor(unHechizo){
		message = "Energia mágica insuficiente para invocar un hechizo que requiere " + unHechizo.energiaRequerida().toString()
	}
}


