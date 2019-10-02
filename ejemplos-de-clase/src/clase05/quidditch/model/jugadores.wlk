class Cazador {
	const property punteria
	const property fuerza
	
	method habilidad() = self.punteria() * self.fuerza()
}

class Guardian {
	const property reflejos
	method habilidad() = self.reflejos() * 3
}

class Golpeador {
	const property punteria
	const property fuerza
	
	method habilidad() = self.punteria() + self.fuerza()
}

class Buscador {
	const property reflejos
	const property vision
	
	method habilidad() = self.reflejos() * self.vision()
}
