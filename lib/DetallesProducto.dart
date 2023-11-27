import 'package:flutter/material.dart';

class DetallesProducto extends StatelessWidget {
  final dynamic producto;

  DetallesProducto(this.producto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto', style: TextStyle(color:Colors.white),),
        backgroundColor: const Color.fromARGB(255, 24, 36, 202),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Id del producto: ${producto['idProducto']}'),
            Text('Nombre: ${producto['nombre']}'),
            Text('Precio de Compra: ${producto['precioCompra']}'),
            Text('Precio de venta: ${producto['precioVenta']}'),
            Text('Cantidad: ${producto['cantidad']}'),
            Text('Estado: ${producto['estado']}'),
            Text('Stock minimo: ${producto['stockMinimo']}'),
            Text('Stock maximo: ${producto['stockMaximo']}'),
          ],
        ),
      ),
    );
  }
}