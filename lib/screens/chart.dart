// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:litpoodle/components/colors.dart';

// class _BarChart extends StatelessWidget {
//   const _BarChart({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         barTouchData: barTouchData,
//         titlesData: titlesData,
//         borderData: borderData,
//         barGroups: barGroups,
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 20,
//       ),
//     );
//   }

//   BarTouchData get barTouchData => BarTouchData(
//         enabled: false,
//         touchTooltipData: BarTouchTooltipData(
//           tooltipBgColor: Colors.transparent,
//           tooltipPadding: const EdgeInsets.all(0),
//           tooltipMargin: 8,
//           getTooltipItem: (
//             BarChartGroupData group,
//             int groupIndex,
//             BarChartRodData rod,
//             int rodIndex,
//           ) {
//             return BarTooltipItem(
//               rod.toY.round().toString(),
//               const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             );
//           },
//         ),
//       );

//   FlTitlesData get titlesData => FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (context, value) => const TextStyle(
//             color: Color(0xff7589a2),
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//           margin: 20,
//           getTitles: (double value) {
//             switch (value.toInt()) {
//               case 0:
//                 return 'Us Bonds';
//               case 1:
//                 return 'S&P 500';
//               case 2:
//                 return 'The Home';

//               default:
//                 return '';
//             }
//           },
//         ),
//         leftTitles: SideTitles(showTitles: true),
//         topTitles: SideTitles(showTitles: false),
//         rightTitles: SideTitles(showTitles: false),
//       );

//   FlBorderData get borderData => FlBorderData(
//         show: false,
//       );

//   List<BarChartGroupData> get barGroups => [
//         BarChartGroupData(
//           x: 0,
//           barRods: [
//             BarChartRodData(
//                 toY: 8, colors: [secondarycolor, Colors.greenAccent])
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 1,
//           barRods: [
//             BarChartRodData(
//                 toY: 10, colors: [secondarycolor, Colors.greenAccent])
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 2,
//           barRods: [
//             BarChartRodData(
//                 toY: 14, colors: [secondarycolor, Colors.greenAccent])
//           ],
//           showingTooltipIndicators: [0],
//         ),
//       ];
// }

// class BarChartSample3 extends StatefulWidget {
//   const BarChartSample3({Key key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => BarChartSample3State();
// }

// class BarChartSample3State extends State<BarChartSample3> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.7,
//       child: Card(
//         elevation: 0,
//         //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         color: white,
//         child: const _BarChart(),
//       ),
//     );
//   }
// }
///////////////////////////////////
//////////////////////////////////////////////////////////

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';

class PopulationData {
  String year;
  int population;
  charts.Color barColor;
  PopulationData(
      {@required this.year,
      @required this.population,
      @required this.barColor});
}

final List<PopulationData> data = [
  PopulationData(
      year: "Us Bonds",
      population: 210000,
      barColor: charts.ColorUtil.fromDartColor(secondarycolor)),
  PopulationData(
      year: "S&P 500",
      population: 330000,
      barColor: charts.ColorUtil.fromDartColor(secondarycolor)),
  PopulationData(
      year: "The Home",
      population: 321000,
      barColor: charts.ColorUtil.fromDartColor(secondarycolor)),
  // PopulationData(
  //     year: 1910,
  //     population: 92228496,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)),
  // PopulationData(
  //     year: 1920,
  //     population: 106021537,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // PopulationData(
  //     year: 1930,
  //     population: 123202624,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // PopulationData(
  //     year: 1940,
  //     population: 132164569,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // PopulationData(
  //     year: 1950,
  //     population: 151325798,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // PopulationData(
  //     year: 1960,
  //     population: 179323175,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // PopulationData(
  //     year: 1970,
  //     population: 203302031,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  // PopulationData(
  //     year: 1980,
  //     population: 226542199,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  // PopulationData(
  //     year: 1990,
  //     population: 248709873,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  // PopulationData(
  //     year: 2000,
  //     population: 281421906,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  // PopulationData(
  //     year: 2010,
  //     population: 307745538,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.black)),
  // PopulationData(
  //     year: 2017,
  //     population: 323148586,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.black)),
];

class Chart1 extends StatelessWidget {
  const Chart1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // Text(
              //   "Population of U.S. over the years",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: charts.BarChart(
                  _getSeriesData(),
                  animate: true,
                  domainAxis: charts.OrdinalAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 60)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_getSeriesData() {
  List<charts.Series<PopulationData, String>> series = [
    charts.Series(
        id: "Population",
        data: data,
        domainFn: (PopulationData series, _) => series.year.toString(),
        measureFn: (PopulationData series, _) => series.population,
        colorFn: (PopulationData series, _) => series.barColor)
  ];
  return series;
}
