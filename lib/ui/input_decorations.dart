// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

/*
Disenyo de los TextFields del Login
*/

class InputDecorations {
  
  // Metodo para devolver el disenyo predeterminado para los TextFields
  static InputDecoration authInputDecoration({required String hintText, required String labelText, IconData? prefixIcon}) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(29, 233, 182, 1) // Color de la barra inferior del campo
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(29, 233, 182, 1), // Color de la barra inferior del campo al estar seleccionada
          width: 2 // Grosor de la barra al estar seleccionada
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: (prefixIcon != null) // Icono segun si se ha pasado o no el parametro
        ? Icon(prefixIcon, color: Color.fromRGBO(29, 233, 182, 1)) // En caso de que haya parametro
        : null, // En caso de que no se haya pasado ningun parametro
    );  
  }
}