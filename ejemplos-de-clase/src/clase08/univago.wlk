class Producto {
	var property stock
	
	const property nombre
	
	var property precio
	
	method bajarStock(cantidad) {
		if(cantidad > stock) { self.error("No hay suficiente stock de " + nombre + ". Se trató de bajar " + cantidad.toString() + " y había " + stock.toString()) }
		stock -= cantidad
	}
}

class OutOfStockException inherits DomainException {
}

class ProductoAgregado {
	const property producto
	var cantidad
	
	method hayStock() = cantidad <= producto.stock()
	
	method esDeProducto(unProducto) {
		return producto == unProducto
	}

	method validarStock() {
		if(!self.hayStock()) {
			throw new OutOfStockException(message="No hay stock de " + producto.nombre())
		}
	}

	method precioTotal() = cantidad * producto.precio()
	
	method bajarStock() {
		producto.bajarStock(cantidad)
	}
}

class Carrito {
	const productosAgregados = []

	method agregar(nuevoProducto) {
		const productoAgregado = productosAgregados.
			findOrElse({ productoAgregado => 
				productoAgregado.esDeProducto(nuevoProducto)
			}, { 
				const nuevoProductoAgregado = new ProductoAgregado(producto=producto,
																   cantidad=0)
				productosAgregados.add(nuevoProductoAgregado)
				nuevoProductoAgregado
			})
		productoAgregado.incrementarCantidad()
	}
	
	method sacar(producto) {
		productosAgregados.remove(producto)
	}
	
	method precioTotal() = productosAgregados.sum { producto => producto.precioTotal() }
	
	method seHizoLaCompra() {
		productosAgregados.forEach { producto => producto.bajarStock() }
		productosAgregados.clear()
	}
	
	method sacaLosQueNoTenganStock() {
		productosAgregados.removeAllSuchThat { producto => !producto.hayStock() }
	}
}

class Usuario {
	var credito = 0
	const carrito = new Carrito()

	method cargarCredito(creditoACargar) {
		credito += creditoACargar
	}
	
	method validarSaldo(precio) {
		if(credito < precio) {
			self.error("No alcanza la plata para pagar. El usuario tiene " + credito.toString() + " y lo que quería pagar era " + precio.toString())
		}
	}
	
	method decrementarSaldo(precio) { 
		self.validarSaldo(precio)

		credito -= precio
	}
	
	method comprar() {
		carrito.sacaLosQueNoTenganStock()

		const precioTotal = carrito.precioTotal()

		self.decrementarSaldo(precioTotal)

		carrito.seHizoLaCompra()
	}
	
	method agregarAlCarrito(unProducto) {
		carrito.agregar(unProducto)
	}
}
