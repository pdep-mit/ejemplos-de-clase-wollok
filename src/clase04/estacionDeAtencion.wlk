import atencionDeAnimales.*

class EstacionDeAtencion {
	const property dispositivos = #{}
	
	method agregarDispositivo(dispositivo){
		dispositivos.add(dispositivo)
	}
	
	method quitarDispositivo(dispositivo){
		dispositivos.remove(dispositivo)
	}
	
	method consumoEnergetico()
	  = dispositivos.sum({dispositivo => 
	  		dispositivo.consumoEnergetico()
	  	}) * 1.1
	  	
	method puedeAtender(animal) = dispositivos.any({dispositivo => 
		dispositivo.esUtilParaAtender(animal)
	})
	
	method dispositivosUtiles(animal) = dispositivos.filter({dispositivo => 
		dispositivo.esUtilParaAtender(animal)
	})
	
	method darAtencionBasica(animal) {
		self.validarQuePuedeAtender(animal)
		
		const dispositivoAUsar =
		   self.dispositivosUtiles(animal)
		       .min({dispositivo =>
			      dispositivo.consumoEnergetico()
		       })
		dispositivoAUsar.atender(animal)
	}
	
	method darAtencionCompleta(animal){
		self.validarQuePuedeAtender(animal)
			
		self.dispositivosUtiles(animal)
			.forEach({dispositivo => dispositivo.atender(animal)})
	}
	
	method validarQuePuedeAtender(animal){
		if(not self.puedeAtender(animal))
			self.error("El animal no puede atenderse")
	}
}
