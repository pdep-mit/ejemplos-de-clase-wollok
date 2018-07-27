import src.empleado.*
import rolesHelper.*

object empleadosHelper {
	method unCiclope() =
		new Ciclope(self.unaStaminaCualquiera(), self.unasTareasCualquiera(), rolesHelper.cualquiera())

	method unBiclope() =
		new Biclope(self.unaStaminaCualquiera(), self.unasTareasCualquiera(), rolesHelper.cualquiera())

	method biclopeConStamina(unaStamina) =
		new Biclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.cualquiera())

	method ciclopeConStamina(unaStamina) =
		new Ciclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.cualquiera())

	method empleadoConTareas(tareas) =
		new Ciclope(self.unaStaminaCualquiera(), tareas, rolesHelper.cualquiera())

	method empleadoConStaminaYHerramientas(unaStamina, unasHerramientas) =
		new Ciclope(unaStamina, unasHerramientas, rolesHelper.cualquiera())
		
	method mucama() =
		new Ciclope(self.unaStaminaCualquiera(), self.unasTareasCualquiera(), rolesHelper.mucama()) 
		
	method obreroConStaminaYHerramientas(unaStamina, unasHerramientas) =
		new Ciclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.obreroConHerramientas(unasHerramientas))

	method soldadoBiclopeConStaminaYPractica(unaStamina, unaPractica) =
		new Biclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.soldadoConPractica(unaPractica))
		
	method soldadoCiclopeConStaminaYPractica(unaStamina, unaPractica) =
		new Ciclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.soldadoConPractica(unaPractica))

	method mucamaConStamina(unaStamina) =
		new Ciclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.mucama())
		
	method capatazConSubordinados(subordinados) =
		new Ciclope(self.unaStaminaCualquiera(), self.unasTareasCualquiera(), rolesHelper.capatazConSubordinados(subordinados))
		
	method capatazConStaminaYSubordinados(unaStamina, subordinados) =
		new Ciclope(unaStamina, self.unasTareasCualquiera(), rolesHelper.capatazConSubordinados(subordinados))

	method unaStaminaCualquiera() = 5
	method unasTareasCualquiera() = []
}