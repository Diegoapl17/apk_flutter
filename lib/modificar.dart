import 'dart:convert';
import 'package:departamentos_api/DetallesProducto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModificarProductos extends StatefulWidget {
  const ModificarProductos({super.key});
   

  @override
  State<ModificarProductos> createState() => _ModificarProductosState();
}


class _ModificarProductosState extends State<ModificarProductos> {
  List<dynamic> data = []; //almacenar los datos obtneidos de la api
  final codi = TextEditingController();
  final actuaizacion = TextEditingController();
  final nuevoNom = TextEditingController();
  final nuevoPrecioCompra = TextEditingController();
  final nuevoPrecioVenta = TextEditingController();
  final nuevoCantidad = TextEditingController();
  final nuevoStockMinimo = TextEditingController();
  final nuevoEstado = TextEditingController();
  final nuevoStockMaximo = TextEditingController();
  @override
  void initState() {
    super.initState();
    putProductos();
  }

  Future<void> putProductos() async {
    final Map<String, dynamic> data = {
      'idProducto': int.parse(codi.text),
      'nombre': nuevoNom.text,
      'precioCompra': int.parse(nuevoPrecioCompra.text),
      'precioVenta': int.parse(nuevoPrecioVenta.text),
      'cantidad': int.parse(nuevoCantidad.text),
      'stockMinimo': int.parse(nuevoStockMinimo.text),
      'estado': nuevoEstado.text,
      'stockMaximo': int.parse(nuevoStockMaximo.text),
    };
    final response = await http.put(
        Uri.parse('https://api-productos3.onrender.com/api/producto'),
        body: json.encode(data),
        headers: {'Content-Type': 'Application/json'});

    if (response.statusCode == 200) {
      print('Modificacion exitosa');
    } else {
      print('Ocurrio un error ${response.statusCode} ${response.reasonPhrase}');
    }
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formularioCon = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar productos', style: TextStyle(color:Colors.white),),
        backgroundColor: const Color.fromARGB(255, 24, 36, 202),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Form(
              key: formularioCon,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DetallesProducto(),
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
                              controller: codi,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Id producto'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoNom,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  label: Text('Nombre'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoPrecioCompra,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Precio compra'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoPrecioVenta,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Precio venta'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoCantidad,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Cantidad'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoStockMinimo,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Stock minimo'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoStockMaximo,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  label: Text('Stock maximo'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: nuevoEstado,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  label: Text('Estado'),
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (!formularioCon.currentState!
                                        .validate()) {
                                      print('Formulario no valido');
                                      return;
                                    }
                                    putProductos();
                                    codi.clear();
                                    nuevoNom.clear();
                                    nuevoCantidad.clear();
                                    nuevoEstado.clear();
                                    nuevoPrecioCompra.clear();
                                    nuevoPrecioVenta.clear();
                                    nuevoStockMaximo.clear();
                                    nuevoStockMinimo.clear();
                                  },
                                  child:  Text("Actualizar",style: TextStyle(color:Colors.white)), style: ElevatedButton.styleFrom(
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
