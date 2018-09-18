import armas.*
import alimentos.* 

object mike {
	var vida = 70
	var amigos = [dustin, eleven, lucas, will]
	var armas = [linterna, bate]
	
	method vida(){
		return vida
	}
	method amigos(){
		return amigos
	}
	method esAmigoDe(persona){
		return amigos.contains(persona)
	}
	method cuantosAmigosTiene(){
		return amigos.size()
	}
	method hacerseAmigoDe(persona){
		if (self.esAmigoDe(persona).negate()){
			amigos.add(persona)
		}
	}
	method pelearseCon(persona){
		if (self.esAmigoDe(persona)){
			amigos.remove(persona)
		}
	}
	method danioQueCausa(){
		return armas.sum({unArma => unArma.puntosDeDanio()})
	}
	method enCondicionCritica(){
		return vida < 20
	}
	method comer(comida){
		vida = (vida + comida.puntosQueAportaPara(self)).min(100)
	}
	method perderVida(cant){
		vida = (vida - cant).max(0)
	}
	method estaHerido(){
		return vida < 35
	}
}
object dustin {
	var vida = 70
	var amigos = [mike, lucas, will]
	var armas = [punioDustin]
	var cantPostres = 0
	
	method cuantosPostresComio(){
		return cantPostres
	}
	method vida(){
		return vida
	}
	method amigos(){
		return amigos
	}
	method esAmigoDe(persona){
		return amigos.contains(persona)
	}
	method cuantosAmigosTiene(){
		return amigos.size()
	}
	method hacerseAmigoDe(persona){
		if (self.esAmigoDe(persona).negate()){
			amigos.add(persona)
		}
	}
	method pelearseCon(persona){
		if (self.esAmigoDe(persona)){
			amigos.remove(persona)
		}
	}
	method danioQueCausa(){
		return armas.sum({unArma => unArma.puntosDeDanio()})
	}
	method enCondicionCritica(){
		return vida < 20
	}
	method comer(comida){
		vida = (vida + comida.puntosQueAportaPara(self)).min(100)
		if (comida === postrecitoDeChocolate){
			cantPostres += 1
		}
		
	}
	method perderVida(cant){
		vida = (vida - cant).max(0)
	}
	method estaHerido(){
		return vida < 35
	}
}

object eleven {
	var vida = 100
	var amigos = [mike]
	var armas = [punioEleven, psiquis]
	method vida(){
		return vida
	}
	method amigos(){
		return amigos
	}
	method esAmigoDe(persona){
		return amigos.contains(persona)
	}
	method cuantosAmigosTiene(){
		return amigos.size()
	}
	method hacerseAmigoDe(persona){
		if (self.esAmigoDe(persona).negate()){
			amigos.add(persona)
		}
	}
	method pelearseCon(persona){
		if (self.esAmigoDe(persona)){
			amigos.remove(persona)
		}
	}
	method danioQueCausa(){
		return armas.sum({unArma => unArma.puntosDeDanio()})
	}
	method enCondicionCritica(){
		return vida < 20
	}
	method comer(comida){
		vida = (vida + comida.puntosQueAportaPara(self)).min(100)
	}
	method perderVida(cant){
		vida = (vida - cant).max(0)
	}
	method estaHerido(){
		return vida < 35
	}
}

	
object lucas {
	var vida = 70
	var amigos = [dustin, mike, will]
	var armas = [superGomera]
method vida(){
		return vida
	}
	method amigos(){
		return amigos
	}
	method esAmigoDe(persona){
		return amigos.contains(persona)
	}
	method cuantosAmigosTiene(){
		return amigos.size()
	}
	method hacerseAmigoDe(persona){
		if (self.esAmigoDe(persona).negate()){
			amigos.add(persona)
		}
	}
	method pelearseCon(persona){
		if (self.esAmigoDe(persona)){
			amigos.remove(persona)
		}
	}
	method danioQueCausa(){
		return armas.sum({unArma => unArma.puntosDeDanio()})
	}
	method enCondicionCritica(){
		return vida < 20
	}
	method comer(comida){
		vida = (vida + comida.puntosQueAportaPara(self)).min(100)
	}
	method perderVida(cant){
		vida = (vida - cant).max(0)
	}
	method estaHerido(){
		return vida < 35
	}
}

object will {
	
	
}
