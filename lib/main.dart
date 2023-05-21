// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:examen_prueba/screens/home_screen.dart';
import 'package:examen_prueba/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gastos App',
      initialRoute: 'login',
      routes: {
        'login' : (_) => LoginScreen(),
        'home' : (_) => HomeScreen(),
      },
      theme: ThemeData.light().copyWith( // Personaliza y ajusta fácilmente los temas sin reescribir todo el objeto completo.
        scaffoldBackgroundColor: Colors.grey[300], // Color del fondo
        appBarTheme: AppBarTheme( // Aspectos sobre el AppBar de la App
          color: Colors.tealAccent[400], // Color fondo
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData( // Aspectos sobre los FloatingButtons
          backgroundColor: Colors.tealAccent[400],
          elevation: 10,
          foregroundColor: Colors.black87 // Color del icono/fuente
        ),
      ),
    );
  }
}