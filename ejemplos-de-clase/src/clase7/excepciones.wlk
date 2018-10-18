class UserException inherits Exception{}

class EnergiaInsuficiente inherits UserException {
	constructor(){
		message = "Energia insuficiente"
	}
}

class EntrenamientoFallido inherits UserException {}