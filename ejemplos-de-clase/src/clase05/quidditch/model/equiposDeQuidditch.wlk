import model.jugadores.*

class Equipo {
	const property integrantes = []
	var property puntos = 0
	
	method habilidadTotal() 
		= self.integrantes().sum({integrante =>
				integrante.habilidad()
			})
	
	method esMejorQue(otroEquipo) =
		 self.habilidadTotal() > otroEquipo.habilidadTotal()

	method masHabilidoso() 
		= self.integrantes().max({integrante =>
			integrante.habilidad()
		})
}