import 'dart:convert';

import 'package:admin_dashboard/models/user.dart';

class UserResponse {
  UserResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<Usuario> usuarios;

  factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
    total: json["total"],
    usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
  };
}

