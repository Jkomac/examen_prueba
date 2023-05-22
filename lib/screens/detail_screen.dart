// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:examen_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../ui/input_decorations.dart';

/*
Clase donde se reflejan los detalles del gasto seleccionado
*/

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          CardContainer(
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField( // GASTO
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Expense Name',
                      labelText: 'Expense',
                      prefixIcon: Icons.shopping_cart_outlined),
                ),
                SizedBox(height: 30),
                TextFormField( // CANTIDAD
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Amount',
                      labelText: 'Quantity',
                      prefixIcon: Icons.euro),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
