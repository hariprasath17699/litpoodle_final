// To parse this JSON data, do
//
//     final cashflowDoughnutchart = cashflowDoughnutchartFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<CashflowDoughnutchart> cashflowDoughnutchartFromJson(String str) =>
    List<CashflowDoughnutchart>.from(
        json.decode(str).map((x) => CashflowDoughnutchart.fromJson(x)));

String cashflowDoughnutchartToJson(List<CashflowDoughnutchart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CashflowDoughnutchart {
  CashflowDoughnutchart({
    this.name,
    this.value,
    this.percent,
    this.color,
  });

  String name;
  int value;
  dynamic percent;
  Color color;

  factory CashflowDoughnutchart.fromJson(Map<String, dynamic> json) =>
      CashflowDoughnutchart(
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
