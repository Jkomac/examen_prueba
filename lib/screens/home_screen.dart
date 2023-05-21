// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Text('HomeScreen')
      ),
      floatingActionButton: FloatingActionButton( // Boton inferior derecho
        child: Icon(Icons.save), // Icono
        onPressed: () => null,
        ),
    );
  }
}