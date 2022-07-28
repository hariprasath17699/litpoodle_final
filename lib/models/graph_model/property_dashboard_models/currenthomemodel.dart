// To parse this JSON data, do
//
//     final currenthomevaluemodel = currenthomevaluemodelFromJson(jsonString);

import 'dart:convert';

List<Currenthomevaluemodel> currenthomevaluemodelFromJson(String str) =>
    List<Currenthomevaluemodel>.from(
        json.decode(str).map((x) => Currenthomevaluemodel.fromJson(x)));

String currenthomevaluemodelToJson(List<Currenthomevaluemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Currenthomevaluemodel {
  Currenthomevaluemodel({
    this.year,
    this.value,
  });

  String year;
  dynamic value;

  factory Currenthomevaluemodel.fromJson(Map<String, dynamic> json) =>
      Currenthomevaluemodel(
        year: json["year"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "value": value,
      };
}
