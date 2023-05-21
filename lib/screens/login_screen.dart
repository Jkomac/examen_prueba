// ignore_for_file: prefer_const_constructors

import 'package:examen_prueba/widgets/auth_background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView()
      )
    );
  }
}