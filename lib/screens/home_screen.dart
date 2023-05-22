// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

/*
Clase que refleja la ventana principal con una lista de gastos
*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gastosService = Provider.of<GastosService>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed:() => Navigator.pushReplacementNamed(context, 'login'), // Boton para volver atras (Login)
        ),
        title: Text('HomeScreen'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.black),
            onPressed: () => null, 
          ),
        ],
      ),
      body: CustomTiles(),
      floatingActionButton: FloatingActionButton( // Boton inferior derecho
        child: Icon(Icons.add), // Icono
        onPressed: () => Navigator.pushNamed(context, 'newGasto'),
        ),
    );
  }
}