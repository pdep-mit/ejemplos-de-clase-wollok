class EstacionDeAtencion {
	const property dispositivos = []
	method agregarDispositivo(dispositivo){
		dispositivos.add(dispositivo)
	}
	method quitarDispositivo(dispositivo){
		dispositivos.remove(dispositivo)
	}
	
	method consumoEnergetico() 
		= 1.1 * dispositivos.sum({dispositivo => dispositivo.consumoEnergetico()})
		
	method puedeAtender(animal) = dispositivos.any({dispositivo =>
		dispositivo.esUtilParaAtender(animal)
	})
	
	method dispositivosUtiles(animal) = dispositivos.filter({dispositivo =>
		dispositivo.esUtilParaAtender(animal)
	})
	
	method darAtencionBasica(animal) {
		self.validarQuePuedeAtender(animal)
			
		self.dispositivosUtiles(animal).min({dispositivo =>
				dispositivo.consumoEnergetico()
			}).atender(animal)
	}
	
	method darAtencionCompleta(animal) {
		self.validarQuePuedeAtender(animal)
		
		self.dispositivosUtiles(animal).forEach({dispositivo =>
			dispositivo.atender(animal)
		})
	}
	
	method validarQuePuedeAtender(animal){
		if(not self.puedeAtender(animal))
			self.error("No puede atender al animal")
		
	}
}