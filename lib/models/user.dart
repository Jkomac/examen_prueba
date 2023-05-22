import 'models.dart';

/*
Clase que define los usuarios de nuestra App
*/

class User {
    String address;
    String email;
    String name;
    String phone;
    String? photo; // Lo he puesto opcional para poder realizar el apartado de creacion de usuario

    String? id; // Metido manualmente y con (?) ya que no crearemos IDs por el constructor

    User({
        required this.address,
        required this.email,
        required this.name,
        required this.phone,
        this.photo,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    factory User.fromMap(Map<String, dynamic> json) => User(
        address: json["address"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        photo: json["photo"],
    );

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "photo": photo,
    };
}