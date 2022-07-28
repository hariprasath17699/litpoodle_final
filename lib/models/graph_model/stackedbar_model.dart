// To parse this JSON data, do
//
//     final stackedbarmodel = stackedbarmodelFromJson(jsonString);

import 'dart:convert';

List<Stackedbarmodel> stackedbarmodelFromJson(String str) =>
    List<Stackedbarmodel>.from(
        json.decode(str).map((x) => Stackedbarmodel.fromJson(x)));

String stackedbarmodelToJson(List<Stackedbarmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stackedbarmodel {
  Stackedbarmodel({
    this.label,
    this.value,
  });

  int label;
  int value;

  factory Stackedbarmodel.fromJson(Map<String, dynamic> json) =>
      Stackedbarmodel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
