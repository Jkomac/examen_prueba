// ignore_for_file: unnecessary_this, unused_field,, avoid_print
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http; // Importacion manual sobre peticiones http

/*
Clase que gestiona las peticiones a nuestra API REST de Firebase sobre los Gastos usando Provider
*/

class GastosService extends ChangeNotifier{

  final String _baseUrl = 'examen-55e66-default-rtdb.europe-west1.firebasedatabase.app'; // URL de FireBase obtenido desde Postman
  final List<Gasto> gastos = []; // Lista de gastos a mostrar

  bool isLoading = true; // Variable para saber cuando esta cargando


  // Constructor
  GastosService(){
    this.loadGastos();
  }

  // Metodo que cargara los gastos a la App
  Future loadGastos() async {
    final url = Uri.https(_baseUrl, 'gastos.json'); // Base URL + EndPoint
    final resp = await http.get(url);

    final Map<String, dynamic> gastosMap = json.decode(resp.body); // String seria el ID del Gasto y dynamic el contenido del gasto
    
    gastosMap.forEach((key, value) { // El ID del gasto seria la key y el gasto en si el value
      final tempGasto = Gasto.fromMap(value); // Asignacion al Gasto sus atributos
      tempGasto.id = key; // Asignacion de su ID
      gastos.add(tempGasto); // Anyadimos el gasto a la lista de Gastos
      notifyListeners();
    });
  }
}