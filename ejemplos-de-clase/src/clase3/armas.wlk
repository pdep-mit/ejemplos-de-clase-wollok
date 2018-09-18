import ninios.*

object linterna {
	var danioBase = 10
	
	method puntosDeDanio(){
		return danioBase
	}
}

object bate {
	var danioBase = 20
	
	method puntosDeDanio(){
		return danioBase
	}
	
}

object punioDustin {
	var danioBase = 10
	var duenio = dustin
	
	method puntosDeDanio(){
		return danioBase + duenio.cuantosPostresComio()
	}
	
}
object punioEleven {
	var danioBase = 5
	
	method puntosDeDanio(){
		return danioBase
	}
	
}
object superGomera {
	var danioBase = 15
	
	method puntosDeDanio(){
		return danioBase
	}
	
}
object psiquis {
	var danioNormal = 50
	var danioEstadoCritico = 10
	var duenio = eleven
	
	method puntosDeDanio(){
		if (duenio.enCondicionCritica()){
			return danioEstadoCritico
		}
		return danioNormal
	}
}

