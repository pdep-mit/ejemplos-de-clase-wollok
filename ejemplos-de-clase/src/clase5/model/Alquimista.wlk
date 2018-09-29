class Alquimista{
	var property vida = 100
	const property itemsDeCombate = []
	const property itemsDeRecoleccion = []
	
	method items() = itemsDeCombate + itemsDeRecoleccion
	
	
	method tieneCriterio(){
		return self.obtenerItemsEfectivos().size() >= self.cantidadDeItemsDeCombate() / 2
	}
	
	method cantidadDeItemsDeCombate(){
		return self.itemsDeCombate().size()
	}
	
	method cantidadDeItems(){
		return self.items().size()
	}	
	
	method obtenerItemsEfectivos() {
		return self.itemsDeCombate().filter({item => item.esEfectivo()})
	}
	
	method esBuenExplorador(){
		return itemsDeRecoleccion.asSet().size() >= 3
	}
	
	method capacidadOfensiva(){
		return self.itemsDeCombate().sum({item => item.capacidad()})
	}
	
	method esProfesional(){
		return self.promedioCalidad() > 50 && self.todosLosItemsSonEfectivos() && self.esBuenExplorador()
	}
	
	method promedioCalidad(){
		return self.items().sum({item => item.calidad()}) / self.cantidadDeItems()
	}
	
	method todosLosItemsSonEfectivos(){
		return self.itemsDeCombate().all({item => item.esEfectivo()})
	}
	
	method atacar(enemigo,tipoDeSeleccionDeItem)
	{
		var item = tipoDeSeleccionDeItem.elegirItem(self.itemsDeCombate())
		item.usadoPor(self,enemigo)
		self.itemsDeCombate().remove(item)
	}
	method recibirDanio(danio)
	{
		vida= 0.max(vida-danio)
	}
	method curarVida(curacion)
	{
		vida+=curacion
	}
	method elegirItemDeCombate()= self.itemsDeCombate().first()
	
	method agregarItemDeCombate(item)
	{
		itemsDeCombate.add(item)
	}
	
	method agregarItemDeRecoleccion(item)
	{
		itemsDeRecoleccion.add(item)
	}
}