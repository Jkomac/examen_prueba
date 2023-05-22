// ignore_for_file: unnecessary_new, unused_field, prefer_final_fields
import 'package:flutter/material.dart';

/*
Clase que gestiona los estados de los valores del Login
*/

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Atributos
  String email = '';
  String password = '';
  bool remember = false;

  bool _isLoading = false;

  // Getter y Setter de la propiedad _isLoading
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false; // En caso de null, devuelve falso
  }
}