// ignore_for_file: unnecessary_this, unused_element
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http; // Importacion manual sobre peticiones http

/*
Clase que gestiona las peticiones a nuestra API REST de Firebase sobre los Users usando Provider
*/

class UserService extends ChangeNotifier{

  final String _baseUrl = 'examen-55e66-default-rtdb.europe-west1.firebasedatabase.app';  // URL de FireBase obtenido desde Postman
  final List<User> users = []; // Lista de usuarios a mostrar

  bool isLoading = true; // Variable para saber cuando esta cargando

  // Constructor
  UserService(){
    this.loadUsers();
  }

  // Metodo que cargara los users a la App
  Future loadUsers() async {
    isLoading = true; // Inicio de la carga de datos
    notifyListeners();

    final url = Uri.https(_baseUrl, 'users.json'); // Base URL + EndPoint
    final resp = await http.get(url);

    final Map<String, dynamic> usersMap = json.decode(resp.body); // String seria el ID del User y dynamic el contenido del User
    
    usersMap.forEach((key, value) { // El ID del User seria la key y el User en si el value
      final tempUser = User.fromMap(value); // Asignacion al User sus atributos
      tempUser.id = key; // Asignacion de su ID
      users.add(tempUser); // Anyadimos el gasto a la lista de Gastos

      isLoading = false; // Indicar el fin de carga de datos
      notifyListeners();
    });

    // Metodo para crear un user en el servidor de FireBase y en la lista local
    Future<String> createUser(User user) async {
      final url = Uri.https(_baseUrl, 'users.json');
      final resp = await http.post(url, body: user.toJson());
      final decodedData = json.decode(resp.body);
      user.id = decodedData['name'];

      // Incorporar el nuevo producto a la lista local
      this.users.add(user);

      return user.id!;
    }
    // Metodo para crear o actualizar un Usuario
    Future crearUser(User user) async {
      if (user.id == null) {
        // Creacion de un producto
        await createUser(user);
        notifyListeners();
      }
      print('No se ha podido crear usuario');
    }
  }

  ////////////////////////////

//   // Metodo para hacer un DELETE sobre la tabla Scans de la BD segun el id indicado devolviendo el numero de tuplas afectadas *
//   Future<int> deleteScanById(int id) async{
//     final db = await database;
//     final res = db.delete('Scans', where: 'id = ?', whereArgs: [id]);
//     return res;
//   }
//   // Metodo para borrar el ScanModel que haya tenga el mismo id que el indicado (Funcionalidad al hacer el swipe horizontal para borrar un Tile)
//   esborraPerId(int id) async{
//     await DBProvider.db.deleteScanById(id);
//     scans.removeWhere((scan) => scan.id == id); // Metodo para borrar el Scan indicado por el id del array de Scans 
//     notifyListeners();
//   }

//   /////////////////////////////
  
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

// // Método para eliminar un escaneo por su ID en la base de datos
// Future<void> deleteScanById(String id) async {
//   await _databaseReference.child('Scans/$id').remove();
// }

// // Método para eliminar un ScanModel por su ID
// Future<void> deleteScanModelById(String id) async {
//   await deleteScanById(id);
//   scans.removeWhere((scan) => scan.id == id);
//   notifyListeners();
// }

}