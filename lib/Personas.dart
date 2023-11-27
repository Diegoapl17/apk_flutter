import 'dart:convert';

import 'package:departamentos_api/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Personas extends StatefulWidget {
  const Personas({super.key});

  @override
  State<Personas> createState() => _PersonasState();
}

class _PersonasState extends State<Personas> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    listaPersonas();
  }

  Future<void> listaPersonas() async {
    final response = await http
        .get(Uri.parse('https://api-usuario-2oqx.onrender.com/api/usuario'));

    if (response.statusCode == 200) {
      Map<String, dynamic> decodeData = json.decode(response.body);

      setState(() {
        data = decodeData['usuarios'] ?? [];
        print(data);
      });
    } else {
      print('Revisar el codigo existen fallos ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formularioCon = GlobalKey<FormState>();
    final usuario = TextEditingController();
    final contrasena = TextEditingController();
    return Scaffold(
        //el appBar puede contener un titulo
        appBar: AppBar(
          title: const Center(
              child: Text('Inicio de sesion',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 33))),
          backgroundColor: const Color.fromARGB(255, 24, 36, 202),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Form(
              key: formularioCon,
              child: Column(
                children: [
                  TextFormField(
                    controller: usuario,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.people),
                      labelText: 'Nombre',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'El nombre es requerido';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: contrasena,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Documento',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'El documento es requerido';
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (!formularioCon.currentState!.validate()) {
                            print('Formulario no valido');
                            return;
                          }
                          for (var i = 0; i < data.length; i++) {
                            if (data[i]['nombre'] == usuario.text &&
                                data[i]['documento'] == contrasena.text) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Menu()),
                              );
                            }
                          }
                        },
                        child: Text("Ingresar",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 24, 36, 202))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
// import 'package:flutter/material.dart';


// class MyAppForm extends StatefulWidget {
//   const MyAppForm({Key? key}) : super(key: key);

//   @override
//   _MyAppFormState createState() => _MyAppFormState();
// }

// class _MyAppFormState extends State<MyAppForm> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,

//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(

//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.purple, Colors.orange])),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             title: const Text('Formulario de ingreso a la app'),
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.purple, Colors.orange],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     stops: [0.0, 1.0],
//                     tileMode: TileMode.clamp),
//               ),
//             ),
//           ),

//           body: ListView(

//             padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 90.0),
//             children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 100.0,
//                     backgroundColor: Colors.transparent,
//                     backgroundImage:
//                     AssetImage('images/138-1388174_login-account-icon.png'),
//                   ),
//                   const Text(
//                     'Login',
//                     style: TextStyle(
//                         fontFamily: 'MerriWeatherLightItalic', fontSize: 50.0),
//                   ),
//                   const Text(
//                     'Ingrese su usuario y contraseña',
//                     style: TextStyle(
//                         fontFamily: 'MerriWeatherLightItalic', fontSize: 20.0),
//                   ),
//                   const SizedBox(
//                     width: 160.0,
//                     height: 15.0,
//                     child: Divider(color: Colors.transparent),
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Escribe un nombre de usuario';
//                       }
//                     },
//                     enableInteractiveSelection: false,
//                     // autofocus: true,
//                     textCapitalization: TextCapitalization.characters,
//                     decoration: InputDecoration(
//                         hintText: 'USER-NAME',
//                         labelText: 'Nombre de usuario',
//                         suffixIcon: const Icon(Icons.verified_user),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0))),
//                   ),
//                   const Divider(
//                     height: 20.0,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Escribe un correo electronico';
//                       }
//                     },
//                     decoration: InputDecoration(
//                         hintText: 'Email',
//                         labelText: 'Correo/Email',
//                         suffixIcon: const Icon(Icons.alternate_email),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0))),

//                   ),
//                   const Divider(
//                     height: 15.0,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Escribe una contraseña';
//                       }
//                     },
//                     enableInteractiveSelection: false,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         hintText: 'Password',
//                         labelText: 'Contraseña/Password',
//                         suffixIcon: const Icon(Icons.lock_outline),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0))),
//                   ),
//                   const Divider(
//                     height: 20.0,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => SecondRoute()),
//                         // );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.deepPurple[600],
//                       backgroundColor: Colors.deepPurple[600], // foreground

//                     ),
//                     child: const Text('Sing in',
//                       style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 30.0,
//                           fontFamily: 'MerriWeatherLightItalic'),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),)

//     );
//   }
// }

