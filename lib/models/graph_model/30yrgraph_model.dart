// To parse this JSON data, do
//
//     final the30Yearsgraphmodel = the30YearsgraphmodelFromJson(jsonString);

import 'dart:convert';

List<The30Yearsgraphmodel> the30YearsgraphmodelFromJson(String str) =>
    List<The30Yearsgraphmodel>.from(
        json.decode(str).map((x) => The30Yearsgraphmodel.fromJson(x)));

String the30YearsgraphmodelToJson(List<The30Yearsgraphmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class The30Yearsgraphmodel {
  The30Yearsgraphmodel({
    this.label,
    this.value,
  });

  int label;
  int value;

  factory The30Yearsgraphmodel.fromJson(Map<String, dynamic> json) =>
      The30Yearsgraphmodel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
