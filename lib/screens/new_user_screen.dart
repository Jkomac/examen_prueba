// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, unnecessary_new
import 'package:examen_prueba/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../ui/input_decorations.dart';
import '../widgets/widgets.dart';

/*
Clase para la creacion de un nuevo User
*/

class NewUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _address = TextEditingController();
    TextEditingController _phone = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed:() => Navigator.pop(context), // Boton para volver atras (Home)
        ),
        title: Text('New User'),
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
                  controller: _name,
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.name,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'User Name',
                      labelText: 'Name',
                      prefixIcon: Icons.person),
                ),
                TextFormField( // Email
                  controller: _email,
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icons.alternate_email),
                ),
                TextFormField( // Address
                  controller: _address,
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Address',
                      labelText: 'Address',
                      prefixIcon: Icons.home),
                ),
                TextFormField( // Phone
                  controller: _phone,
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Phone',
                      labelText: 'Phone',
                      prefixIcon: Icons.phone),
                ),
                TextFormField( // Photo
                  autocorrect: false, // Autocorrector desactivado
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Link Photo',
                      labelText: 'Photo',
                      prefixIcon: Icons.photo),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final userService = Provider.of<UserService>(context);
          User user = new User(address: _address.text, email: _email.text, name: _name.text, phone: _phone.text);
          //userService.crearUser();
          Navigator.pop(context);
        },
      ),
    );
  }
}