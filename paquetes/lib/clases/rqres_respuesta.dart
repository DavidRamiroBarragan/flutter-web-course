import 'dart:convert';

import 'package:paquetes/clases/persona.dart';

ReqresRespuesta reqresRespuestaFromJson(String str) =>
    ReqresRespuesta.fromJson(str);

String reqresRespuestaToJson(ReqresRespuesta data) => json.encode(data.toJson());

class ReqresRespuesta {
  ReqresRespuesta({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Persona> data;

  factory ReqresRespuesta.fromJson(String str) =>
      ReqresRespuesta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqresRespuesta.fromMap(Map<String, dynamic> json) => ReqresRespuesta(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Persona>.from(json["data"].map((x) => Persona.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
