// ignore_for_file: prefer_final_fields
import 'package:shared_preferences/shared_preferences.dart';

/*
Definicion de nuestra clase de Preferences
*/

class Preferences{
  static late SharedPreferences _prefs;

  // Propiedades persistentes
  static String _email = '';
  static String _password = '';
  static bool _remember = false;

  // Inicializa y obtiene una instancia de SharedPreferences, permitiendo el almacenamiento y recuperación de datos persistentes
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getters y Setters de las propiedades persistentes
  static String get email => _prefs.getString('email') ?? _email; // En caso de que sea nulo, devolvera el valor por defecto '' (??)

  static set email(String value) {
    _email = value;
    _prefs.setString('email', value);
  }

  static String get password => _prefs.getString('password') ?? _password;

  static set password(String value) {
    _password = value;
    _prefs.setString('password', value);
  }

  static bool get remember => _prefs.getBool('remember') ?? _remember;

  static set remember(bool value) {
    _remember = value;
    _prefs.setBool('remember', value);
  }
}