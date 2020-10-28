class Curso {
	const property materia
	const property estudiantes = #{}
	const property tareasPedidas = []
	
	method darTarea(tarea){
		tareasPedidas.add(tarea)
		estudiantes.forEach {estudiante => estudiante.recibirTarea(tarea)}
	}
	
	method estanAlDia() = estudiantes.filter {estudiante => 
		self.tareasVencidas().all {tarea => estudiante.completo(tarea)}
	}
	method tareasVencidas() = tareasPedidas.filter {tarea => tarea.vencida()}
	
	method agregarEstudiante(estudiante){
		estudiantes.add(estudiante)
	}
}


class Tarea {
	const property descripcion
	var property fechaDeEntrega
	const property tiempoEstimado
	
	method proximidadAFechaDeEntrega() = (fechaDeEntrega - new Date()).max(0)
	method vencida() = self.proximidadAFechaDeEntrega() == 0
}
