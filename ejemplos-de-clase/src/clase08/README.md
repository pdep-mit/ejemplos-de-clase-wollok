## Compras online

Estamos modelando una página web, Univago, a través de la cual se pueden comprar productos al mejor precio.
Cada usuario de Univago tiene una billetera virtual a la cual le puede cargar crédito que luego podrán usar para hacer compras.
Además, tienen un carrito al cual pueden agregar los productos que deseen llevar.
En cualquier momento, un usuario puede comprar todo lo que tiene en ese momento en el carrito. Hacer esto le resta al usuario tanto crédito como la suma de todos los productos de su carrito y además vacía el carrito. También se debería actualizar el stock del producto.
Solo se realiza la compra si el usuario tiene suficiente crédito en su billetera, y si hay stock de todos los productos al momento de comprar.

Como el stock estaba siendo un problema y se estaban perdiendo muchas ventas a causa de no tener de algún producto, queremos implementar que cada usuario pueda optar por que si alguno de los productos que iba a comprar no tiene stock, el mismo sea reemplazado por uno similar (siempre y cuando exista un producto similar que tenga stock).

