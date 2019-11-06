class Torneo{
	var property postas
	var property anotados
	var property dragonesDisponibles 
	
	method jugarse(){
		postas.forEach({p => p.jugarse(anotados, dragonesDisponibles)})
	}
	
}