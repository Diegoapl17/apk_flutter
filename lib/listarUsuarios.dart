import 'package:departamentos_api/DetallesProducto.dart';
import 'package:departamentos_api/busqueda.dart';
import 'package:departamentos_api/eliminarProducto.dart';
import 'package:departamentos_api/futureBusqueda.dart';
import 'package:departamentos_api/modificar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListarUsuarios extends StatefulWidget {
  const ListarUsuarios({super.key});

  @override
  State<ListarUsuarios> createState() => _ListarUsuariosState();
}

class _ListarUsuariosState extends State<ListarUsuarios> {
  List<dynamic> data = []; //almacenar los datos obtneidos de la api

  @override
  void initState() {
    super.initState();
    getUsuarios();
  }

  Future<void> getUsuarios() async {
    final response = await http
        .get(Uri.parse('https://api-productos3.onrender.com/api/producto'));

    //si es 200 es porque todo esta bien
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeData = json.decode(response.body);

      setState(() {
        data = decodeData['productos'] ?? [];
        print(data);
      });
    } else {
      print('Revisar el codigo existen fallos ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Listar productos',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 24, 36, 202),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: BusquedaProductos(data),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
              color: const Color.fromARGB(255, 251, 251, 251),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: data.length, //definimos la cantidad elementos
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: ListTile(
                          title: Text(data[index]['idProducto'].toString()),
                        )),
                        Expanded(
                          child: ListTile(
                            title: Text(data[index]['nombre']),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetallesProducto(data[index]),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                            child: ListTile(
                          title: Text(data[index]['precioCompra'].toString()),
                        )),
                        Expanded(
                          child: ListTile(
                            leading: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onTap: () {
                              final route = MaterialPageRoute(
                                  builder: (context) =>
                                      const ModificarProductos());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: const Icon(Icons.delete,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onTap: () {
                              final route = MaterialPageRoute(
                                  builder: (context) =>
                                      const EliminarProductos());
                              Navigator.push(context, route);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}