
import 'package:departamentos_api/Personas.dart';
import 'package:departamentos_api/apptheme/apptheme.dart';
import 'package:departamentos_api/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // el un widget Scaffold puede contener otros widget
    return  MaterialApp(
      home: const Personas(),
      //ocultar la barra del debug
      debugShowCheckedModeBanner: false,

      theme: ModosApp.tema2,
    );
  }
}
