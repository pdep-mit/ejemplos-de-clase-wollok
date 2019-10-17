object entrenador {
	
	const property equipo = []
	
	method darDeComer(){
		self.pokemonActual().comerBaya()
	}
	
	method pokemonActual() = equipo.first()
	
	method cambiarPokemonActual() {
		const pokemon = self.pokemonActual()
		equipo.remove(pokemon)
		equipo.add(pokemon)
	}
	
	method agregarPokemon(pokemon){
		equipo.add(pokemon)
	}
	
	method usarHabilidad(){
		self.pokemonActual().usoDeHabilidad()
	}
	
	// Esto sólo se puede hacer con los pokemones resueltos usando composición en vez de herencia
	method evolucionarPokemon(){
		self.pokemonActual().evolucionar()
	}
}

