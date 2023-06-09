// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'package:examen_prueba/models/models.dart';
import 'package:examen_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../ui/input_decorations.dart';

/*
Clase donde se reflejan los detalles del user seleccionado
*/

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User; // Recepcion del argumento de la anterior pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CardContainer(
            child: Column(
              children: [
                // Container(
                //   color: Colors.red,
                //   height: 70,
                //   width: 70,
                //   child: Image.asset(user.photo),
                // ),
                TextFormField( // USER
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'User Name',
                      labelText: '${user.name}',
                      prefixIcon: Icons.person),
                ),
                TextFormField( // Email
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Email',
                      labelText: '${user.email}',
                      prefixIcon: Icons.alternate_email),
                ),
                TextFormField( // Address
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Address',
                      labelText: '${user.address}',
                      prefixIcon: Icons.home),
                ),
                TextFormField( // Phone
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Phone',
                      labelText: '${user.phone}',
                      prefixIcon: Icons.phone),
                ),
                SizedBox(height: 10)
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
