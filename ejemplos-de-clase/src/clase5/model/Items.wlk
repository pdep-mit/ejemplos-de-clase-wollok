class Bomba {
	var danio

	const materiales = []
	
	constructor(_danio, _materiales) {
		danio=_danio
		materiales=_materiales 
	}
	method esEfectivo(){
		return danio > 100	}
	
	method capacidad(){
		return danio / 2
	}
	
	method calidad(){
		return materiales.min({material => material.calidad()}).calidad()
	}
	
	method usadoPor(alquimista,enemigo)
	{
		enemigo.recibirDanio(danio)
		enemigo.atacar(alquimista)
	}
	
}

class Pocion {
	var poderCurativo
	const materiales = []
	
	constructor(_poderCurativo, _materiales) {
		poderCurativo=_poderCurativo
		materiales=_materiales 
	}
	method esEfectivo(){
		return poderCurativo > 50 && self.tieneAlgunMaterialMistico()
	}
	
	method capacidad(){
		return poderCurativo + materiales.count({material => material.esMistico()}) * 10 
	}
	
	method tieneAlgunMaterialMistico() {
		return materiales.any({material => material.esMistico()})
	}
	
	method calidad(){
		return materiales.findOrElse({material => material.esMistico()}, {materiales.first()}).calidad()
	}
	
	method usadoPor(alquimista,enemigo)
	{
		alquimista.curarVida(poderCurativo)
	}
}

class Debilitador {
	var potencia
	var materiales = []
	
	constructor(_potencia, _materiales) {
		potencia=_potencia
		materiales=_materiales 
	}
	
	method esEfectivo(){
		return potencia > 0 && self.noTieneNingunMaterialMistico()
	}
	
	method capacidad(){
		return if (self.noTieneNingunMaterialMistico()) 50 else 0
	}
	
	method noTieneNingunMaterialMistico() {
		return materiales.all({material => !material.esMistico()})
	}
	
	method calidad(){
 		
		return self.materialesPrincipales().sum({material => material.calidad()}) / self.materialesPrincipales().size()
	}
	
	method materialesPrincipales() {
		return materiales.sortedBy({material, otroMaterial => material.calidad() > otroMaterial.calidad()}).take(2)
	}
	
	method usadoPor(alquimista,enemigo)
	{
		enemigo.disminuirPotencialDefensivo(potencia)
	}
}

class ItemDeRecoleccion{
	const materiales = []
	
	constructor(_materiales) {
		materiales=_materiales 
	}
	
	method calidad(){
		return 30 + materiales.sum({material => material.calidad()}) / 10
	}
}