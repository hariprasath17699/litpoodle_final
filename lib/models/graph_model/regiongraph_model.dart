// To parse this JSON data, do
//
//     final region1 = region1FromJson(jsonString);

import 'dart:convert';

List<Region1> region1FromJson(String str) =>
    List<Region1>.from(json.decode(str).map((x) => Region1.fromJson(x)));

String region1ToJson(List<Region1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region1 {
  Region1({
    this.label,
    this.value,
  });

  String label;
  double value;

  factory Region1.fromJson(Map<String, dynamic> json) => Region1(
        label: json["label"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
//////////////////////////
// To parse this JSON data, do
//
//     final region2 = region2FromJson(jsonString);

List<Region2> region2FromJson(String str) =>
    List<Region2>.from(json.decode(str).map((x) => Region2.fromJson(x)));

String region2ToJson(List<Region2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region2 {
  Region2({
    this.label,
    this.value,
  });

  String label;
  double value;

  factory Region2.fromJson(Map<String, dynamic> json) => Region2(
        label: json["label"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
////////////////////////////////
// To parse this JSON data, do
//
//     final region3 = region3FromJson(jsonString);

List<Region3> region3FromJson(String str) =>
    List<Region3>.from(json.decode(str).map((x) => Region3.fromJson(x)));

String region3ToJson(List<Region3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region3 {
  Region3({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory Region3.fromJson(Map<String, dynamic> json) => Region3(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
///////////////////////////////////////////////////
// To parse this JSON data, do
//
//     final region4 = region4FromJson(jsonString);



List<Region4> region4FromJson(String str) => List<Region4>.from(json.decode(str).map((x) => Region4.fromJson(x)));

String region4ToJson(List<Region4> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region4 {
    Region4({
        this.label,
        this.value,
    });

    String label;
    String value;

    factory Region4.fromJson(Map<String, dynamic> json) => Region4(
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}
