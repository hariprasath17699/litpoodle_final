// To parse this JSON data, do
//
//     final cashreturnModel = cashreturnModelFromJson(jsonString);

import 'dart:convert';

List<CashreturnModel> cashreturnModelFromJson(String str) =>
    List<CashreturnModel>.from(
        json.decode(str).map((x) => CashreturnModel.fromJson(x)));

String cashreturnModelToJson(List<CashreturnModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CashreturnModel {
  CashreturnModel({
    this.label,
    this.value,
  });

  String label;
  double value;

  factory CashreturnModel.fromJson(Map<String, dynamic> json) =>
      CashreturnModel(
        label: json["label"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
