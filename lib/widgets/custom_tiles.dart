// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:examen_prueba/services/gastos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTiles extends StatelessWidget {
  const CustomTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final gastosService = Provider.of<GastosService>(context);
    int items = gastosService.gastos.length;
    
    // Calculo de los gastos totales
    double totalAmount = 0;
    for (var element in gastosService.gastos) {
      totalAmount = totalAmount + double.parse(element.quantitat);
    }
    String totalAmountFormatted = totalAmount.toStringAsFixed(2); // Formateo a tan solo 2 decimales

    return Stack(
      children: [
      ListView.builder(
        itemCount: items,
        itemBuilder: (_, index) => Dismissible(
          // Para poder implementar el Swipe lateral de los Tiles
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
            title: Text('${gastosService.gastos[index].titol}'),
            subtitle: Text('${gastosService.gastos[index].id}'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.tealAccent[400],
            ),
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: gastosService.gastos[index]), // Pasar por argumentos el objeto[index]
          ),
        ),
      ),
      Positioned(bottom: 16, left: 16, child: Container(
        width: 250,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.tealAccent[400],
        ),
        padding: EdgeInsets.all(16),
        child: Text('TOTAL: $totalAmountFormatted€', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
      ),)
    ]);
  }
}