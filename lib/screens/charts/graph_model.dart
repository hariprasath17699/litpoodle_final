// To parse this JSON data, do
//
//     final graphmodel = graphmodelFromJson(jsonString);

import 'dart:convert';

List<Graphmodel> graphmodelFromJson(String str) =>
    List<Graphmodel>.from(json.decode(str).map((x) => Graphmodel.fromJson(x)));

String graphmodelToJson(List<Graphmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Graphmodel {
  Graphmodel({
    this.name,
    this.value,
    this.percent,
  });

  String name;
  int value;
  dynamic percent;

  factory Graphmodel.fromJson(Map<String, dynamic> json) => Graphmodel(
        name: json["name"],
        value: json["value"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "percent": percent,
      };
}
