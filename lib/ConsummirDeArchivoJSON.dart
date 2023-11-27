import 'package:departamentos_api/depatamento.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Departamento>> fetchDepartamentos() async {
  //obtener de la url la informacion
  final response = await http.get(Uri.parse(
    'https://datos.gov.co/resource/vcjz-niiq.json'));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => Departamento.fromJSON(e)).toList();
  }else{
    throw Exception('Fallo');
  }
}

class Listar extends StatelessWidget {
  const Listar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Departamento>>(
            //es donde creamos un ciclo colocamos el metodo fetchAlbum que es el future
            future: fetchDepartamentos(),
            //contex sera el nombre del array y datos la variable con la que iteramos 
            builder: (context, datos){
            if (datos.hasData) {//si hay datos

              return ListView.builder(
                itemBuilder: (context, index){
               return Column(
                children: [
                  
                  Row(
                    children: [
                      Expanded(
                          child: ListTile(
                          title: Text(datos.data![index].codigo_departamento.toString())
                      )),
                      Expanded(
                          child: ListTile(
                            title: Text('Departamento'),
                            subtitle: Text(datos.data![index].nombre_departamento.toString()),
                      )),
                    ],

                  )
                    
                ],
                );
                });
            }else if(datos.hasError) {
              return Text('${datos.error}');
            }else{
              return const CircularProgressIndicator();
            }
            
          }
        ),
      ),
      ),
    );
  }
}
