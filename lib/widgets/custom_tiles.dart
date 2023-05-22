// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTiles extends StatelessWidget {
  const CustomTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (_, index) => Dismissible( // Para poder implementar el Swipe lateral de los Tiles
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight, // Alineamiento del Bin Icon del Swipe
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Separacion entre el los margenes del Container y el Child
              child: Icon(Icons.delete_forever_rounded),
              //////////////////////////////////////////////////////////////////////////////////////////////
            ),
          ),
        ),
        child: ListTile(
          /////////////////////////////////////////////////////////////////////////
          title: Text('TITLES'),
          subtitle: Text('SUBTITLES'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.tealAccent[400],),
          onTap: () => Navigator.pushNamed(context, 'detail'), ///////////////////// Pasar por argumentos el objeto[index]
        ),
      ),
    );
  }
}