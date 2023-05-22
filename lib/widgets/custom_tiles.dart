// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations
import 'package:examen_prueba/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
Clase que representa el listado de users de la ventana principal
*/

class CustomTiles extends StatelessWidget {
  const CustomTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    int items = userService.users.length;

    return ListView.builder(
      itemCount: items,
      itemBuilder: (_, index) => Dismissible( // Para poder implementar el Swipe lateral de los Tiles
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment:Alignment.centerRight, // Alineamiento del Bin Icon del Swipe
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Separacion entre el los margenes del Container y el Child
              child: Icon(Icons.delete_forever_rounded),
              //////////////////////////////////////////////////////////////////////////////////////////////
            ),
          ),
        ),
        child: ListTile(
          /////////////////////////////////////////////////////////////////////////
          title: Text('${userService.users[index].name}'),
          subtitle: Text('${userService.users[index].email}'),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.tealAccent[400],
          ),
          onTap: () => Navigator.pushNamed(context, 'detail',
              arguments: userService.users[index]), // Pasar por argumentos el objeto[index]
        ),
      ),
    );
  }
}