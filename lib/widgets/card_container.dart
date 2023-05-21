// ignore_for_file: prefer_const_constructors, unnecessary_this, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

/*
Clase que refleja el disenyo del Card del Login
*/

class CardContainer extends StatelessWidget {
  final Widget child; // Column pasado por parametro
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding( // Delimita el espacio colindante del Widget que contenga
      padding: EdgeInsets.symmetric(horizontal: 30), // Separacion del margen del Container respecto a la pantalla (exterior)
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30), // Separacion del margen del Container - Child por parametro (interior)
        decoration: _cardBoxDecoration(),
        child: this.child,
      ),
    );
  }

  // Metodo para el disenyo del Card del Login
  BoxDecoration _cardBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0 , 5) // X e Y de la localizacion del sombreado respecto al componente padre
      ),
    ],
    color: Colors.white, // Color del fondo
  );
}