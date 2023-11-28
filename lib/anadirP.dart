
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class AnadirProducto extends StatefulWidget {
  const AnadirProducto({super.key});

  @override
  State<AnadirProducto> createState() => _AnadirProductoState();
}

class _AnadirProductoState extends State<AnadirProducto> {
  final idProducto = TextEditingController();
  final nombre = TextEditingController();
  final precioCompra = TextEditingController();
  final precioVenta = TextEditingController();
  final cantidad = TextEditingController();
  final stockMinimo = TextEditingController();
  final estado = TextEditingController();
  final stockMaximo = TextEditingController();

  @override
  void initState() {
    super.initState();
    postProductos();
  }

  Future<void> postProductos() async {
    final uri = Uri.parse("https://api-productos3.onrender.com/api/producto");
    final response = await http.post(uri,
        body: jsonEncode({
          'idProducto': int.parse(idProducto.text),
          'nombre': nombre.text,
          'precioCompra': int.parse(precioCompra.text),
          'precioVenta': int.parse(precioVenta.text),
          'cantidad': int.parse(cantidad.text),
          'stockMinimo': int.parse(stockMinimo.text),
          'estado': estado.text,
          'stockMaximo': int.parse(stockMaximo.text)
        }),
        headers: {'Content-Type': 'Application/json'});

    //si es 200 es porque todo esta bien
    if (response.statusCode == 200) {
      setState(() {
        print(response.body);
      });
    } else {
      print('Revisar el codigo existen fallos ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formProd = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar productos', style: TextStyle(color:Colors.white),),
        backgroundColor: const Color.fromARGB(255, 24, 36, 202),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Form(
              key: formProd,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Diligencie el siguiente formulario"),
                            ),
                            TextFormField(
                              controller: idProducto,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Id producto'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nombre,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  label: Text('Nombre'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: precioCompra,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Precio compra'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: precioVenta,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Precio venta'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: cantidad,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Cantidad'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: stockMinimo,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Stock minimo'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: stockMaximo,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Stock maximo'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: estado,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  label: Text('Estado'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Este campo es requerido';
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  autofocus: true,
                                  onPressed: () {
                                    if (!formProd.currentState!.validate()) {
                                      print('Formulario no valido');
                                      return;
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "Producto añadido con exito",
                                      ).show();
                                      postProductos();
                                      idProducto.clear();
                                      nombre.clear();
                                      precioCompra.clear();
                                      precioVenta.clear();
                                      cantidad.clear();
                                      stockMinimo.clear();
                                      stockMaximo.clear();
                                      estado.clear();
                                    }
                                  },
                                  child: const Text("Añadir",style: TextStyle(color:Colors.white)), style: ElevatedButton.styleFrom(
                                    backgroundColor:  Color.fromARGB(255, 24, 36, 202)
                                  )),
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
