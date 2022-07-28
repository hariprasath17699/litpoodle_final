import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class Bargraph extends StatelessWidget {
  const Bargraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      // FutureBuilder(
      //           future: propertycall(),
      //           // ignore: missing_return
      //           builder: (BuildContext context, AsyncSnapshot snapshot) {
      //             if (snapshot.hasData) {
      //               return ListView.builder(
      //                   // physics: BouncingScrollPhysics(),
      //                   //  shrinkWrap: true,
      //                   itemCount: snapshot
      //                       .data["property-details"]["general"]
      //                           ["default-image"]
      //                       .length,
      //                   // scrollDirection: Axis.horizontal,
      //                   itemBuilder: (BuildContext ctx, index) {
      //                     return ClipRRect(
      ClicksPerYear('US Bonds', 1242558, Colors.orange),
      ClicksPerYear('S&P 500', 4280940, Colors.orange),
      ClicksPerYear('The Home', 2942064, Colors.orange),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        height: 200.0,
        width: 350,
        child: chart,
      ),
    );

    return Column(
      children: [chartWidget],
    );
  }
}
