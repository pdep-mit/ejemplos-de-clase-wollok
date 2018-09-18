import ninios.*

object linterna {
	method puntosDeDanio(){
		return 10
	}
}

object bate {
	method puntosDeDanio(){
		return 20
	}
	
}

object punioDustin {
	var duenio = dustin
	method puntosDeDanio(){
		return 5 + duenio.cuantosPostresComio()
	}
}

object punioEleven {
	method puntosDeDanio(){
		return 5
	}
	
}
object superGomera {
	method puntosDeDanio(){
		return 15
	}
}

object psiquis {
	var duenio = eleven

	method puntosDeDanio(){
		if (duenio.enCondicionCritica()){
			return 10
		}
		return 50
	}
}

