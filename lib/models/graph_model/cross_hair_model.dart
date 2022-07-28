// To parse this JSON data, do
//
//     final crosshair = crosshairFromJson(jsonString);

import 'dart:convert';

List<Crosshairmodel> crosshairFromJson(String str) => List<Crosshairmodel>.from(
    json.decode(str).map((x) => Crosshairmodel.fromJson(x)));

String crosshairToJson(List<Crosshairmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Crosshairmodel {
  Crosshairmodel({
    this.year,
    this.value,
  });

  String year;
  String value;

  factory Crosshairmodel.fromJson(Map<String, dynamic> json) => Crosshairmodel(
        year: json["year"] as String,
        value: json["value"] as String,
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "value": value,
      };
}
