import 'package:departamentos_api/DetallesProducto.dart';
import 'package:flutter/material.dart';

class BusquedaProductos extends SearchDelegate<String> {
  final List<dynamic> data;

  BusquedaProductos(this.data);

   @override
  String get searchFieldLabel => 'Buscar productos';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((producto) =>
            producto['nombre'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildResultList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where((producto) =>
            producto['nombre'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildResultList(suggestions);
  }

  Widget _buildResultList(List<dynamic> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results[index]['nombre']),
          // Agrega cualquier otra información que desees mostrar en los resultados
          onTap: () {
            // Aquí puedes manejar la acción cuando el usuario selecciona un resultado
            // Por ejemplo, puedes navegar a una nueva pantalla para mostrar los detalles completos.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetallesProducto(results[index]),
              ),
            );
          },
        );
      },
    );
  }
}
