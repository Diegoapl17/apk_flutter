import 'dart:convert';
import 'package:departamentos_api/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class EliminarProductos extends StatefulWidget {
  final Map<String, dynamic>? producto;
  const EliminarProductos({Key? key, this.producto}) : super(key: key);

  @override
  State<EliminarProductos> createState() => _EliminarProductosState();
}

class _EliminarProductosState extends State<EliminarProductos> {
  final idProducto = TextEditingController();
  List<dynamic> data1 = [];

  @override
  void initState() {
    super.initState();
    if (widget.producto != null) {
    idProducto.text = widget.producto!['idProducto'].toString();
  }
  }

  Future<void> deleteProductos() async {
    final Map<String, dynamic> data = {
      'idProducto': idProducto.text,
    };

    final response = await http.delete(
        Uri.parse('https://api-productos3.onrender.com/api/producto'),
        body: json.encode(data),
        headers: {'Content-Type': 'Application/json'});

    final response2 = await http
        .get(Uri.parse('https://api-productos3.onrender.com/api/producto'));

    if (response.statusCode == 200) {
      print('Eliminacion exitosa');
      Map<String, dynamic> decodeData = json.decode(response2.body);
      setState(() {
        data1 = decodeData['productos'] ?? [];
        print(data1);
      });
    } else {
      print('Ocurrio un error ${response.statusCode} ${response.reasonPhrase}');
    }
  }

  Widget build(BuildContext context) {
    final GlobalKey<FormState> formularioCon = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar productos', style: TextStyle(color:Colors.white),),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Text("Ingrese el id del producto a eliminar"),
                            ),
                            TextFormField(
                              controller: idProducto,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    bool existe1 = false;
                                    if (!formularioCon.currentState!
                                        .validate()) {
                                      print('Formulario no valido');
                                      return;
                                    }
                                    for (var i = 0; i < data1.length; i++) {
                                      if (data1[i]['idProducto'] == int.parse(idProducto.text)) {
                                        existe1 = true;
                                      }
                                    }
                                    if(existe1== true){
                                        Alert(
                                          type: AlertType.warning,
                                          context: context,
                                          title:
                                              "¿Esta seguro de eliminar este producto?",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Si",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () {
                                                deleteProductos();
                                                idProducto.clear();
                                                Navigator.of(context).pop();
                                              },
                                              color: Color.fromARGB(
                                                  255, 8, 94, 15),
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                final route = MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Menu());
                                                Navigator.push(context, route);
                                                setState(() {});
                                              },
                                              color: Color.fromARGB(
                                                  255, 173, 7, 7),
                                            )
                                          ],
                                        ).show();
                                      }
                                      if (existe1 == false) {
                                        Alert(
                                          context: context,
                                          type: AlertType.error,
                                          title: "No existe un producto en ese Id",
                                          desc:"Vuelva a intentarlo",
                                        ).show();
                                        idProducto.clear();
                                      }
                                    },
                                  child: const Text("Eliminar",style: TextStyle(color:Colors.white)), style: ElevatedButton.styleFrom(
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
