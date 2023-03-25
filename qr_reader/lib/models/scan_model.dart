// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  // propiedades
  int id;
  String tipo;
  String valor;

  // constructor
  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  });
  
  // esto va a regresar una nueva instancia de la clase
  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  // toma la instancia de la clase y lo pasa a un mapa
  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
