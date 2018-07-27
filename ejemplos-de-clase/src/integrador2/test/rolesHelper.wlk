import src.roles.*

object rolesHelper {
	method cualquiera() = new Obrero([])
	
	method mucama() = new Mucama()
	
	method soldadoConPractica(unaPractica) = new Soldado(unaPractica)
	
	method capatazConSubordinados(subordinados) = new Capataz(subordinados) 
	
	method obreroConHerramientas(herramientas) = new Obrero(herramientas)
}