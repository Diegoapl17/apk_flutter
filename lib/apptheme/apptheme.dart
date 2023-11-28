
import 'package:flutter/material.dart';

class ModosApp{
  static final tema1 = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
    ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      
      ),
      drawerTheme: const DrawerThemeData(
        
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
     
      ) 
  );
  static final tema2 = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
      )
  );
}