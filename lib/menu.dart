import 'package:departamentos_api/Personas.dart';
import 'package:departamentos_api/anadirP.dart';
import 'package:departamentos_api/eliminarProducto.dart';
import 'package:departamentos_api/listarUsuarios.dart';
import 'package:departamentos_api/modificar.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //el appBar puede contener un titulo
        appBar: AppBar(
          title: const Center(
              child: Text('Inicio',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 33))),
          backgroundColor: const Color.fromARGB(255, 24, 36, 202),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const SizedBox(
                height: 64,
                width: 50,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 24, 36, 202),
                  ),
                  child: Text(
                    'Gestion de productos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.my_library_books_sharp,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Listar productos'),
                trailing: const Icon(Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const ListarUsuarios());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_circle,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Añadir producto'),
                trailing: const Icon(Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const AnadirProducto());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_document,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Actualizar producto'),
                trailing: const Icon(Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const ModificarProductos());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_sweep,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Eliminar producto'),
                trailing: const Icon(Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const EliminarProductos());
                  Navigator.push(context, route);
                },
              ),
               const SizedBox(height: 60.0),
              ListTile(
                leading: const Icon(Icons.cloud_sync_outlined,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Cerrar sesion'),
                trailing: const Icon(Icons.arrow_forward,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onTap: () {
                  Navigator.popUntil(
                    context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: const [
            Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrI1BuJAGKJ-UfFiJ_jbroyYDo2-SMIKrwpE9YC90TgAN1kQ1NVadYgxfVSRRrKOEKe1M&usqp=CAU'))
          ],
        ));
  }
}
