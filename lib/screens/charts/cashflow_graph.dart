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

class CashFlowBargraph extends StatelessWidget {
  const CashFlowBargraph({Key key}) : super(key: key);

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
      ClicksPerYear('1', 1242558, Colors.orange),
      ClicksPerYear('2', 4280940, Colors.orange),
      ClicksPerYear('3', 2942064, Colors.orange),
      ClicksPerYear('4', 1245862, Colors.orange),
      ClicksPerYear('5', 3250140, Colors.orange),
      ClicksPerYear('6', 1201354, Colors.orange),
      ClicksPerYear('7', 4064892, Colors.orange),
      ClicksPerYear('8', 2831257, Colors.orange),
      ClicksPerYear('9', 2942064, Colors.orange),
      ClicksPerYear('10', 1242558, Colors.orange),
      ClicksPerYear('11', 1874562, Colors.orange),
      ClicksPerYear('12', 2942064, Colors.orange),
      ClicksPerYear('13', 1242558, Colors.orange),
      ClicksPerYear('14', 2201565, Colors.orange),
      ClicksPerYear('15', 2942064, Colors.orange),
      ClicksPerYear('16', 1242558, Colors.orange),
      ClicksPerYear('17', 1548955, Colors.orange),
      ClicksPerYear('18', 2942064, Colors.orange),
      ClicksPerYear('19', 1242558, Colors.orange),
      ClicksPerYear('20', 3245254, Colors.orange),
      ClicksPerYear('21', 2942064, Colors.orange),
      ClicksPerYear('22', 1242558, Colors.orange),
      ClicksPerYear('23', 2868745, Colors.orange),
      ClicksPerYear('24', 2942064, Colors.orange),
      ClicksPerYear('25', 1242558, Colors.orange),
      ClicksPerYear('26', 1457820, Colors.orange),
      ClicksPerYear('27', 2942064, Colors.orange),
      ClicksPerYear('28', 1242558, Colors.orange),
      ClicksPerYear('29', 3614122, Colors.orange),
      ClicksPerYear('30', 1205563, Colors.orange),
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 250.0,
          width: 600,
          child: chart,
        ),
      ),
    );

    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        chartWidget
      ],
    );
  }
}
