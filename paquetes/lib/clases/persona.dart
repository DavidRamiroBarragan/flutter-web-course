import 'dart:convert';

Persona personaFromJson(String str) => Persona.fromJson(str);
String personaToJson(Persona persona) => json.encode(persona.toJson());

class Persona {
  Persona({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Persona.fromJson(String str) => Persona.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Persona.fromMap(Map<String, dynamic> json) => Persona(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}