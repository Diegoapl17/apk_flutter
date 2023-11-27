// import 'package:departamentos_api/futureBusqueda.dart';
// import 'package:flutter/material.dart';

// class BusquedaProductos extends SearchDelegate{
//   @override
//   String get searchFieldLabel => 'Buscar productos';

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () => this.query = '',
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: Icon(Icons.arrow_back_ios),
//         onPressed: () => this.close(context, null) ,
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.trim().length ==0) {
//       return Text('No hay valor ');
//     }

//    final ff = xx;

//    return FutureBuilder(
//     future: ff.busquedaProductos(query),
//     builder:( _ , AsyncSnapshot snapshot){
//       if (snapshot.hasData) {
//         return Text('tenemos data');
//       }else{
//         return Center(child: CircularProgressIndicator(strokeWidth: 4,),);
//       }
//     },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListTile(
//       title: Text('hhh'),
//     );
//   }


// }