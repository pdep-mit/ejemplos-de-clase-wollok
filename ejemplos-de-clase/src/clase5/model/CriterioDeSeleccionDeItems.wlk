object comodo {
	method elegirItem(conjuntoDeItems)
	{
		return conjuntoDeItems.first()
	}
}

object estrategico {
	method elegirItem(conjuntoDeItems)
	{
		return conjuntoDeItems.max({item=>item.capacidadOfensiva()})
	}
}