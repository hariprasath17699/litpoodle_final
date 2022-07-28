import 'dart:convert';
import 'dart:math';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'package:flutter/material.dart';

import 'package:charts_flutter/src/text_element.dart' as charts_text;
import 'package:litpoodle/blogfc/generated/i18n.dart';
import 'package:litpoodle/components/colors.dart';

List<Graphmodel> graphmodelFromJson(String str) =>
    List<Graphmodel>.from(json.decode(str).map((x) => Graphmodel.fromJson(x)));

String graphmodelToJson(List<Graphmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Graphmodel {
  Graphmodel({
    this.name,
    this.value,
  });

  String name;
  int value;

  factory Graphmodel.fromJson(Map<String, dynamic> json) => Graphmodel(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  static String value;
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color =
        Color.fromHex(code: Color(a: 255, r: 249, g: 168, b: 38).hexString);
    textStyle.fontSize = 15;
    //  '${oCcy.format(int.parse(snapshot.data["property-details"]["general"]["price"]))}',
    canvas.drawText(charts_text.TextElement("\$$value", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
    // canvas.drawText(
    //     charts_text.TextElement(oCcy.format(int.parse("\$$value")),
    //         style: textStyle),
    //     (bounds.left).round(),
    //     (bounds.top - 28).round());
  }
}

class Region1SymbolRenderer extends CircleSymbolRenderer {
  static String value;
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color =
        Color.fromHex(code: Color(a: 255, r: 249, g: 168, b: 38).hexString);
    textStyle.fontSize = 15;
    canvas.drawText(charts_text.TextElement("$value%", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
  }
}

class Region2CircleSymbolRenderer extends CircleSymbolRenderer {
  static String value;
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color =
        Color.fromHex(code: Color(a: 255, r: 249, g: 168, b: 38).hexString);
    textStyle.fontSize = 15;
    canvas.drawText(charts_text.TextElement("$value%", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
  }
}

class Region3SymbolRenderer extends CircleSymbolRenderer {
  static String value;
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color =
        Color.fromHex(code: Color(a: 255, r: 249, g: 168, b: 38).hexString);
    textStyle.fontSize = 15;
    canvas.drawText(charts_text.TextElement("$value%", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
  }
}

class Region4SymbolRenderer extends CircleSymbolRenderer {
  static String value;
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color =
        Color.fromHex(code: Color(a: 255, r: 249, g: 168, b: 38).hexString);
    textStyle.fontSize = 15;
    canvas.drawText(charts_text.TextElement("$value%", style: textStyle),
        (bounds.left).round(), (bounds.top - 28).round());
  }
}


// class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
//   static String value;

//   void design(ChartCanvas canvas, Rectangle<num> bounds,
//       {List<int> dashPattern,
//       Color fillColor,
//       Color strokeColor,
//       double strokeWidthPx}) {
//     super.paint(canvas, bounds,
//         dashPattern: dashPattern,
//         fillColor: fillColor,
//         strokeColor: strokeColor,
//         strokeWidthPx: strokeWidthPx);
//     canvas.drawRect(
//         Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
//             bounds.height + 10),
//         fill: Color.white);
//     var textStyle = style.TextStyle();
//     textStyle.color = Color.black;
//     textStyle.fontSize = 15;
//     //canvas.drawText(TextElement("$value", style: textStyle),
//     //(bounds.left).round(), (bounds.top - 28).round());
//   }
// }
