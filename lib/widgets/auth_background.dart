// ignore_for_file: prefer_const_constructors, unnecessary_this, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child; // SingleChildScrollView pasado por parametro

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ocupar todo el espacio disponible dentro de su contenedor padre (se centra por defecto)
      height: double.infinity,
      child: Stack( // Layout que superpone un hijo encima del anterior
        children: [
          _GreenBox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Extraccion del tamanyo de la pantalla
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _greenBoxDecoration(),
      child: Stack(
        children: [
          Positioned(top: 120, left: 30, child: _Bubble()),
          Positioned(top: -20, left: -30, child: _Bubble()),
          Positioned(top: -30, right: -20, child: _Bubble()),
          Positioned(top: 150, right: 20, child: _Bubble()),
          Positioned(bottom: -50, left: 10, child: _Bubble()),
        ],
      ),
    );
  }

  // Metodo que devuelve el disenyo del Container padre
  BoxDecoration _greenBoxDecoration() => BoxDecoration(
    gradient: LinearGradient( // Degradacion de color de izqda a dcha
      colors: [
        Color.fromRGBO(29, 233, 182, 1),
        Colors.blue
      ],
    ),
  );
}

// Clase que representa los circulos degradados del contenedor (fondo)
class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: _whiteBoxDecoration(),
    );
  }

  // Metodo que devuelve el disenyo de las Bubbles
  BoxDecoration _whiteBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(100), // Circulo
    gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.1),
        ],
        stops: [0.0, 1.0],
      ),
  );
}

// Clase que representa el icono sobre el contenedor (fondo)
class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // Adaptacion del dimensionado teniendo en cuenta las diferentes pantallas de los dispositivos
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30), // Separacion del margen superior
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}