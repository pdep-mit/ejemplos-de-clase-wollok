class Curso {
	const property materia
	const property estudiantes = #{}
	const property tareasPedidas = []
	
	method crearTarea(descripcion, fechaDeEntrega, horas){
		return new Tarea(curso = self, 
			fechaDeEntrega = fechaDeEntrega,
			descripcion = descripcion,
			tiempoEstimado = horas
		)
	}
	
	method darTarea(descripcion, fechaDeEntrega, horas){
		const tarea = self.crearTarea(descripcion, fechaDeEntrega, horas)
		tareasPedidas.add(tarea)
		estudiantes.forEach {estudiante => estudiante.recibirTarea(tarea)}
	}
	
	method estanAlDia() = estudiantes.filter {estudiante => 
		self.tareasVencidas().all {tarea => estudiante.completo(tarea)}
	}
	method tareasVencidas() = tareasPedidas.filter {tarea => tarea.vencida()}
}


class Tarea {
	const property curso
	const property descripcion
	var property fechaDeEntrega
	const property tiempoEstimado
	
	method proximidadAFechaDeEntrega() = (fechaDeEntrega - new Date()).max(0)
	method vencida() = self.proximidadAFechaDeEntrega() == 0
	
	method materia() = curso.materia()
}
