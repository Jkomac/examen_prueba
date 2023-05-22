// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import '../ui/input_decorations.dart';
import '../widgets/widgets.dart';

/*
Clase para la creacion de un nuevo Gasto
*/

class NewGastoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed:() => Navigator.pop(context), // Boton para volver atras (Home)
        ),
        title: Text('NewGasto'),
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
        child: Icon(Icons.save),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}