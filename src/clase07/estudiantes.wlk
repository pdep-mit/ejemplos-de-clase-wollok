import clase07.cursadas.*

// TODO: Implementar para los distintos estudiantes (caro y leo):
// - recibirTarea(tarea), para registrar que tiene una nueva tarea
// - estudiar(), para que elija una tarea pendiente y trabaje sobre ella
// - completo(tarea), que indique si completó la tarea indicada

// Sabemos que a la hora de elegir sobre qué tarea trabajar:
// - Leo elige trabajar sobre la tarea con fecha de entrega más próxima
// - Caro elige trabajar sobre la tarea que más tiempo le requiere
/*
object leo inherits Estudiante {
	override method elegirTarea(tareas) = tareas.min {tarea =>
		tarea.proximidadAFechaDeEntrega()
	}
}

object caro inherits Estudiante {
	override method elegirTarea(tareas) = tareas.max {tarea =>
		tarea.tiempoEstimado()
	}
}
*/
class Estudiante {
	const property tareasPendientes = []
	const tareasCompletas = []
	var property formaDeElegir
	
	method recibirTarea(tarea){
		tareasPendientes.add(tarea)
	}
	method estudiar(){
		const tareaElegida = self.elegirTarea(self.tareasPendientes())
		self.trabajarSobre(tareaElegida)
	}
	method trabajarSobre(tareaElegida){
		tareasPendientes.remove(tareaElegida)
		tareasCompletas.add(tareaElegida)
	}

	method completo(tarea) = tareasCompletas.contains(tarea)
	
	method elegirTarea(tareas) = formaDeElegir.elegirTarea(tareas, self)
	
	method cursoMasColgado() = self.cursos().max {
		curso => self.nivelDeCuelgue(curso)
	}
	method nivelDeCuelgue(curso)
		= tareasCompletas.count {tarea => tarea.curso() == curso}
			- tareasPendientes.count {tarea => tarea.curso() == curso}
			
	method cursos() = self.tareasRecibidas()
						.map {tarea => tarea.curso()}.asSet()
						
	method tareasRecibidas() = tareasCompletas + tareasPendientes
}

object hijoDelRigor {
	method elegirTarea(tareas, estudiante) = tareas.min {tarea =>
		tarea.proximidadAFechaDeEntrega()
	}
}	
object prudente {
	method elegirTarea(tareas, estudiante) = tareas.max {tarea =>
		tarea.tiempoEstimado()
	}
}

class Prioritaria {
	const property materia
	method elegirTarea(tareas, estudiante)
		= tareas.findOrElse({tarea =>
				tarea.materia() == materia
			}, {tareas.first()})
}

object remadora {
	method elegirTarea(tareas, estudiante) = tareas.max { tarea =>
		tarea.curso() == estudiante.cursoMasColgado()
	}
}

const leo = new Estudiante(formaDeElegir = remadora)
const caro = new Estudiante(formaDeElegir = new Prioritaria(materia = "AdS"))