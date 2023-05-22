import 'models.dart';

/*
Clase que define los gastos de nuestra App
*/

class Gasto {
    String quantitat;
    String titol;

    String? id; // Metido manualmente y con (?) ya que no crearemos IDs por el constructor

    Gasto({
        required this.quantitat,
        required this.titol,
    });

    factory Gasto.fromJson(String str) => Gasto.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory Gasto.fromMap(Map<String, dynamic> json) => Gasto(
        quantitat: json["quantitat"],
        titol: json["titol"],
    );

    // Map<String, dynamic> toMap() => {
    //     "quantitat": quantitat,
    //     "titol": titol,
    // };
}