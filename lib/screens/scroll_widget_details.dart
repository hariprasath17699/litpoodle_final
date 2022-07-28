import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:flutter_html/style.dart';
import 'package:http/http.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/models/graph_model/30yrgraph_model.dart';
import 'package:litpoodle/models/graph_model/cashflowdoughnut.dart';
import 'package:litpoodle/models/graph_model/cashreturngraph_model.dart';
import 'package:litpoodle/models/graph_model/cross_hair_model.dart';
import 'package:litpoodle/models/graph_model/regiongraph_model.dart';
import 'package:litpoodle/models/graph_model/stackedbar_model.dart';

import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/screens/scroll_widget.dart';
import 'package:litpoodle/screens/singlepage_filters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:readmore/readmore.dart';

import '../models/graph_model/poodle graph.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class SingleFilterPropId {
  SingleFilterPropId({
    this.propid,
    this.value1,
  });
  String propid;
  String value1;
}

class SinglePostProperty extends StatefulWidget {
  final bool showAppBar;
  Property value;
  SinglePostProperty({
    this.showAppBar = true,
    this.value,
  });

  @override
  _SinglePostPropertyState createState() => _SinglePostPropertyState();
}

class _SinglePostPropertyState extends State<SinglePostProperty> {
  bool isLoading = true;
  List<GDPData> _chartData;
  TooltipBehavior _tooltipBehavior;

  double mortgage;
  double _value1 = 4.0;
  ////graph data/////
  List<CashreturnModel> cashreturn = [];
  List<CashflowDoughnutchart> cashflowmnthestim = [];
  List<The30Yearsgraphmodel> graph = [];
  List<Graphmodel> genders = [];
  List<Region1> region = [];
  List<Region2> population = [];
  List<Region3> unemployment = [];
  List<Region4> rental = [];
  List<Crosshairmodel> crosshairgraph = [];
  List<Stackedbarmodel> stackbarlayer1 = [];
  List<Stackedbarmodel> stackbarlayer2 = [];
  List<Stackedbarmodel> stackbarlayer3 = [];
  List<Stackedbarmodel> stackbarlayer4 = [];
  List<Stackedbarmodel> stackbarlayer5 = [];
  bool loading = true;
  TrackballBehavior _trackballBehavior;
  // NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    data = propertycall();
    _chartData = getChartData();
    //getData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: true,
      format: 'point.x: \$point.y',
    );

    // _trackballBehavior = TrackballBehavior(
    //     // Enables the trackball
    //     enable: true,
    //     tooltipSettings: InteractiveTooltip(enable: true, color: Colors.red));
    _trackballBehavior = TrackballBehavior(
      enable: true,
      lineWidth: 1,
      lineType: TrackballLineType.horizontal,
      activationMode: ActivationMode.singleTap,
      tooltipAlignment: ChartAlignment.near,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      shouldAlwaysShow: true,

      tooltipSettings: InteractiveTooltip(
          enable: true,
          format: '\$point.y',
          // color: secondarycolor,
          // connectorLineColor: secondarycolor,
          // borderColor: secondarycolor,
          canShowMarker: true),
      // Display mode of trackball tooltip
      // tooltipDisplayMode: TrackballDisplayMode.groupAllPoints
    );
    super.initState();

    /// load posts
    //  _loadData();
  }

  // void getData() async {
  //   String propid = widget.value.propid;
  // print(propid);

  // var response = await _networkHelper.post(
  //     "https://clientdev.tagwebs.in/litpoodle/api/home/property_details/$propid/");

  // final tempdata = json.decode(response.body)['result']["poodle-o-meter"]
  //     ["investment_performance"]["investment-growth"]["graph-data"];

  // final data = tempdata
  //     .map<Graphmodel>((e) => Graphmodel(name: e['name'], value: e['value']))
  //     .toList();

  // print(tempdata);
  // print(data);
  // setState(() {
  //   genders = data;

  //   loading = false;
  // });
  //}
  // List<charts.Series<CashflowDoughnutchart, String>>
  //     cashflowestimatedmonthlyexpense() {
  //   return [
  //     charts.Series<CashflowDoughnutchart, String>(
  //       data: cashflowmnthestim,
  //       id: 'cashflowmnthestim',
  //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
  //       domainFn: (CashflowDoughnutchart cashflowDoughnutchart, _) =>
  //           cashflowDoughnutchart.name,
  //       measureFn: (CashflowDoughnutchart cashflowDoughnutchart, _) =>
  //           double.parse(cashflowDoughnutchart.percent.toString()),
  //     )
  //   ];
  // }

  List<charts.Series<CashreturnModel, String>> cashreturngraph() {
    return [
      charts.Series<CashreturnModel, String>(
          data: cashreturn,
          id: 'cashreturn',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
          domainFn: (CashreturnModel cashreturnModel, _) =>
              cashreturnModel.label.toString(),
          measureFn: (CashreturnModel cashreturnModel, _) =>
              double.parse(cashreturnModel.value.toString())),
      // double.parse(cashreturnModel.value.toString()),
    ];
  }

  List<charts.Series<Graphmodel, String>> poodlegraph1() {
    return [
      charts.Series<Graphmodel, String>(
        data: genders,
        id: 'sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (Graphmodel graphmodel, _) => graphmodel.name.toString(),
        measureFn: (Graphmodel graphmodel, _) => graphmodel.value,
      )
    ];
  }

  List<charts.Series<The30Yearsgraphmodel, String>> yr30graph() {
    return [
      charts.Series<The30Yearsgraphmodel, String>(
        data: graph,
        id: 'graph',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (
          The30Yearsgraphmodel the30yearsgraphmodel,
          _,
        ) =>
            the30yearsgraphmodel.label.toString(),
        measureFn: (The30Yearsgraphmodel the30yearsgraphmodel, _) =>
            the30yearsgraphmodel.value,

        //  labelAccessorFn: (The30Yearsgraphmodel the30yearsgraphmodel,_)=>
      )
    ];
  }

  List<charts.Series<Region1, String>> region1() {
    return [
      charts.Series<Region1, String>(
        data: region,
        id: 'region1',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (Region1 region1, _) => region1.label.toString(),
        measureFn: (Region1 region1, _) => region1.value,
      )
    ];
  }

  List<charts.Series<Region2, String>> region2() {
    return [
      charts.Series<Region2, String>(
        data: population,
        id: 'population',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (Region2 region2, _) => region2.label.toString(),
        measureFn: (Region2 region2, _) => region2.value,
      )
    ];
  }

  List<charts.Series<Region3, String>> region3() {
    return [
      charts.Series<Region3, String>(
        data: unemployment,
        id: 'unemployment',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (Region3 region3, _) => region3.label.toString(),
        measureFn: (Region3 region3, _) => double.parse(region3.value),
      )
    ];
  }

  List<charts.Series<Region4, String>> region4() {
    return [
      charts.Series<Region4, String>(
        data: rental,
        id: 'region1',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(secondarycolor),
        domainFn: (Region4 region4, _) => region4.label.toString(),
        measureFn: (Region4 region4, _) => double.parse(region4.value),
      )
    ];
  }

  List<charts.Series<Stackedbarmodel, String>> cashflowstackbar() {
    return [
      charts.Series<Stackedbarmodel, String>(
        data: stackbarlayer5,
        id: 'stackbarlayer5',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff005faa)),
        domainFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.label.toString(),
        measureFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.value,
      ),
      charts.Series<Stackedbarmodel, String>(
        data: stackbarlayer4,
        id: 'stackbarlayer4',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff333b81)),
        domainFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.label.toString(),
        measureFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.value,
      ),
      charts.Series<Stackedbarmodel, String>(
        data: stackbarlayer3,
        id: 'stackbarlayer3',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff83c273)),
        domainFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.label.toString(),
        measureFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.value,
      ),
      charts.Series<Stackedbarmodel, String>(
        data: stackbarlayer2,
        id: 'stackbarlayer2',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff02a88f)),
        domainFn: (Stackedbarmodel stackedbarmodel, _) =>
            int.parse(stackedbarmodel.label.toString()).toString(),
        measureFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.value,
      ),
      charts.Series<Stackedbarmodel, String>(
        data: stackbarlayer1,
        id: 'stackbarlayer1',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff0387ad)),
        domainFn: (Stackedbarmodel stackedbarmodel, _) =>
            int.parse(stackedbarmodel.label.toString()).toString(),
        measureFn: (Stackedbarmodel stackedbarmodel, _) =>
            stackedbarmodel.value,
      ),
    ];
  }

  final formatCurrency =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD');
  TextEditingController usbond = TextEditingController();
  TextEditingController sp500 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<Map<String, dynamic>> data;
  final List<String> imgList = [];
  int activeIndex = 0;
  int touchedIndex = -1;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final ScrollController _scrollcontroller1 = ScrollController();
  final ScrollController _scrollcontroller2 = ScrollController();
  Widget _PopupDialogPropertyTax(BuildContext context) {
    return new AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      //backgroundColor: Colors.transparent,
      //backgroundColor: Colors.black.withOpacity(0.15),
      //elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: FutureBuilder(
          future: propertycall(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      child: DefaultTabController(
                        length: 3, // length of tabs
                        initialIndex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.w700),
                                indicatorColor: secondarycolor,
                                isScrollable: true,
                                labelColor: secondarycolor,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(
                                    text: 'Property Tax Details',
                                  ),
                                  Tab(text: 'Property History Details'),
                                  Tab(text: 'Other Info'),
                                ],
                              ),
                            ),
                            Container(
                                height: 700, //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Spacer(),
                                                // SizedBox(
                                                //   width: 80,
                                                // ),
                                                Text(
                                                  "Tax",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  "Year",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                            //height: 10,
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                // shrinkWrap: true,
                                                itemCount: snapshot
                                                    .data["property-details"]
                                                        ["property-tax-details"]
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text("\$"),
                                                                Text(
                                                                  snapshot.data[
                                                                          "property-details"]
                                                                          [
                                                                          "property-tax-details"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "total"]
                                                                      .toString()
                                                                      .replaceAll(
                                                                          ' ',
                                                                          ''),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            // SizedBox(
                                                            //   width: 60,
                                                            // ),
                                                            Row(
                                                              children: [
                                                                Text("\$"),
                                                                Text(
                                                                  snapshot.data[
                                                                          "property-details"]
                                                                          [
                                                                          "property-tax-details"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "tax"]
                                                                      .toString()
                                                                      .replaceAll(
                                                                          ' ',
                                                                          ''),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 60,
                                                            ),
                                                            Text(
                                                              snapshot.data[
                                                                      "property-details"]
                                                                      [
                                                                      "property-tax-details"]
                                                                      [index]
                                                                      ["year"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                      )
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Event Name	",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text(
                                                  "Price",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  width: 60,
                                                ),
                                                Text(
                                                  "Date",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                            //height: 10,
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                // shrinkWrap: true,
                                                itemCount: snapshot
                                                    .data["property-details"][
                                                        "property-history-details"]
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text("\$"),
                                                                Text(
                                                                  snapshot.data[
                                                                          "property-details"]
                                                                          [
                                                                          "property-history-details"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "event-name"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            // SizedBox(
                                                            //   width: 60,
                                                            // ),
                                                            Row(
                                                              children: [
                                                                Text("\$"),
                                                                Text(
                                                                  snapshot.data[
                                                                          "property-details"]
                                                                          [
                                                                          "property-history-details"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "price"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text(
                                                              snapshot.data[
                                                                      "property-details"]
                                                                      [
                                                                      "property-history-details"]
                                                                      [index][
                                                                      "property-date"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                      )
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: snapshot
                                              .data["property-details"]
                                                  ["other-info"]["description"]
                                              .length,
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      // (home: token != '' ? BottomNavScreen() : MyApp()));
                                                      snapshot.data["property-details"]
                                                                      [
                                                                      "other-info"]
                                                                  [
                                                                  "description"] ==
                                                              ""
                                                          ? ''
                                                          : Text(
                                                              snapshot.data[
                                                                      "property-details"]
                                                                      [
                                                                      "other-info"]
                                                                      [
                                                                      "description"]
                                                                      [index]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 1,
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              const Center(
                child: Text("Some Thing Went Wrong"),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: secondarycolor,
            ));
          }),

      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close',
              style: TextStyle(
                  color: secondarycolor, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      backgroundColor: Colors.transparent,
      //backgroundColor: Colors.black.withOpacity(0.15),
      //elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
              future: propertycall(),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 300,
                    width: 400,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        itemCount:
                            snapshot.data["property-details"]["gallery"].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                snapshot.data["property-details"]["gallery"]
                                        [index]["photo"]
                                    .toString(),
                                fit: BoxFit.contain,
                                height: 200,
                                width: 250,
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  const Center(
                    child: Text("Some Thing Went Wrong"),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: secondarycolor,
                ));
              })
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close',
              style: TextStyle(
                  color: secondarycolor, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

////////////////////////////////////////////////////////
///////////////////////  filter popup//////////////////////
  List listResponse;
  String _value;
  StatefulBuilder(BuildContext context) {
    /// Widget _filtersinglepagepopup(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 10.0,
        //vertical: 100.0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: (() {
                    Navigator.of(context).pop();
                  }),
                  child: Icon(Icons.close)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Filters',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      content: FutureBuilder(
          future: data,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: new Column(
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 500,
                      // height: 500,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Mortgage Interest rate (%)',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SfSlider(
                                shouldAlwaysShowTooltip: true,

                                activeColor: secondarycolor,

                                min: snapshot.data["set-parameters"]
                                    ["mortgage_interest_rate"]["min_value"],
                                max: snapshot.data["set-parameters"]
                                    ["mortgage_interest_rate"]["max_value"],
                                value: snapshot.data["set-parameters"]
                                    ["mortgage_interest_rate"]["default_value"],
                                interval: snapshot.data["set-parameters"]
                                    ["mortgage_interest_rate"]["steps_value"],
                                showTicks: false,
                                showLabels: false,
                                enableTooltip: true,
                                numberFormat: NumberFormat(),
                                // minorTicksPerInterval: 1,
                                onChanged: (new_value) {
                                  setState(() {
                                    mortgage = new_value;
                                  });
                                },
                              ),
                            ],
                          ),
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Container(
//                               //  height: 55,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 3),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.grey[300],
//                                     width: 1.0,
//                                   ),
//                                   color: Colors.redAccent,
//                                   borderRadius: BorderRadius.circular(10)),

//                               child: DropdownButton<String>(
//                                 // onTap: () => _dropdownlist(),

//                                 isExpanded: true,
//                                 menuMaxHeight: 300,
//                                 style: TextStyle(fontSize: 18),
//                                 iconEnabledColor: Colors.white,
//                                 underline: SizedBox(),
//                                 hint: Text(
//                                   "select",
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.white),
//                                 ),
//                                 //alignment: Alignment.center,
//                                 elevation: 0,
//                                 //itemHeight: null,
//                                 dropdownColor: secondarybgcolor,
//                                 borderRadius: BorderRadius.circular(20),
//                                 // value: _value,
//                                 // items: [],
//                                 items: listResponse?.map((item) {
//                                       return new DropdownMenuItem(
//                                         child: Text(item(
//                                                 snapshot.data["set-parameters"]
//                                                     ["term_year"]["term"])
//                                             .toString()),
//                                         value: item(
//                                                 snapshot.data["set-parameters"]
//                                                     ["term_year"]["term"])
//                                             .toString(),
//                                         //child: new Text(item['slug']),
//                                         // value: item['slug'].toString(),
//                                       );
//                                     })?.toList() ??
//                                     [],
//                                 onChanged: (newvalue) {
//                                   setState(() {
//                                     _value = newvalue;
// //
//                                     // _eventdetails();

//                                     ///print(_dropdownlist().toString());
//                                   });
//                                 },
//                                 value: _value,
//                                 // onTap: _eventdetails,
//                               ),
//                             ),
//                           ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Project (\$)',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SfSlider(
                                shouldAlwaysShowTooltip: true,
                                activeColor: secondarycolor,
                                min: double.parse(
                                        '${snapshot.data["set-parameters"]["total_project"]["min_value"]}')
                                    .toDouble(),
                                max: double.parse(
                                        '${snapshot.data["set-parameters"]["total_project"]["max_value"]}')
                                    .toDouble(),
                                value: double.parse(
                                        '${snapshot.data["set-parameters"]["total_project"]["default_value"]}')
                                    .toDouble(),
                                interval: double.parse(
                                        '${snapshot.data["set-parameters"]["total_project"]["steps_value"]}')
                                    .toDouble(),
                                showTicks: false,
                                showLabels: false,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    mortgage = value;
                                    // Navigator.of(context).pop();
                                    // _filtersinglepagepopup(context);
                                  });
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Downpayment (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["downpayment"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["downpayment"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["downpayment"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["downpayment"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Closing cost (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual average price increase (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_price_increase"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_price_increase"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_price_increase"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["annual_average_price_increase"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Average rent increase (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_rent_increase"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_rent_increase"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_average_rent_increase"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["annual_average_rent_increase"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Vacancy rate (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_vacancy_rate"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_vacancy_rate"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_vacancy_rate"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["annual_vacancy_rate"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Insurance (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_insurance"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_insurance"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_insurance"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["annual_insurance"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Maintenance (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Annual Property Tax (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_property_tax"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_property_tax"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["annual_property_tax"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["annual_property_tax"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Estimated Monthly rent (\$)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["estimated_monthly_rent"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["estimated_monthly_rent"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["estimated_monthly_rent"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["estimated_monthly_rent"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PM Commission (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 300,
                                      child: TextFormField(
                                        //focusNode: fieldFocusNode,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        //controller: usbond,
                                        // (home: token != '' ? BottomNavScreen() : MyApp()));
                                        controller: TextEditingController
                                            .fromValue(TextEditingValue(
                                                    text: snapshot.data[
                                                            "set-parameters"][
                                                        "us_bonds"]["label"]) ??
                                                usbond),

                                        // controller: TextEditingController.fromValue(
                                        //   TextEditingValue(text: searchtext.text),
                                        // ),
                                        // controller: TextEditingController.fromValue(
                                        //   TextEditingValue(text: null ?? searchtext.text),
                                        // ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter city';
                                          }
                                          return null;
                                        },
                                        cursorColor: secondarycolor,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            height: 1.5,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          filled: true,
                                          //fillColor: Colors.white,
                                          // suffixIcon: InkWell(
                                          // onTap: () {
                                          //   // Validate returns true if the form is valid, or false otherwise.
                                          //   if (_formKey.currentState
                                          //       .validate()) {
                                          //     ///////////////
                                          //     Navigator.of(context).push(
                                          //       MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Searchpage(
                                          //           value:
                                          //               // Search(search: searchtext.text),
                                          //               Search(
                                          //             search: searchtext
                                          //                 .text
                                          //                 .replaceAll(
                                          //                     ',', '/')
                                          //                 .replaceAll(
                                          //                     " ", "%20"),
                                          //             searchcity:
                                          //                 searchtext.text,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     );
                                          //   }
                                          // },
                                          // ),
                                          // hintText:'New Albany',
                                          // hintText:
                                          //     '  City, State or Zipcode',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          errorStyle:
                                              const TextStyle(fontSize: 0.1),
                                          // errorBorder: OutlineInputBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     borderSide: BorderSide(
                                          //       color: Colors.red,
                                          //       width: 1,
                                          //       style: BorderStyle.solid,
                                          //     )),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[300]),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: shadowColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )
                                      // return TextField(
                                      //   controller: fieldTextEditingController,
                                      //   focusNode: fieldFocusNode,
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // );

                                      )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Growth rate (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 300,
                                      child: TextFormField(
                                        //focusNode: fieldFocusNode,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        //controller: usbond,
                                        // (home: token != '' ? BottomNavScreen() : MyApp()));
                                        controller: TextEditingController
                                            .fromValue(TextEditingValue(
                                                    text: snapshot.data[
                                                            "set-parameters"]
                                                        ["S_P_500"]["label"]) ??
                                                sp500),

                                        // controller: TextEditingController.fromValue(
                                        //   TextEditingValue(text: searchtext.text),
                                        // ),
                                        // controller: TextEditingController.fromValue(
                                        //   TextEditingValue(text: null ?? searchtext.text),
                                        // ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter city';
                                          }
                                          return null;
                                        },
                                        cursorColor: secondarycolor,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            height: 1.5,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          filled: true,
                                          //fillColor: Colors.white,
                                          // suffixIcon: InkWell(
                                          // onTap: () {
                                          //   // Validate returns true if the form is valid, or false otherwise.
                                          //   if (_formKey.currentState
                                          //       .validate()) {
                                          //     ///////////////
                                          //     Navigator.of(context).push(
                                          //       MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Searchpage(
                                          //           value:
                                          //               // Search(search: searchtext.text),
                                          //               Search(
                                          //             search: searchtext
                                          //                 .text
                                          //                 .replaceAll(
                                          //                     ',', '/')
                                          //                 .replaceAll(
                                          //                     " ", "%20"),
                                          //             searchcity:
                                          //                 searchtext.text,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     );
                                          //   }
                                          // },
                                          // ),
                                          // hintText:'New Albany',
                                          // hintText:
                                          //     '  City, State or Zipcode',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          errorStyle:
                                              const TextStyle(fontSize: 0.1),
                                          // errorBorder: OutlineInputBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     borderSide: BorderSide(
                                          //       color: Colors.red,
                                          //       width: 1,
                                          //       style: BorderStyle.solid,
                                          //     )),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[300]),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: shadowColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )
                                      // return TextField(
                                      //   controller: fieldTextEditingController,
                                      //   focusNode: fieldFocusNode,
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // );

                                      )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Growth rate (%)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SfSlider(
                                    shouldAlwaysShowTooltip: true,
                                    activeColor: secondarycolor,
                                    min: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["min_value"]}')
                                        .toDouble(),
                                    max: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["max_value"]}')
                                        .toDouble(),
                                    value: double.parse(
                                            '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                        .toDouble(),
                                    interval: double.parse(
                                        '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                    showTicks: false,
                                    showLabels: false,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        mortgage = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(child: Text("Reset")),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // propertycall();
                                              Navigator.pop(context, mortgage);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color: shadowColor,
                                                      blurRadius: 5,
                                                    ),
                                                  ],
                                                  color: secondarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                "Apply",
                                                style: TextStyle(color: white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // child: Text("Hello"),
                  ],
                ),
              );
            } else {
              const Center(
                child: Text("Some Thing Went Wrong"),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: secondarycolor,
            ));
          }),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  //////////////////////////
  Future<Map<String, dynamic>> graphcall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://clientdev.tagwebs.in/litpoodle/api/home/property_details/LIT4168597016/'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      print(result["result"]["cash-flow"]["cash-flow"].length);
      print(result["result"]["cash-flow"]["cash-flow"][0]);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(
        'America',
        1600,
      ),
      GDPData('India', 2490),
      GDPData('Africa', 2900),
      GDPData('Asia', 23050),
      GDPData('Pakistan', 24880),
      GDPData('China', 34390),
    ];
    return chartData;
  }

///////////////////////////////////
  Future<Map<String, dynamic>> propertycall() async {
    String propid = widget.value.propid;
    print(propid);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    // var request = http.Request(
    //     'POST', Uri.parse('$domain_url/api/home/property_details/$propid/'));
    var request = http.MultipartRequest(
        'POST', Uri.parse('$domain_url/api/home/property_details/$propid/'));
    request.fields.addAll({
      'mor_int_rate': widget.value.mortageinterest != null
          ? widget.value.mortageinterest.toString()
          : '',
      'term_year': '',
      'tot_project': '',
      'downpayment': widget.value.downpayment != null
          ? widget.value.downpayment.toString()
          : '',
      'clo_cost': widget.value.closingcost != null
          ? widget.value.closingcost.toString()
          : '',
      'ann_ave_price_incr': widget.value.annualavgprice != null
          ? widget.value.annualavgprice.toString()
          : '',
      'ann_ave_rent_incr': widget.value.annualavgrent != null
          ? widget.value.annualavgrent.toString()
          : '',
      'ann_vac_rate': widget.value.vacancyrate != null
          ? widget.value.vacancyrate.toString()
          : '',
      'ann_insur': widget.value.annualinsurance != null
          ? widget.value.annualinsurance.toString()
          : '',
      'ann_main': '',
      'ann_pro_tax': widget.value.annualpropertytax != null
          ? widget.value.annualpropertytax.toString()
          : '',
      'month_hoa': widget.value.monthlyHoa != null
          ? widget.value.monthlyHoa.toString()
          : '',
      'est_mon_rent': widget.value.estimmnthrate != null
          ? widget.value.estimmnthrate.toString()
          : '',
      'pm_com_value': '',
      'usbonds_5_text': widget.value.usbond != null ? widget.value.usbond : '',
      // 'usbonds_5_text': widget.value.fdata1 ?? '',
      'usbonds_5_percent': widget.value.usgrowthrate != null
          ? widget.value.usgrowthrate.toString()
          : '',
      's_p_9_text': widget.value.sp500 != null ? widget.value.sp500 : '',
      's_p_9_percent': widget.value.spgrowthrate != null
          ? widget.value.spgrowthrate.toString()
          : '',
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    ////////////////////////// graph datas/////////////////
    final tempdata = json.decode(response.body)['result']["poodle-o-meter"]
        ["investment_performance"]["investment-growth"]["graph-data"];
    final tempdata30 =
        json.decode(response.body)['result']["cash-flow"]["net-worth-by-year"];
    final cashflowdough30 =
        json.decode(response.body)['result']["cash-flow"]["cash-flow"];
    final cashreturntempdata = json.decode(response.body)['result']
        ["investor-metrics"]["cash-on-cash-return"];
    final region1tempdata = json.decode(response.body)['result']["neighborhood"]
        ["region"]["avg-job-growth-rate"];
    final region2tempdata = json.decode(response.body)['result']["neighborhood"]
        ["region"]["avg-population"];
    final region3tempdata = json.decode(response.body)['result']["neighborhood"]
        ["region"]["unemployment"];
    final region4tempdata = json.decode(response.body)['result']["neighborhood"]
        ["region"]["rental-vacancy"];
    final layer1tempdata = json.decode(response.body)['result']["cash-flow"]
        ["cashflow-breakdown-by-year"]["insurance-property_taxes-maintenance"];
    final layer2tempdata = json.decode(response.body)['result']["cash-flow"]
        ["cashflow-breakdown-by-year"]["property_management-hoa_fees"];
    final layer3tempdata = json.decode(response.body)['result']["cash-flow"]
        ["cashflow-breakdown-by-year"]["interest-portion-of-mortgage"];
    final layer4tempdata = json.decode(response.body)['result']["cash-flow"]
        ["cashflow-breakdown-by-year"]["principal-portion-of-mortgage"];
    final layer5tempdata = json.decode(response.body)['result']["cash-flow"]
        ["cashflow-breakdown-by-year"]["net-cashflow"];
    final crosshairtempdata = json.decode(response.body)['result']
        ["neighborhood"]["housing-market"]["home-price-history"];

    final data = tempdata
        .map<Graphmodel>((e) => Graphmodel(name: e['name'], value: e['value']))
        .toList();
    final data30 = tempdata30
        .map<The30Yearsgraphmodel>(
            (e) => The30Yearsgraphmodel(label: e['label'], value: e['value']))
        .toList();
    final cashflowestimdata = cashflowdough30
        .map<CashflowDoughnutchart>((e) => CashflowDoughnutchart(
            name: e['name'], value: e['value'], percent: e['percent']))
        .toList();
    final region1data30 = region1tempdata
        .map<Region1>((e) => Region1(label: e['label'], value: e['value']))
        .toList();
    final region2data30 = region2tempdata
        .map<Region2>((e) => Region2(label: e['label'], value: e['value']))
        .toList();
    final region3data30 = region3tempdata
        .map<Region3>((e) => Region3(label: e['label'], value: e['value']))
        .toList();
    final region4data30 = region4tempdata
        .map<Region4>((e) => Region4(label: e['label'], value: e['value']))
        .toList();
    final layer1data30 = layer1tempdata
        .map<Stackedbarmodel>(
            (e) => Stackedbarmodel(label: e['label'], value: e['value']))
        .toList();
    final layer2data30 = layer2tempdata
        .map<Stackedbarmodel>(
            (e) => Stackedbarmodel(label: e['label'], value: e['value']))
        .toList();
    final layer3data30 = layer3tempdata
        .map<Stackedbarmodel>(
            (e) => Stackedbarmodel(label: e['label'], value: e['value']))
        .toList();
    final layer4data30 = layer4tempdata
        .map<Stackedbarmodel>(
            (e) => Stackedbarmodel(label: e['label'], value: e['value']))
        .toList();
    final layer5data30 = layer5tempdata
        .map<Stackedbarmodel>(
            (e) => Stackedbarmodel(label: e['label'], value: e['value']))
        .toList();
    final crosshairdata30 = crosshairtempdata
        .map<Crosshairmodel>(
            (e) => Crosshairmodel(year: e['year'], value: e['value']))
        .toList();
    final cashreturndata30 = cashreturntempdata
        .map<CashreturnModel>(
            (e) => CashreturnModel(label: e['label'], value: e['value']))
        .toList();

    print(tempdata);
    print(data);
    print(tempdata30);
    print(data30);
    print(region1tempdata);
    print(region1data30);

    /// setState(() {
    genders = data;
    graph = data30;
    cashflowmnthestim = cashflowestimdata;
    region = region1data30;
    population = region2data30;
    unemployment = region3data30;
    rental = region4data30;
    stackbarlayer1 = layer1data30;
    stackbarlayer2 = layer2data30;
    stackbarlayer3 = layer3data30;
    stackbarlayer4 = layer4data30;
    stackbarlayer5 = layer5data30;
    crosshairgraph = crosshairdata30;
    cashreturn = cashreturndata30;
    loading = false;
    // });

    //////////////////////////////////////////////////
    if (response.statusCode == 200) {
      print("result");
      print(usbond.text);
      //print("propid:$propertyid");
      for (int i = 0;
          i < result["result"]["property-details"]["general"].length;
          i++);
      print(result["result"]["property-details"]["general"]);

      print(result["result"]["property-details"]["gallery"].length);
      print(result["result"]["property-details"]["gallery"][0]);

      for (int i = 0;
          i < result["result"]["property-details"]["gallery"].length;
          i++) {
        imgList
            .add(result["result"]["property-details"]["gallery"][i]["photo"]);
      }
      print(imgList);
      print(
          result["result"]["property-details"]["property-tax-details"].length);
      print(result["result"]["property-details"]["property-tax-details"]);
      for (int i = 0;
          i <
              result["result"]["property-details"]["property-tax-details"]
                  .length;
          i++) {
        // result['data']['property_list'].forEach((key, value) => propertyList.add(value));
        // propertyList.addAll(result["data"]["property_list"][i]);
      }
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  @override
  Widget build(BuildContext context) {
    String propid = widget.value.propid;

    print(propid);
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              height: 100,
              width: 100,
              child: Image.network(
                item,
              ),
            ))
        .toList();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double deviceWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    int divider = 1;

    if (orientation == Orientation.landscape) {
      divider = 2;
    }

    double size = deviceWidth / divider;
///////////////////////////////////////////////////
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      String likepropid = widget.value.propid;
      print(likepropid);

      /// send your request here
      // final bool success= await sendRequest();
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
        'Cookie': 'ci_session=hgdudq36phec2bb55pnkcovgdn21vci5'
      };
      var request = http.Request('GET',
          Uri.parse('$domain_url/api/user/user/insert_wistlist/$likepropid/'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      /// if failed, you can do nothing
      // return success? !isLiked:isLiked;

      return !isLiked;
    }

    //////////////////////////
////////////////////////////////
    Future<bool> NotLikeButtonTapped(bool isnotLiked) async {
      String likepropid = widget.value.propid;
      print(likepropid);

      /// send your request here
      // final bool success= await sendRequest();
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
        'Cookie': 'ci_session=hgdudq36phec2bb55pnkcovgdn21vci5'
      };
      var request = http.Request('GET',
          Uri.parse('$domain_url/api/user/user/insert_wistlist/$likepropid/'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      /// if failed, you can do nothing
      // return success? !isLiked:isLiked;

      return !isnotLiked;
    }

    return Scaffold(
        body: FutureBuilder(
            future: propertycall(),
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(slivers: [
                  SliverAppBar(
                    // leading: IconButton(
                    //   icon: Icon(Icons.arrow_back, color: Colors.white),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //           builder: (context) => BottomNavScreen()),
                    //     );
                    //   },
                    // ),
                    //backgroundColor: const Color(0xFF1B1E28).withOpacity(0.25),
                    backgroundColor: Colors.black.withOpacity(0.15),
                    title: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0.0, top: 10.0, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            LikeButton(
                              onTap: onLikeButtonTapped,
                              likeBuilder: (isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color: isLiked ? Colors.red : Colors.white,
                                  size: 30,
                                );
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            /////////////////////// filter parameters //////////////////////////

                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 5,
                                  ),
                                ],
                                color: bgColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SinglePageFilters(
                                        value: SingleFilterPropId(
                                      propid: propid,
                                      // value1:
                                      //     '${snapshot.data["set-parameters"]["mortgage_interest_rate"]["default_value"]}'
                                    )),
                                  ));

                                  // showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) =>
                                  //         StatefulBuilder(context)
                                  //     // _filtersinglepagepopup(context),
                                  //     );
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.filter_list_rounded,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 10,
                            ),
                            NotificationIcon(),
                          ],
                        )),
                    flexibleSpace: FlexibleSpaceBar(
                      // title:

                      background:
                          // ignore: missing_return

                          // physics: BouncingScrollPhysics(),
                          //  shrinkWrap: true,

                          // scrollDirection: Axis.horizontal,

                          ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                        child: Image.network(
                          snapshot.data["property-details"]["general"]
                              ["default-image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.32,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          _content(context),
                        ],
                      )
                    ]),
                  )
                ]);
              } else {
                const Center(
                  child: Text("Some Thing Went Wrong"),
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: secondarycolor,
              ));
            })

        // body: SingleChildScrollView(
        //     child: Stack(
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           // height: (this.widget.height - offset).clamp(0.0, this.widget.height),
        //           child: Hero(
        //             tag: "image",
        //             //tag: 'news-image-' + this.widget.id.toString(),
        //             // tag: null,
        //             child: FutureBuilder(
        //                 future: propertycall(),
        //                 // ignore: missing_return
        //                 builder: (BuildContext context, AsyncSnapshot snapshot) {
        //                   if (snapshot.hasData) {
        //                     return Image.network(snapshot.data["property-details"]
        //                         ["general"]["default-image"]);
        //                   } else
        //                     return CircularProgressIndicator();
        //                 }),
        //             // child: Image(
        //             //   //image:AssetImage(""),
        //             //   image: AssetImage("assets/images/poodle1.PNG") ??
        //             //       NetworkImage(""),
        //             //   fit: BoxFit.cover,
        //             //   width: MediaQuery.of(context).size.width,
        //             // ),
        //           ),
        //         ),
        //         _content(context),
        //       ],
        //     )
        //   ],
        // )),
        // body: Scroll(
        //   1,
        //   //AssetImage(assetName)
        //   NetworkImage(""),
        //   // AssetImage(""),
        //   size,
        //   [_content(context)],
        //   appBar: AppBar(
        //     backgroundColor: const Color(0xFF1B1E28).withOpacity(0.25),
        //     elevation: 0.0,
        //     iconTheme: IconThemeData(color: Colors.white),

        //     /// share button
        //     actions: <Widget>[
        //       // TextButton(
        //       //   onPressed: () {
        //       //     // Share.share(
        //       //     //     this.widget.post.title + ' ' + this.widget.post.link);
        //       //   },
        //       //   child: Icon(Icons.share, color: Colors.white),
        //       // )
        //     ],
        //   ),
        //   padding: 10.0,
        //   contentOffset: 30.0,
        // ),
        // bottomNavigationBar: SafeArea(
        // child: Container(
        //   width: double.infinity,
        //   height: 55.0,
        //   margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
        //   child: ElevatedButton(
        //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => CommentsScreen(this.widget.post.id),
        //     )),
        //     style: ElevatedButton.styleFrom(
        //       shadowColor: secondarybgcolor,
        //       primary: secondarycolor,
        //       padding: EdgeInsets.all(0),
        //       textStyle: TextStyle(
        //         color: isDark ? Colors.white : Color(0xFF1B1E28),
        //         // color: isDark ? Colors.black : Color(0xFF1B1E28),
        //       ),
        //       //  primary: isDark ? Colors.white : Color(0xFF1B1E28), // background
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(3.0)),
        //     ),
        //     child: Text(DecoLocalizations.of(context)
        //         .localizedString("single_post_view_all_comments")),
        //   ),
        // ),
        // ),
        );
  }

  _content(context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: isDark ? Color(0xFF1B1E28) : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //////////////
                FutureBuilder(
                    future: data,
                    // ignore: missing_return
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        double cashflowper = (snapshot.data["poodle-o-meter"]
                                ["home_ranking"]["cash_flow"] /
                            100);
                        double regiongrowthdouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["region_growth"] /
                                100);
                        double neighbourdouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["neighborhood"] /
                                100);
                        double totalscooredouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["total_score"] /
                                100);
                        double marketdouble = (snapshot.data["poodle-o-meter"]
                                ["home_ranking"]["better_home"]["value"] /
                            100);
                        print(cashflowper);
/////////////////////////////////////////////////  Cash flow graph //////////////////

                        ////////////////////  Like button api /////////////////////

                        return Center(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                          ["general"]["type"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  snapshot.data[
                                                          "property-details"]
                                                      ["general"]["status"],
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),

                                        ////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                                  "property-details"]
                                                              ["general"][
                                                          "region-and-state-code"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                    Text(
                                                      '${oCcy.format(int.parse(snapshot.data["property-details"]["general"]["price"]))}',
                                                      style: TextStyle(
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        /////////////////////////

                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["year-built"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["per-sqft"]
                                                          .toString(),
                                                      style: TextStyle(),
                                                    ),
                                                    Text(
                                                      " /per sqft",
                                                      style: TextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        ///////////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bed_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["bedroom"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bathroom_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["bathroom"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.view_array_outlined,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                          ["general"]["area"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        //////////////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "HOA Frequency",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["hoa-frequency"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "HOA",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                                  "property-details"]
                                                              ["general"]
                                                          ["month-hoa-fee"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              // height: 150,
                                              child: Column(children: [
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["mortgage_interest_rate"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["downpayment"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["closing_cost"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["annual_average_price_increase"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["annual_average_rent_increase"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["annual_vacancy_rate"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["us_bonds"]["percent"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["month_hoa"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["annual_insurance"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["annual_property_tax"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(
                                                  double.parse(
                                                          '${snapshot.data["set-parameters"]["estimated_monthly_rent"]["default_value"]}')
                                                      .toDouble()
                                                      .toStringAsPrecision(3),
                                                ),
                                                Text(snapshot
                                                        .data["set-parameters"]
                                                    ["us_bonds"]["label"]),
                                                Text(snapshot
                                                        .data["set-parameters"]
                                                    ["S_P_500"]["label"]),
                                              ]),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // Text(
                                                //   'hi',
                                                //   style: TextStyle(
                                                //       color: Colors.black),
                                                // ),

                                                // Text(
                                                //   '${widget.value.fdata1}',
                                                //   style: TextStyle(
                                                //       color: Colors.black),
                                                // ),

                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          _PopupDialogPropertyTax(
                                                              context),
                                                    );
                                                  },
                                                  child: Text(
                                                    "More info",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: secondarycolor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Text(snapshot.data["property-details"]["general"]
                                  //     ["region"]),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 4.0, vertical: 6.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          // shrinkWrap: true,
                                          itemCount: snapshot
                                              .data["property-details"]
                                                  ["gallery"]
                                              .length,
                                          // gridDelegate:
                                          //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                          //         maxCrossAxisExtent: 200,
                                          //         childAspectRatio: 0.8,
                                          //         crossAxisSpacing: 10,
                                          //         mainAxisSpacing: 10),
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return InkWell(
                                              // onTap: () => Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) {
                                              //       return PropertyDetails();
                                              //     },
                                              //   ),
                                              // ),

                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,

                                                  alignment: Alignment.center,
                                                  // height: 80,
                                                  // width: 100,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  _buildPopupDialog(
                                                                      context),
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child:
                                                                Image.network(
                                                              snapshot.data[
                                                                      "property-details"]
                                                                      [
                                                                      "gallery"]
                                                                      [index]
                                                                      ["photo"]
                                                                  .toString(),
                                                              fit: BoxFit.cover,
                                                              height: 80,
                                                              width: 100,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // decoration: BoxDecoration(
                                                  //     boxShadow: [
                                                  //       new BoxShadow(
                                                  //         color: shadowColor,
                                                  //         blurRadius: 3,
                                                  //       ),
                                                  //     ],
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(10),
                                                  //     color: box),
                                                ),
                                              ),
                                              // ),
                                            );
                                            //   decoration: BoxDecoration(
                                            //       border: Border.all(),
                                            //       // color: Colors.amber,
                                            //       borderRadius: BorderRadius.circular(15)),
                                            // );
                                          }),
                                    ),
                                  ),
                                  /////////////////////////////////////////////
                                  /////////////Tab Bar///////////////////////////////////////////////////////////
                                  DefaultTabController(
                                    length: 6, // length of tabs
                                    initialIndex: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                          child: TabBar(
                                            physics: BouncingScrollPhysics(),
                                            labelPadding: EdgeInsets.all(6),
                                            padding: EdgeInsets.all(8),
                                            isScrollable: true,
                                            labelColor: secondarycolor,
                                            indicatorColor: secondarycolor,
                                            // indicator: UnderlineTabIndicator(
                                            //   insets: EdgeInsets.all(5),
                                            // ),
                                            unselectedLabelColor: Colors.black,
                                            tabs: [
                                              //// Details tab////
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 40,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 3,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: box),
                                                  child: Tab(text: 'Details'),
                                                ),
                                              ),
                                              ///////// Poodle-O-Meter  ///////////////////
                                              Container(
                                                height: 40,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      new BoxShadow(
                                                        color: shadowColor,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: box),
                                                child: Center(
                                                    child: Tab(
                                                        text:
                                                            'Poodle-O-Meter')),
                                              ),
                                              /////////// Investor Metrics tab  ///////////////
                                              Container(
                                                height: 40,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      new BoxShadow(
                                                        color: shadowColor,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: box),
                                                child: Tab(
                                                    text: 'Investor Metrics'),
                                              ),
                                              ///////////// Cash Flow tab //////////////
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      new BoxShadow(
                                                        color: shadowColor,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: box),
                                                child: Tab(text: 'Cash Flow'),
                                              ),
                                              ////////////Neighborhood tab ////////////
                                              Container(
                                                height: 40,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      new BoxShadow(
                                                        color: shadowColor,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: box),
                                                child:
                                                    Tab(text: 'Neighborhood'),
                                              ),
                                              /////////////////  Recommendations tab ///////
                                              Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 3,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: box),
                                                  child: Tab(
                                                      text: 'Recommendations')),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                2.3,

                                            // 1.3, //height of TabBarView
                                            // decoration: BoxDecoration(
                                            //     border: Border(
                                            //         top: BorderSide(
                                            //             color: Colors.grey,
                                            //             width: 0.5))),
                                            child: TabBarView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: <Widget>[
                                                  ///////////////////////////////  DETAILS    /////////////////////////////
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ReadMoreText(
                                                        snapshot.data[
                                                                    "property-details"]
                                                                ["general"]
                                                            ["description"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14),
                                                        trimLines: 6,
                                                        colorClickableText:
                                                            secondarycolor,
                                                        trimMode: TrimMode.Line,
                                                        trimCollapsedText:
                                                            'Read more',
                                                        trimExpandedText:
                                                            ' Read less',
                                                      ),
                                                    ),
                                                  ),
                                                  ///////////////////////// Poodle-o-meter/////////////////////////////////////
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Poodle-o-meter",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Can this home make you a ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "millionaire??",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        secondarycolor),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),

                                                          SvgPicture.network(
                                                            "https://clientdev.tagwebs.in/litpoodle/assets/new/assets/img/home-details-svg/million.svg",
                                                            height: 80,
                                                            width: 80,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            snapshot.data[
                                                                        "poodle-o-meter"]
                                                                    [
                                                                    "investment_performance"]
                                                                [
                                                                "your-investment-of"],
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    18,
                                                                    0,
                                                                    18,
                                                                    0),
                                                            child: Text(
                                                              "\"*Assumes a downpayment of 20%. Please click 'Set Paramaters' to see the list of all assumptions behind this calculation.\"",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          /////////////////////
                                                          Column(
                                                            children: [
                                                              Text(
                                                                snapshot.data["poodle-o-meter"]
                                                                            [
                                                                            "investment_performance"]
                                                                        [
                                                                        "investment-growth"]
                                                                    [
                                                                    "no-of-years"],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),

                                                          //////////// poodle graph ////////////////////////
                                                          // Bargraph(),
                                                          Container(
                                                            height: 300,
                                                            width: 265,
                                                            child:
                                                                charts.BarChart(
                                                              poodlegraph1(),
                                                              animate: true,
                                                              // behaviors: [
                                                              //   charts.LinePointHighlighter(
                                                              //       symbolRenderer:
                                                              //           CustomCircleSymbolRenderer() // add this line in behaviours
                                                              //       )
                                                              // ],
                                                              behaviors: [
                                                                charts
                                                                    .LinePointHighlighter(
                                                                  symbolRenderer:
                                                                      CustomCircleSymbolRenderer(), // add this line in behaviours
                                                                ),
                                                                // new charts
                                                                //         .ChartTitle(
                                                                //     'Bottom title text',
                                                                //     behaviorPosition: charts
                                                                //         .BehaviorPosition
                                                                //         .bottom,
                                                                //     titleOutsideJustification: charts
                                                                //         .OutsideJustification
                                                                //         .middleDrawArea),
                                                                new charts
                                                                    .ChartTitle(
                                                                  'Currency \$',
                                                                  titleStyleSpec:
                                                                      charts.TextStyleSpec(
                                                                          fontSize:
                                                                              10),
                                                                  behaviorPosition:
                                                                      charts
                                                                          .BehaviorPosition
                                                                          .start,
                                                                  titleOutsideJustification: charts
                                                                      .OutsideJustification
                                                                      .middleDrawArea,
                                                                ),
                                                              ],
                                                              selectionModels: [
                                                                charts.SelectionModelConfig(
                                                                    changedListener:
                                                                        (charts.SelectionModel
                                                                            model) {
                                                                  if (model
                                                                      .hasDatumSelection) {
                                                                    final value = model
                                                                        .selectedSeries[
                                                                            0]
                                                                        .measureFn(model
                                                                            .selectedDatum[0]
                                                                            .index);
                                                                    CustomCircleSymbolRenderer
                                                                            .value =
                                                                        value
                                                                            .toString(); // paints the tapped value
                                                                  }
                                                                })
                                                              ],
                                                              // selectionModels: [
                                                              //   charts.SelectionModelConfig(
                                                              //       changedListener:
                                                              //           (charts.SelectionModel
                                                              //               model) {
                                                              //     if (model
                                                              //         .hasDatumSelection)
                                                              //       print(model
                                                              //           .selectedSeries[
                                                              //               0]
                                                              //           .measureFn(model
                                                              //               .selectedDatum[0]
                                                              //               .index));
                                                              //   })
                                                              // ],
                                                              defaultRenderer:
                                                                  new charts
                                                                      .BarRendererConfig(
                                                                cornerStrategy:
                                                                    const charts
                                                                        .ConstCornerStrategy(30),
                                                                maxBarWidthPx:
                                                                    20,
                                                              ),
                                                              domainAxis: new charts
                                                                      .OrdinalAxisSpec(
                                                                  renderSpec: new charts
                                                                          .SmallTickRendererSpec(

                                                                      // Tick and Label styling here.
                                                                      labelStyle: new charts
                                                                              .TextStyleSpec(
                                                                          fontSize:
                                                                              10, // size in Pts.
                                                                          color: charts
                                                                              .MaterialPalette
                                                                              .black),

                                                                      // Change the line colors to match text color.
                                                                      lineStyle: new charts
                                                                              .LineStyleSpec(
                                                                          color:
                                                                              charts.ColorUtil.fromDartColor(secondarycolor)))),
                                                              primaryMeasureAxis: new charts
                                                                      .NumericAxisSpec(
                                                                  tickProviderSpec:
                                                                      charts
                                                                          .BasicNumericTickProviderSpec(
                                                                    desiredMinTickCount:
                                                                        6,
                                                                    desiredTickCount:
                                                                        6,
                                                                    dataIsInWholeNumbers:
                                                                        true,
                                                                    zeroBound:
                                                                        true,
                                                                  ),
                                                                  renderSpec: new charts
                                                                          .GridlineRendererSpec(

                                                                      // Tick and Label styling here.
                                                                      labelStyle: new charts
                                                                              .TextStyleSpec(
                                                                          fontSize:
                                                                              6, // size in Pts.
                                                                          color: charts
                                                                              .MaterialPalette
                                                                              .black),

                                                                      // Change the line colors to match text color.
                                                                      lineStyle:
                                                                          new charts.LineStyleSpec(
                                                                              color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                            ),
                                                          ),
                                                          //////////
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Annualized Growth rates used for the purpose \nof comparison:",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                      "US Bonds (with interest reinvested):"),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                      "S&P 500 (with dividend reinvested):"),
                                                                ],
                                                              ),

                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    double.parse(
                                                                            '${snapshot.data["set-parameters"]["us_bonds"]["percent"]}')
                                                                        .toDouble()
                                                                        .toStringAsPrecision(
                                                                            3),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    double.parse(
                                                                            '${snapshot.data["set-parameters"]["S_P_500"]["percent"]}')
                                                                        .toDouble()
                                                                        .toStringAsPrecision(
                                                                            3),
                                                                  ),
                                                                ],
                                                              ),
                                                              //    Row(
                                                              //   children: [
                                                              //     Text(
                                                              //         "Home (with cash flow reinvested): "),
                                                              //     Text(
                                                              //       double.parse(
                                                              //               '${snapshot.data["set-parameters"]["S_P_500"]["percent"]}')
                                                              //           .toDouble()
                                                              //           .toStringAsPrecision(
                                                              //               3),
                                                              //     ),
                                                              //   ],
                                                              // ),
                                                            ],
                                                          ),

                                                          /////////////
                                                          SizedBox(
                                                            height: 30,
                                                          ),

                                                          ///
                                                          Text(
                                                            "Home Ranking",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      new CircularPercentIndicator(
                                                                        radius:
                                                                            80.0,
                                                                        lineWidth:
                                                                            10.0,
                                                                        animation:
                                                                            true,
                                                                        percent:
                                                                            cashflowper,
                                                                        center:
                                                                            new Text(
                                                                          snapshot
                                                                              .data["poodle-o-meter"]["home_ranking"]["cash_flow"]
                                                                              .toString(),
                                                                          style: new TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 20.0),
                                                                        ),
                                                                        footer:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              new Text(
                                                                            "Cash Flow",
                                                                            style:
                                                                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                                                          ),
                                                                        ),
                                                                        circularStrokeCap:
                                                                            CircularStrokeCap.round,
                                                                        progressColor:
                                                                            secondarycolor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      new CircularPercentIndicator(
                                                                        radius:
                                                                            80.0,
                                                                        lineWidth:
                                                                            10.0,
                                                                        animation:
                                                                            true,
                                                                        percent:
                                                                            regiongrowthdouble,
                                                                        center:
                                                                            new Text(
                                                                          snapshot
                                                                              .data["poodle-o-meter"]["home_ranking"]["region_growth"]
                                                                              .toString(),
                                                                          style: new TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 20.0),
                                                                        ),
                                                                        footer:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              new Text(
                                                                            "Region Growth",
                                                                            style:
                                                                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                                                          ),
                                                                        ),
                                                                        circularStrokeCap:
                                                                            CircularStrokeCap.round,
                                                                        progressColor:
                                                                            secondarycolor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      new CircularPercentIndicator(
                                                                        radius:
                                                                            80.0,
                                                                        lineWidth:
                                                                            10.0,
                                                                        animation:
                                                                            true,
                                                                        percent:
                                                                            neighbourdouble,
                                                                        center:
                                                                            new Text(
                                                                          snapshot
                                                                              .data["poodle-o-meter"]["home_ranking"]["neighborhood"]
                                                                              .toString(),
                                                                          style: new TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 20.0),
                                                                        ),
                                                                        footer:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              new Text(
                                                                            "Neighborhood",
                                                                            style:
                                                                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                                                          ),
                                                                        ),
                                                                        circularStrokeCap:
                                                                            CircularStrokeCap.round,
                                                                        progressColor:
                                                                            secondarycolor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          // Text(
                                                          //   "=",
                                                          //   style: TextStyle(
                                                          //       color: secondarycolor,
                                                          //       fontSize: 30,
                                                          //       fontWeight: FontWeight.bold),
                                                          // ),
                                                          new CircularPercentIndicator(
                                                            radius: 80.0,
                                                            lineWidth: 10.0,
                                                            animation: true,
                                                            percent:
                                                                totalscooredouble,
                                                            center: new Text(
                                                              snapshot.data[
                                                                      "poodle-o-meter"]
                                                                      [
                                                                      "home_ranking"]
                                                                      [
                                                                      "total_score"]
                                                                  .toString(),
                                                              style: new TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      20.0),
                                                            ),
                                                            footer: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: new Text(
                                                                "Total Score",
                                                                style: new TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        10.0),
                                                              ),
                                                            ),
                                                            circularStrokeCap:
                                                                CircularStrokeCap
                                                                    .round,
                                                            progressColor:
                                                                secondarycolor,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              new CircularPercentIndicator(
                                                                  radius: 80.0,
                                                                  lineWidth:
                                                                      10.0,
                                                                  animation:
                                                                      true,
                                                                  percent:
                                                                      marketdouble,
                                                                  center:
                                                                      new Text(
                                                                    snapshot
                                                                        .data[
                                                                            "poodle-o-meter"]
                                                                            [
                                                                            "home_ranking"]
                                                                            [
                                                                            "better_home"]
                                                                            [
                                                                            "value"]
                                                                        .toString(),
                                                                    style: new TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20.0),
                                                                  ),
                                                                  footer:
                                                                      new Text(
                                                                    "",
                                                                    style: new TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            17.0),
                                                                  ),
                                                                  circularStrokeCap:
                                                                      CircularStrokeCap
                                                                          .round,
                                                                  progressColor:
                                                                      Color(
                                                                    snapshot
                                                                        .data[
                                                                            "poodle-o-meter"]
                                                                            [
                                                                            "home_ranking"]
                                                                            [
                                                                            "better_home"]
                                                                            [
                                                                            "colour"]
                                                                        .hashCode,
                                                                  )),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          6,
                                                                          0,
                                                                          0,
                                                                          30),
                                                                  child: Text(
                                                                    snapshot.data["poodle-o-meter"]["home_ranking"]
                                                                            [
                                                                            "better_home"]
                                                                        [
                                                                        "text"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  new BoxShadow(
                                                                    color:
                                                                        shadowColor,
                                                                    blurRadius:
                                                                        3,
                                                                  ),
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: box),
                                                            child: Center(
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                // mainAxisAlignment:
                                                                //     MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          80,
                                                                      width: 80,
                                                                      child: SvgPicture
                                                                          .network(
                                                                        'https://www.litpoodle.com/styles/img/home-svg/poodle.svg',
                                                                        semanticsLabel:
                                                                            'poodle',
                                                                        placeholderBuilder: (BuildContext context) => Container(
                                                                            padding:
                                                                                const EdgeInsets.all(30.0),
                                                                            child: const CircularProgressIndicator()),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .fromLTRB(
                                                                          10,
                                                                          12,
                                                                          0,
                                                                          20),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data["poodle-o-meter"]["home_ranking"]["better_home"]["litpoodle-verdict"]["title"].toString().toUpperCase(),
                                                                            style:
                                                                                TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            snapshot.data["poodle-o-meter"]["home_ranking"]["better_home"]["litpoodle-verdict"]["body"],
                                                                            style:
                                                                                TextStyle(fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    /////
                                                  ),
                                                  //////////////////////  Investor Metrics ///////////////////////////////////////////////
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Investor Metrics",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        //////////////////////
                                                        Container(
                                                          height: 400,
                                                          width: 300,
                                                          decoration: BoxDecoration(
                                                              boxShadow: [
                                                                new BoxShadow(
                                                                  color:
                                                                      shadowColor,
                                                                  blurRadius: 3,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: box),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "\$",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '${oCcy.format(snapshot.data["investor-metrics"]["monthly-estimated-rent"])}',
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Estimated Rent",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "/",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              secondarycolor,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "\$",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            '${oCcy.format(int.parse(snapshot.data["investor-metrics"]["price-of-home"]).toInt())}',
                                                                            // snapshot.data["investor-metrics"]["price-of-home"],
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Purchase Price",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "=",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              secondarycolor,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data["investor-metrics"]["gross-rent-yiels"].toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "\%",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        " Annual Rental",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              /////////////
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      SvgPicture
                                                                          .network(
                                                                        "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "\$",
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            '${oCcy.format(snapshot.data["investor-metrics"]["your-investment"])}',
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Your investment",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            50,
                                                                      ),
                                                                      Text(
                                                                        "=",
                                                                        style: TextStyle(
                                                                            color:
                                                                                secondarycolor,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  /////////////////

                                                                  Column(
                                                                    children: [
                                                                      SvgPicture
                                                                          .network(
                                                                        "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/dog-house.svg",
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "\$",
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            "${oCcy.format(snapshot.data["investor-metrics"]["downpayment"])}",
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Downpayment ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            50,
                                                                      ),
                                                                      Text(
                                                                        "+",
                                                                        style: TextStyle(
                                                                            color:
                                                                                secondarycolor,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  /////////////
                                                                  Column(
                                                                    children: [
                                                                      SvgPicture
                                                                          .network(
                                                                        "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/file.svg",
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "\$",
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                          Text(
                                                                            "${oCcy.format(snapshot.data["investor-metrics"]["closing-and-leasing-cost"])}",
                                                                            style: TextStyle(
                                                                                color: secondarycolor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Closing & Leasing Costs",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              //////////////
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        12.0),
                                                                child: Text(
                                                                  "Monthly Net Cash Flow before taxes will be",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        25,
                                                                        0,
                                                                        25,
                                                                        0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        SvgPicture
                                                                            .network(
                                                                          "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              50,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "\$",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                            Text(
                                                                              "${oCcy.format(snapshot.data["investor-metrics"]["monthly-net-cash"]["1st-year"])}",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "1st Year",
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    /////////////////
                                                                    Column(
                                                                      children: [
                                                                        SvgPicture
                                                                            .network(
                                                                          "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              50,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "\$",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                            Text(
                                                                              "${oCcy.format(snapshot.data["investor-metrics"]["monthly-net-cash"]["10th-year"])}",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "10th Year",
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    /////////////
                                                                    Column(
                                                                      children: [
                                                                        SvgPicture
                                                                            .network(
                                                                          "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              50,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "\$",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                            Text(
                                                                              "${oCcy.format(snapshot.data["investor-metrics"]["monthly-net-cash"]["30th-year"])}",
                                                                              style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "30th Year",
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        ////////////////////// graph pending ///////////////////

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                snapshot.data[
                                                                        "investor-metrics"]
                                                                    [
                                                                    "compare-s-and-p"],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    boxShadow: [
                                                                      new BoxShadow(
                                                                        color:
                                                                            shadowColor,
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: box),
                                                                height: 250.0,
                                                                width: 250,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child: charts
                                                                      .BarChart(
                                                                    cashreturngraph(),
                                                                    // vertical:
                                                                    //     false,
                                                                    animate:
                                                                        true,
                                                                    behaviors: [
                                                                      charts.LinePointHighlighter(
                                                                          symbolRenderer:
                                                                              Region2CircleSymbolRenderer() // add this line in behaviours

                                                                          )
                                                                    ],
                                                                    selectionModels: [
                                                                      charts.SelectionModelConfig(changedListener:
                                                                          (charts.SelectionModel
                                                                              model) {
                                                                        if (model
                                                                            .hasDatumSelection) {
                                                                          final value = model
                                                                              .selectedSeries[0]
                                                                              .measureFn(model.selectedDatum[0].index);
                                                                          Region2CircleSymbolRenderer.value =
                                                                              value.toString(); // paints the tapped value
                                                                        }
                                                                      }),
                                                                    ],
                                                                    defaultRenderer: new charts
                                                                            .BarRendererConfig(
                                                                        cornerStrategy:
                                                                            const charts.ConstCornerStrategy(
                                                                                30),
                                                                        maxBarWidthPx:
                                                                            20),
                                                                    domainAxis: new charts
                                                                            .OrdinalAxisSpec(
                                                                        renderSpec: new charts.SmallTickRendererSpec(

                                                                            // Tick and Label styling here.
                                                                            labelStyle: new charts.TextStyleSpec(
                                                                                fontSize: 10, // size in Pts.
                                                                                color: charts.MaterialPalette.black),

                                                                            // Change the line colors to match text color.
                                                                            lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                    primaryMeasureAxis: new charts
                                                                            .NumericAxisSpec(
                                                                        tickProviderSpec:
                                                                            charts.BasicNumericTickProviderSpec(
                                                                          desiredMinTickCount:
                                                                              4,
                                                                          desiredTickCount:
                                                                              4,
                                                                          dataIsInWholeNumbers:
                                                                              false,
                                                                          zeroBound:
                                                                              true,
                                                                        ),
                                                                        renderSpec: new charts.GridlineRendererSpec(

                                                                            // Tick and Label styling here.
                                                                            labelStyle: new charts.TextStyleSpec(
                                                                                fontSize: 6, // size in Pts.
                                                                                color: charts.MaterialPalette.black),

                                                                            // Change the line colors to match text color.
                                                                            lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                  "And here are some more financial metrics"),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data["investor-metrics"]["some-more-financial-metrics"]["cap-rate"]["value"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      Text(
                                                                        "% ",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Cap rate",
                                                                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 4,
                                                                            ),
                                                                            Text(
                                                                              snapshot.data["investor-metrics"]["some-more-financial-metrics"]["cap-rate"]["text"].toString(),
                                                                              style: TextStyle(fontSize: 12),
                                                                              // style: TextStyle(
                                                                              //     fontWeight: FontWeight
                                                                              //         .w700,
                                                                              //     color:
                                                                              //         secondarycolor,
                                                                              //     fontSize:
                                                                              //         30),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  //////
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data["investor-metrics"]["some-more-financial-metrics"]["growth-rate"]["value"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      Text(
                                                                        "%*",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Growth rate",
                                                                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 4,
                                                                            ),
                                                                            Text(
                                                                              snapshot.data["investor-metrics"]["some-more-financial-metrics"]["growth-rate"]["text"].toString(),
                                                                              style: TextStyle(fontSize: 12),
                                                                              // style: TextStyle(
                                                                              //     fontWeight: FontWeight
                                                                              //         .w700,
                                                                              //     color:
                                                                              //         secondarycolor,
                                                                              //     fontSize:
                                                                              //         30),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ), //////////////
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data["investor-metrics"]["some-more-financial-metrics"]["annualized-growth-rate"]["value"]
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      Text(
                                                                        "%*",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color:
                                                                                secondarycolor,
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Annualized growth rate",
                                                                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 4,
                                                                            ),
                                                                            Text(
                                                                              snapshot.data["investor-metrics"]["some-more-financial-metrics"]["annualized-growth-rate"]["text"].toString(),
                                                                              style: TextStyle(fontSize: 12),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                        ///////////////////////
                                                        // SingleChildScrollView(
                                                        //   physics:
                                                        //       BouncingScrollPhysics(),
                                                        //   scrollDirection:
                                                        //       Axis.horizontal,
                                                        //   child: Container(
                                                        //     height: 110,
                                                        //     width: 300,
                                                        //     decoration: BoxDecoration(
                                                        //         boxShadow: [
                                                        //           new BoxShadow(
                                                        //             color:
                                                        //                 shadowColor,
                                                        //             blurRadius:
                                                        //                 3,
                                                        //           ),
                                                        //         ],
                                                        //         borderRadius:
                                                        //             BorderRadius
                                                        //                 .circular(
                                                        //                     10),
                                                        //         color: box),
                                                        //     child: Column(
                                                        //       mainAxisAlignment:
                                                        //           MainAxisAlignment
                                                        //               .spaceEvenly,
                                                        //       children: [
                                                        //         Padding(
                                                        //           padding:
                                                        //               const EdgeInsets
                                                        //                       .all(
                                                        //                   8.0),
                                                        //           child: Row(
                                                        //             mainAxisAlignment:
                                                        //                 MainAxisAlignment
                                                        //                     .spaceEvenly,
                                                        //             children: [
                                                        //               Column(
                                                        //                 children: [
                                                        //                   SvgPicture
                                                        //                       .network(
                                                        //                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                        //                     height:
                                                        //                         50,
                                                        //                     width:
                                                        //                         50,
                                                        //                   ),
                                                        //                   SizedBox(
                                                        //                     height:
                                                        //                         10,
                                                        //                   ),
                                                        //                   Row(
                                                        //                     children: [
                                                        //                       Text(
                                                        //                         "\$",
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                       Text(
                                                        //                         snapshot.data["investor-metrics"]["your-investment"].toString(),
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                     ],
                                                        //                   ),
                                                        //                   Text(
                                                        //                     "Your investment",
                                                        //                     style:
                                                        //                         TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                                        //                   ),
                                                        //                 ],
                                                        //               ),
                                                        //               Text(
                                                        //                 "=",
                                                        //                 style: TextStyle(
                                                        //                     color:
                                                        //                         secondarycolor,
                                                        //                     fontWeight:
                                                        //                         FontWeight.w700),
                                                        //               ),
                                                        //               /////////////////
                                                        //               Column(
                                                        //                 children: [
                                                        //                   SvgPicture
                                                        //                       .network(
                                                        //                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/dog-house.svg",
                                                        //                     height:
                                                        //                         50,
                                                        //                     width:
                                                        //                         50,
                                                        //                   ),
                                                        //                   SizedBox(
                                                        //                     height:
                                                        //                         10,
                                                        //                   ),
                                                        //                   Row(
                                                        //                     children: [
                                                        //                       Text(
                                                        //                         "\$",
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                       Text(
                                                        //                         snapshot.data["investor-metrics"]["downpayment"].toString(),
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                     ],
                                                        //                   ),
                                                        //                   Text(
                                                        //                     "Downpayment ",
                                                        //                     style:
                                                        //                         TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                                        //                   ),
                                                        //                 ],
                                                        //               ),
                                                        //               Text(
                                                        //                 "+",
                                                        //                 style: TextStyle(
                                                        //                     color:
                                                        //                         secondarycolor,
                                                        //                     fontWeight:
                                                        //                         FontWeight.w700),
                                                        //               ),
                                                        //               /////////////
                                                        //               Column(
                                                        //                 children: [
                                                        //                   SvgPicture
                                                        //                       .network(
                                                        //                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/file.svg",
                                                        //                     height:
                                                        //                         50,
                                                        //                     width:
                                                        //                         50,
                                                        //                   ),
                                                        //                   SizedBox(
                                                        //                     height:
                                                        //                         10,
                                                        //                   ),
                                                        //                   Row(
                                                        //                     children: [
                                                        //                       Text(
                                                        //                         "\$",
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                       Text(
                                                        //                         snapshot.data["investor-metrics"]["closing-and-leasing-cost"].toString(),
                                                        //                         style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                                        //                       ),
                                                        //                     ],
                                                        //                   ),
                                                        //                   Text(
                                                        //                     "Closing & Leasing Costs",
                                                        //                     style:
                                                        //                         TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                                        //                   ),
                                                        //                 ],
                                                        //               ),
                                                        //             ],
                                                        //           ),
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //   ),
                                                        // ),

                                                        // SizedBox(
                                                        //   height: 20,
                                                        // ),
                                                        // /////////////////////////////////   /////////////////
                                                        // Padding(
                                                        //   padding:
                                                        //       const EdgeInsets
                                                        //           .all(12.0),
                                                        //   child: Text(
                                                        //     "Monthly Net Cash Flow before taxes will be",
                                                        //     style: TextStyle(
                                                        //         fontSize: 12,
                                                        //         fontWeight:
                                                        //             FontWeight
                                                        //                 .w700),
                                                        //   ),
                                                        // ),
                                                        // Container(
                                                        //   height: 110,
                                                        //   width: 300,
                                                        //   decoration: BoxDecoration(
                                                        //       boxShadow: [
                                                        //         new BoxShadow(
                                                        //           color:
                                                        //               shadowColor,
                                                        //           blurRadius: 3,
                                                        //         ),
                                                        //       ],
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(
                                                        //                   10),
                                                        //       color: box),
                                                        //   child: Padding(
                                                        //     padding:
                                                        //         const EdgeInsets
                                                        //             .all(8.0),
                                                        //     child: Row(
                                                        //       mainAxisAlignment:
                                                        //           MainAxisAlignment
                                                        //               .spaceEvenly,
                                                        //       children: [
                                                        //         Column(
                                                        //           children: [
                                                        //             SvgPicture
                                                        //                 .network(
                                                        //               "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                        //               height:
                                                        //                   50,
                                                        //               width: 50,
                                                        //             ),
                                                        //             SizedBox(
                                                        //               height:
                                                        //                   10,
                                                        //             ),
                                                        //             Row(
                                                        //               children: [
                                                        //                 Text(
                                                        //                   "\$",
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //                 Text(
                                                        //                   snapshot
                                                        //                       .data["investor-metrics"]["monthly-net-cash"]["1st-year"]
                                                        //                       .toString(),
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //             Text(
                                                        //               "1st Year",
                                                        //               style: TextStyle(
                                                        //                   fontSize:
                                                        //                       10,
                                                        //                   fontWeight:
                                                        //                       FontWeight.w700),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //         /////////////////
                                                        //         Column(
                                                        //           children: [
                                                        //             SvgPicture
                                                        //                 .network(
                                                        //               "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                        //               height:
                                                        //                   50,
                                                        //               width: 50,
                                                        //             ),
                                                        //             SizedBox(
                                                        //               height:
                                                        //                   10,
                                                        //             ),
                                                        //             Row(
                                                        //               children: [
                                                        //                 Text(
                                                        //                   "\$",
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //                 Text(
                                                        //                   snapshot
                                                        //                       .data["investor-metrics"]["monthly-net-cash"]["10th-year"]
                                                        //                       .toString(),
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //             Text(
                                                        //               "10th Year",
                                                        //               style: TextStyle(
                                                        //                   fontSize:
                                                        //                       10,
                                                        //                   fontWeight:
                                                        //                       FontWeight.w700),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //         /////////////
                                                        //         Column(
                                                        //           children: [
                                                        //             SvgPicture
                                                        //                 .network(
                                                        //               "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                                        //               height:
                                                        //                   50,
                                                        //               width: 50,
                                                        //             ),
                                                        //             SizedBox(
                                                        //               height:
                                                        //                   10,
                                                        //             ),
                                                        //             Row(
                                                        //               children: [
                                                        //                 Text(
                                                        //                   "\$",
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //                 Text(
                                                        //                   snapshot
                                                        //                       .data["investor-metrics"]["monthly-net-cash"]["30th-year"]
                                                        //                       .toString(),
                                                        //                   style: TextStyle(
                                                        //                       color: secondarycolor,
                                                        //                       fontSize: 12,
                                                        //                       fontWeight: FontWeight.w700),
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //             Text(
                                                        //               "30th Year",
                                                        //               style: TextStyle(
                                                        //                   fontSize:
                                                        //                       10,
                                                        //                   fontWeight:
                                                        //                       FontWeight.w700),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //   ),
                                                        //  )
                                                      ],
                                                    ),
                                                  ),
                                                  //////////////////////////////////  Cash flow /////////////////////////
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Cash Flow",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Estimated Monthly Expenses",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "(1st Year)",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        //////////////////////
                                                        // SfCircularChart(
                                                        //   title: ChartTitle(
                                                        //       text: ''),
                                                        //   legend: Legend(
                                                        //       isVisible: true,
                                                        //       overflowMode:
                                                        //           LegendItemOverflowMode
                                                        //               .wrap),
                                                        //   tooltipBehavior:
                                                        //       _tooltipBehavior,
                                                        //   series: <
                                                        //       CircularSeries>[
                                                        //     DoughnutSeries<
                                                        //         GDPData,
                                                        //         String>(
                                                        //       dataSource:
                                                        //           _chartData,
                                                        //       xValueMapper:
                                                        //           (GDPData data,
                                                        //                   _) =>
                                                        //               data.continent,
                                                        //       yValueMapper:
                                                        //           (GDPData data,
                                                        //                   _) =>
                                                        //               data.gdp,

                                                        //       dataLabelSettings:
                                                        //           DataLabelSettings(
                                                        //               isVisible:
                                                        //                   true),
                                                        //       enableTooltip:
                                                        //           true,
                                                        //       //  maximumValue: 40000
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        Center(
                                                            child: Container(
                                                                child: SfCircularChart(
                                                                    tooltipBehavior:
                                                                        _tooltipBehavior,
                                                                    series: <
                                                                        CircularSeries>[
                                                              // Renders doughnut chart
                                                              DoughnutSeries<
                                                                  CashflowDoughnutchart,
                                                                  String>(
                                                                enableTooltip:
                                                                    true,

                                                                explode: true,
                                                                //explodeIndex: 1,
                                                                dataSource:
                                                                    cashflowmnthestim,
                                                                //pointColorMapper:(CashflowDoughnutchart data,  _) => data.color,
                                                                xValueMapper:
                                                                    (CashflowDoughnutchart
                                                                                data,
                                                                            _) =>
                                                                        '${data.name.toString()}',
                                                                yValueMapper:
                                                                    (CashflowDoughnutchart
                                                                                data,
                                                                            _) =>
                                                                        double
                                                                            .parse(
                                                                  '${data.value.toString()}',
                                                                ),
                                                              )
                                                            ]))),
                                                        ///////////////////
                                                        // AspectRatio(
                                                        //   aspectRatio: 1.3,
                                                        //   child: Card(
                                                        //     color: Colors.white,
                                                        //     child: Row(
                                                        //       children: <
                                                        //           Widget>[
                                                        //         const SizedBox(
                                                        //           height: 18,
                                                        //         ),
                                                        //         Expanded(
                                                        //           child:
                                                        //               AspectRatio(
                                                        //             aspectRatio:
                                                        //                 1,
                                                        //             child:
                                                        //                 PieChart(
                                                        //               PieChartData(
                                                        //                   pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event,
                                                        //                       pieTouchResponse) {
                                                        //                     setState(() {
                                                        //                       if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                                        //                         touchedIndex = -1;
                                                        //                         return;
                                                        //                       }
                                                        //                       touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                                                        //                     });
                                                        //                   }),
                                                        //                   borderData:
                                                        //                       FlBorderData(
                                                        //                     show:
                                                        //                         false,
                                                        //                   ),
                                                        //                   sectionsSpace:
                                                        //                       1,
                                                        //                   centerSpaceRadius:
                                                        //                       60,
                                                        //                   sections: List.generate(
                                                        //                       7,
                                                        //                       (i) {
                                                        //                     final isTouched =
                                                        //                         i == touchedIndex;
                                                        //                     final fontSize = isTouched
                                                        //                         ? 16.0
                                                        //                         : 12.0;
                                                        //                     final radius = isTouched
                                                        //                         ? 40.0
                                                        //                         : 30.0;

                                                        //                     switch (i) {
                                                        //                       case 0:
                                                        //                         return PieChartSectionData(
                                                        //                           // 0xFF8b67d2

                                                        //                           color: Color(0xfffada5e),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][0]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][0]["percent"].toString(),
                                                        //                           //  borderSide: radius.10,
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 1:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xffffd300),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][1]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][1]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 2:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xfffcd12a),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][2]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][2]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 3:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xfffce205),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][3]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][3]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 4:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xfff8e473),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][4]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][4]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 5:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xfffcaf01),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][5]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][5]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 6:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xfffaca28),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][6]["percent"]}').toDouble(),
                                                        //                           title: (snapshot.data["cash-flow"]["cash-flow"][6]["percent"]).toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 7:
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color(0xffebfa28),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][7]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][7]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       case 8:
                                                        //                         //  (home: token != '' ? BottomNavScreen() : MyApp()));
                                                        //                         return PieChartSectionData(
                                                        //                           color: Color.fromARGB(255, 234, 241, 130),
                                                        //                           value: double.parse('${snapshot.data["cash-flow"]["cash-flow"][8]["percent"]}') == null ? "" : double.parse('${snapshot.data["cash-flow"]["cash-flow"][8]["percent"]}').toDouble(),
                                                        //                           title: snapshot.data["cash-flow"]["cash-flow"][8]["percent"].toString(),
                                                        //                           radius: radius,
                                                        //                           titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                        //                         );
                                                        //                       default:
                                                        //                         throw Error();
                                                        //                     }
                                                        //                   })),
                                                        //             ),
                                                        //           ),
                                                        //         ),

                                                        //         // Column(
                                                        //         //   mainAxisSize:
                                                        //         //       MainAxisSize
                                                        //         //           .max,
                                                        //         //   mainAxisAlignment:
                                                        //         //       MainAxisAlignment
                                                        //         //           .end,
                                                        //         //   crossAxisAlignment:
                                                        //         //       CrossAxisAlignment
                                                        //         //           .start,
                                                        //         //   children: const <
                                                        //         //       Widget>[
                                                        //         //     SizedBox(
                                                        //         //       height:
                                                        //         //           18,
                                                        //         //     ),
                                                        //         //   ],
                                                        //         // ),
                                                        //         const SizedBox(
                                                        //           width: 28,
                                                        //         ),
                                                        //       ],
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][0]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [0][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [0][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][1]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [1][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [1][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][2]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  // SizedBox(
                                                                  //   width: 10,
                                                                  // ),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [2][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [2][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][3]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [3][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [3][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][4]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [4][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [4][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              /////////////////////////////////////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][5]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [5][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [5][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][6]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [6][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [6][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ////////////////////////////
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot.data["cash-flow"]
                                                                            [
                                                                            "cash-flow"][7]
                                                                        [
                                                                        "name"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  Text("\$"),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [7][
                                                                            "value"]
                                                                        .toString(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            "cash-flow"]
                                                                            [
                                                                            "cash-flow"]
                                                                            [7][
                                                                            "percent"]
                                                                        .toString(),
                                                                  ),
                                                                  Text("%"),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child: Text(
                                                                  "Cashflow Breakdown by Year",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              //////////////////////////////
                                                              ///
                                                              ///

                                                              Scrollbar(
                                                                isAlwaysShown:
                                                                    true,
                                                                showTrackOnHover:
                                                                    true,
                                                                controller:
                                                                    _scrollcontroller1,
                                                                radius: Radius
                                                                    .circular(
                                                                        30),
                                                                thickness: 10,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller:
                                                                      _scrollcontroller1,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          300,
                                                                      width:
                                                                          600,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: charts
                                                                            .BarChart(
                                                                          cashflowstackbar(),
                                                                          animate:
                                                                              true,
                                                                          barGroupingType: charts
                                                                              .BarGroupingType
                                                                              .stacked,

                                                                          // defaultRenderer:
                                                                          //     new charts
                                                                          //         .BarRendererConfig(
                                                                          //   cornerStrategy:
                                                                          //        charts.ConstCornerStrategy(
                                                                          //           30),
                                                                          //   maxBarWidthPx:
                                                                          //       20,
                                                                          // ),
                                                                          behaviors: [
                                                                            new charts.ChartTitle(
                                                                              'Currency \$',
                                                                              titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                                                                              behaviorPosition: charts.BehaviorPosition.start,
                                                                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                                                            ),
                                                                            new charts.ChartTitle(
                                                                              'Year',
                                                                              titleStyleSpec: charts.TextStyleSpec(fontSize: 10),
                                                                              behaviorPosition: charts.BehaviorPosition.bottom,
                                                                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                                                            ),
                                                                          ],
                                                                          // behaviors: [
                                                                          //   charts.LinePointHighlighter(symbolRenderer: CustomCircleSymbolRenderer() // add this line in behaviours
                                                                          //       )
                                                                          // ],
                                                                          // selectionModels: [
                                                                          //   charts.SelectionModelConfig(changedListener:
                                                                          //       (charts.SelectionModel model) {
                                                                          //     if (model.hasDatumSelection) {
                                                                          //       final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                          //       CustomCircleSymbolRenderer.value = value.toString(); // paints the tapped value
                                                                          //     }
                                                                          //   })
                                                                          // ],
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 8,
                                                                                desiredTickCount: 8,
                                                                                dataIsInWholeNumbers: true,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              ////
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                new BoxShadow(
                                                                                  color: shadowColor,
                                                                                  blurRadius: 3,
                                                                                ),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff0387ad)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Insurance, Property Taxes & Maintenance",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                new BoxShadow(
                                                                                  color: shadowColor,
                                                                                  blurRadius: 3,
                                                                                ),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff02a88f)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Property Management & HOA fees",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                new BoxShadow(
                                                                                  color: shadowColor,
                                                                                  blurRadius: 3,
                                                                                ),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff83c273)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Interest portion of Mortgage",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                new BoxShadow(
                                                                                  color: shadowColor,
                                                                                  blurRadius: 3,
                                                                                ),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff333b81)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Principal portion of Mortgage",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          width:
                                                                              20,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: [
                                                                                new BoxShadow(
                                                                                  color: shadowColor,
                                                                                  blurRadius: 3,
                                                                                ),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff005faa)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Net Cashflow",
                                                                          style:
                                                                              TextStyle(fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              ///////////////cash flow 30year graph///////////////////
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child: Text(
                                                                  "Net Worth by Year",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                              // CashFlowBargraph(),

                                                              Scrollbar(
                                                                isAlwaysShown:
                                                                    true,
                                                                showTrackOnHover:
                                                                    true,
                                                                controller:
                                                                    _scrollcontroller2,
                                                                radius: Radius
                                                                    .circular(
                                                                        30),
                                                                thickness: 10,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller:
                                                                      _scrollcontroller2,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          300,
                                                                      width:
                                                                          600,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: charts
                                                                            .BarChart(
                                                                          yr30graph(),
                                                                          animate:
                                                                              true,
                                                                          behaviors: [
                                                                            charts.LinePointHighlighter(
                                                                              symbolRenderer: CustomCircleSymbolRenderer(), // add this line in behaviours
                                                                              drawFollowLinesAcrossChart: true,
                                                                              showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.none,
                                                                              showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.all,
                                                                            ),
                                                                            new charts.ChartTitle(
                                                                              'Currency \$',
                                                                              titleStyleSpec: charts.TextStyleSpec(fontSize: 11),
                                                                              behaviorPosition: charts.BehaviorPosition.start,
                                                                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                                                            ),
                                                                            new charts.ChartTitle(
                                                                              'Year',
                                                                              titleStyleSpec: charts.TextStyleSpec(fontSize: 10),
                                                                              behaviorPosition: charts.BehaviorPosition.bottom,
                                                                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                                                            ),
                                                                          ],
                                                                          selectionModels: [
                                                                            charts.SelectionModelConfig(changedListener:
                                                                                (charts.SelectionModel model) {
                                                                              if (model.hasDatumSelection) {
                                                                                final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                                CustomCircleSymbolRenderer.value = value.toString(); // paints the tapped value
                                                                              }
                                                                            })
                                                                          ],
                                                                          defaultRenderer:
                                                                              new charts.BarRendererConfig(
                                                                            cornerStrategy:
                                                                                const charts.ConstCornerStrategy(30),
                                                                            maxBarWidthPx:
                                                                                20,
                                                                          ),
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(secondarycolor)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 8,
                                                                                desiredTickCount: 8,
                                                                                dataIsInWholeNumbers: true,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              ////////////////////////////
                                                              ///
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ///////////////////////////// Neighborhood //////////////////////////////////
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Neighborhood",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            physics:
                                                                BouncingScrollPhysics(),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    height: 140,
                                                                    width: 150,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          new BoxShadow(
                                                                            color:
                                                                                shadowColor,
                                                                            blurRadius:
                                                                                3,
                                                                          ),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color:
                                                                            box),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SvgPicture
                                                                              .network(
                                                                            "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/shiba.svg",
                                                                            height:
                                                                                80,
                                                                            width:
                                                                                80,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                8,
                                                                          ),
                                                                          Column(
                                                                            children: [
                                                                              Text(
                                                                                "Median Household Income",
                                                                                style: TextStyle(fontSize: 10),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    "\$",
                                                                                    style: TextStyle(color: secondarycolor),
                                                                                  ),
                                                                                  Text(
                                                                                    '${oCcy.format(int.parse(snapshot.data["neighborhood"]["median-household-income"]))}',
                                                                                    style: TextStyle(color: secondarycolor, fontSize: 12),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // SizedBox(
                                                                //   width: 5,
                                                                // ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          6.0),
                                                                  child:
                                                                      Container(
                                                                    height: 145,
                                                                    width: 145,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          new BoxShadow(
                                                                            color:
                                                                                shadowColor,
                                                                            blurRadius:
                                                                                3,
                                                                          ),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        color:
                                                                            box),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SvgPicture
                                                                              .network(
                                                                            "https://www.litpoodle.com/assets/new/assets/img/school.svg",
                                                                            height:
                                                                                90,
                                                                            width:
                                                                                90,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Text(
                                                                                    "Elementary",
                                                                                    style: TextStyle(fontSize: 8),
                                                                                  ),
                                                                                  Text(
                                                                                    snapshot.data["neighborhood"]["school"]["elementary"].toString(),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Text(
                                                                                    "Middle",
                                                                                    style: TextStyle(fontSize: 8),
                                                                                  ),
                                                                                  Text(
                                                                                    snapshot.data["neighborhood"]["school"]["middle"].toString(),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Text(
                                                                                    "High",
                                                                                    style: TextStyle(fontSize: 8),
                                                                                  ),
                                                                                  Text(
                                                                                    snapshot.data["neighborhood"]["school"]["high"].toString(),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        //////////////
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "Region",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      height:
                                                                          220.0,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child: charts
                                                                            .BarChart(
                                                                          region1(),
                                                                          animate:
                                                                              true,
                                                                          behaviors: [
                                                                            charts.LinePointHighlighter(symbolRenderer: Region1SymbolRenderer() // add this line in behaviours
                                                                                )
                                                                          ],
                                                                          selectionModels: [
                                                                            charts.SelectionModelConfig(changedListener:
                                                                                (charts.SelectionModel model) {
                                                                              if (model.hasDatumSelection) {
                                                                                final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                                Region1SymbolRenderer.value = value.toString(); // paints the tapped value
                                                                              }
                                                                            }),
                                                                          ],
                                                                          defaultRenderer:
                                                                              new charts.BarRendererConfig(
                                                                            cornerStrategy:
                                                                                const charts.ConstCornerStrategy(30),
                                                                            maxBarWidthPx:
                                                                                20,
                                                                          ),
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 4,
                                                                                desiredTickCount: 4,
                                                                                dataIsInWholeNumbers: false,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "AVG JOB GROWTH RATE",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      height:
                                                                          220.0,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child: charts
                                                                            .BarChart(
                                                                          region2(),
                                                                          animate:
                                                                              true,
                                                                          behaviors: [
                                                                            charts.LinePointHighlighter(symbolRenderer: Region2CircleSymbolRenderer() // add this line in behaviours
                                                                                )
                                                                          ],
                                                                          selectionModels: [
                                                                            charts.SelectionModelConfig(changedListener:
                                                                                (charts.SelectionModel model) {
                                                                              if (model.hasDatumSelection) {
                                                                                final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                                Region2CircleSymbolRenderer.value = value.toString(); // paints the tapped value
                                                                              }
                                                                            }),
                                                                          ],
                                                                          defaultRenderer: new charts.BarRendererConfig(
                                                                              cornerStrategy: const charts.ConstCornerStrategy(30),
                                                                              maxBarWidthPx: 20),
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 4,
                                                                                desiredTickCount: 4,
                                                                                dataIsInWholeNumbers: false,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "AVG POPULATION",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      height:
                                                                          220.0,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child: charts
                                                                            .BarChart(
                                                                          region3(),
                                                                          animate:
                                                                              true,
                                                                          behaviors: [
                                                                            charts.LinePointHighlighter(symbolRenderer: Region3SymbolRenderer() // add this line in behaviours
                                                                                )
                                                                          ],
                                                                          selectionModels: [
                                                                            charts.SelectionModelConfig(changedListener:
                                                                                (charts.SelectionModel model) {
                                                                              if (model.hasDatumSelection) {
                                                                                final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                                Region3SymbolRenderer.value = value.toString(); // paints the tapped value
                                                                              }
                                                                            }),
                                                                          ],
                                                                          defaultRenderer: new charts.BarRendererConfig(
                                                                              cornerStrategy: const charts.ConstCornerStrategy(30),
                                                                              maxBarWidthPx: 20),
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 4,
                                                                                desiredTickCount: 4,
                                                                                dataIsInWholeNumbers: false,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "UNEMPLOYMENT",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      height:
                                                                          220.0,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child: charts
                                                                            .BarChart(
                                                                          region4(),
                                                                          animate:
                                                                              true,
                                                                          behaviors: [
                                                                            charts.LinePointHighlighter(symbolRenderer: Region4SymbolRenderer() // add this line in behaviours
                                                                                )
                                                                          ],
                                                                          selectionModels: [
                                                                            charts.SelectionModelConfig(changedListener:
                                                                                (charts.SelectionModel model) {
                                                                              if (model.hasDatumSelection) {
                                                                                final value = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
                                                                                Region4SymbolRenderer.value = value.toString(); // paints the tapped value
                                                                              }
                                                                            }),
                                                                          ],
                                                                          barGroupingType: charts
                                                                              .BarGroupingType
                                                                              .grouped,
                                                                          defaultRenderer: new charts.BarRendererConfig(
                                                                              cornerStrategy: const charts.ConstCornerStrategy(30),
                                                                              maxBarWidthPx: 20),
                                                                          domainAxis: new charts.OrdinalAxisSpec(
                                                                              renderSpec: new charts.SmallTickRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 10, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                          primaryMeasureAxis: new charts.NumericAxisSpec(
                                                                              tickProviderSpec: charts.BasicNumericTickProviderSpec(
                                                                                desiredMinTickCount: 4,
                                                                                desiredTickCount: 4,
                                                                                dataIsInWholeNumbers: false,
                                                                                zeroBound: true,
                                                                              ),
                                                                              renderSpec: new charts.GridlineRendererSpec(

                                                                                  // Tick and Label styling here.
                                                                                  labelStyle: new charts.TextStyleSpec(
                                                                                      fontSize: 6, // size in Pts.
                                                                                      color: charts.MaterialPalette.black),

                                                                                  // Change the line colors to match text color.
                                                                                  lineStyle: new charts.LineStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.black12)))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "RENTAL VACANCY",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            /////////////////////
                                                            Text(
                                                              "Housing Market",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "Measure of housing supply This Region",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          200,
                                                                      // color: Colors
                                                                      //     .red,
                                                                    ),
                                                                    Positioned(
                                                                      left: 65,
                                                                      child: Image
                                                                          .network(
                                                                        "https://clientdev.tagwebs.in/litpoodle/assets/new/assets/images/housing-lit.png",
                                                                        height:
                                                                            200,
                                                                        width:
                                                                            160,
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      left: 50,
                                                                      child: SfSlider
                                                                          .vertical(
                                                                        min:
                                                                            0.0,
                                                                        max:
                                                                            6.0,
                                                                        value:
                                                                            0,
                                                                        interval:
                                                                            0.1,
                                                                        showTicks:
                                                                            false,
                                                                        showLabels:
                                                                            false,
                                                                        enableTooltip:
                                                                            true,
                                                                        shouldAlwaysShowTooltip:
                                                                            true,
                                                                        tooltipPosition:
                                                                            SliderTooltipPosition.left,
                                                                        minorTicksPerInterval:
                                                                            1,
                                                                        activeColor:
                                                                            Color(0xfff6f6f6),
                                                                        inactiveColor:
                                                                            Color(0xfff7f7f7),
                                                                        onChanged:
                                                                            (dynamic
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            _value1 =
                                                                                0;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      right: 60,
                                                                      child: SfSlider
                                                                          .vertical(
                                                                        min:
                                                                            0.0,
                                                                        max:
                                                                            6.0,
                                                                        value: double.parse(snapshot.data["neighborhood"]["housing-market"]["housing-supply"]
                                                                            [
                                                                            "usa"]),
                                                                        interval:
                                                                            0.1,
                                                                        tooltipPosition:
                                                                            SliderTooltipPosition.right,
                                                                        showTicks:
                                                                            false,
                                                                        showLabels:
                                                                            false,
                                                                        enableTooltip:
                                                                            true,
                                                                        shouldAlwaysShowTooltip:
                                                                            true,
                                                                        minorTicksPerInterval:
                                                                            1,
                                                                        activeColor:
                                                                            Color(0xfff6f6f6),
                                                                        inactiveColor:
                                                                            Color(0xfff7f7f7),
                                                                        onChanged:
                                                                            (dynamic
                                                                                value) {
                                                                          //setState(
                                                                          //     () {
                                                                          //   snapshot.data["neighborhood"]["housing-market"]["housing-supply"]
                                                                          //           [
                                                                          //           "usa"] =
                                                                          //       value;
                                                                          // });
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 30),
                                                            Text(
                                                              "Median Home Price History",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                  height: 300,
                                                                  width: 300,
                                                                  child: SfCartesianChart(
                                                                      trackballBehavior:
                                                                          _trackballBehavior,
                                                                      series: <
                                                                          LineSeries<
                                                                              Crosshairmodel,
                                                                              num>>[
                                                                        LineSeries<
                                                                            Crosshairmodel,
                                                                            num>(
                                                                          dataSource:
                                                                              crosshairgraph,
                                                                          xValueMapper: (Crosshairmodel crosshairmodel, _) =>
                                                                              int.parse(crosshairmodel.year).toInt(),
                                                                          yValueMapper: (Crosshairmodel crosshairmodel, _) =>
                                                                              int.parse(crosshairmodel.value).toInt(),
                                                                        )
                                                                      ])),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),

                                                            // Container(
                                                            //   child: Image
                                                            //       .network(
                                                            //     "https://clientdev.tagwebs.in/litpoodle/assets/new/assets/images/housing-lit.png",
                                                            //     height: 200,
                                                            //     width: 160,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),

                                                        // SingleChildScrollView(
                                                        //   physics:
                                                        //       BouncingScrollPhysics(),
                                                        //   scrollDirection:
                                                        //       Axis.horizontal,
                                                        //   child: Container(
                                                        //     //scrollDirection:Axis.vertical
                                                        //     child: Row(
                                                        //       children: [
                                                        //         region1();
                                                        //         //RegionBargraph(),
                                                        //         // RegionBargraph2(),
                                                        //         // RegionBargraph3(),
                                                        //         // RegionBargraph4(),
                                                        //       ],
                                                        //     ),
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),

                                                  /////////////////////////// Recommendations //////////////////////////
                                                  Container(
                                                    child: Center(
                                                        child: Column(
                                                      children: [
                                                        Text(
                                                          "Other Recommendations",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "RECOMMENDED PROPERTIES FROM OTHER REGIONS",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Here are some Recommended Properties from our Top Region Picks for Real Estate Investing.",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10, 4, 0, 0),
                                                          child: Container(
                                                            // padding: EdgeInsets.symmetric(
                                                            //     horizontal: 8.0, vertical: 10.0),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.32,
                                                            child: ListView
                                                                .builder(
                                                                    physics:
                                                                        BouncingScrollPhysics(),
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    // shrinkWrap: true,
                                                                    itemCount: snapshot
                                                                        .data[
                                                                            "recommended-region-homes"]
                                                                        .length,
                                                                    // gridDelegate:
                                                                    //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                    //         maxCrossAxisExtent: 200,
                                                                    //         childAspectRatio: 0.8,
                                                                    //         crossAxisSpacing: 10,
                                                                    //         mainAxisSpacing: 10),
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                ctx,
                                                                            index) {
                                                                      return InkWell(
                                                                        onTap: () =>
                                                                            Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder:
                                                                                (context) {
                                                                              // return PropertyDetails();
                                                                              return SinglePostProperty(
                                                                                value: Property(propid: snapshot.data["recommended-region-homes"][index]["property_id"]),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Card(
                                                                          elevation:
                                                                              3,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.42,
                                                                            // alignment: Alignment.center,
                                                                            // height: 80,
                                                                            // width: 100,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    child: Container(
                                                                                      // width:
                                                                                      //     MediaQuery.of(context)
                                                                                      //         .size
                                                                                      //         .width,
                                                                                      height: 100,
                                                                                      width: 200,
                                                                                      child: Image.network(
                                                                                        snapshot.data["recommended-region-homes"][index]["images"],
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                                                      child: Text(
                                                                                        snapshot.data["recommended-region-homes"][index]["status"].toString(),
                                                                                        style: TextStyle(
                                                                                          fontSize: 10,
                                                                                          color: Colors.green,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                // Text(
                                                                                //   snapshot.data[
                                                                                //           "recommentations-list"]
                                                                                //           [index]["property_id"]
                                                                                //       .toString(),
                                                                                //   style: TextStyle(
                                                                                //     fontSize: 10,
                                                                                //     color: Colors.green,
                                                                                //   ),
                                                                                // ),

                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.location_on_rounded,
                                                                                        size: 20,
                                                                                        color: iconcolorgrey,
                                                                                      ),
                                                                                      Text(
                                                                                        snapshot.data["recommended-region-homes"][index]["city"].toString(),
                                                                                        style: TextStyle(fontSize: 10),
                                                                                      ),
                                                                                      Spacer(),
                                                                                      Text(
                                                                                        "\$",
                                                                                        style: TextStyle(color: secondarycolor),
                                                                                      ),
                                                                                      Text(
                                                                                        '${oCcy.format(int.parse(snapshot.data["recommended-region-homes"][index]["price"]))}',
                                                                                        style: TextStyle(fontSize: 10, color: secondarycolor),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),

                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Column(
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.bed_rounded,
                                                                                            size: 20,
                                                                                            color: iconcolorgrey,
                                                                                          ),
                                                                                          Text(
                                                                                            snapshot.data["recommended-region-homes"][index]["beds"].toString(),
                                                                                            style: TextStyle(fontSize: 12, color: Colors.grey),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Column(
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.bathroom_rounded,
                                                                                            size: 20,
                                                                                            color: iconcolorgrey,
                                                                                          ),
                                                                                          Text(
                                                                                            snapshot.data["recommended-region-homes"][index]["baths"].toString(),
                                                                                            style: TextStyle(fontSize: 12, color: Colors.grey),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Column(
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.view_array_outlined,
                                                                                            size: 20,
                                                                                            color: iconcolorgrey,
                                                                                          ),
                                                                                          Text(
                                                                                            snapshot.data["recommended-region-homes"][index]["sqft"].toString(),
                                                                                            style: TextStyle(fontSize: 12, color: Colors.grey),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(boxShadow: [
                                                                              new BoxShadow(
                                                                                color: shadowColor,
                                                                                blurRadius: 3,
                                                                              ),
                                                                            ], borderRadius: BorderRadius.circular(10), color: box),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "You could split your investment and buy multiple smaller homes instead of buying one big home.",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          new BoxShadow(
                                                                            color:
                                                                                shadowColor,
                                                                            blurRadius:
                                                                                3,
                                                                          ),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        color:
                                                                            box),
                                                                    child:
                                                                        Container(
                                                                      child: Image
                                                                          .network(
                                                                        "https://www.litpoodle.com/assets/new/assets/img/split.png",
                                                                        height:
                                                                            100,
                                                                        width:
                                                                            100,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ">",
                                                                    style: TextStyle(
                                                                        color:
                                                                            secondarycolor,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          new BoxShadow(
                                                                            color:
                                                                                shadowColor,
                                                                            blurRadius:
                                                                                3,
                                                                          ),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        color:
                                                                            box),
                                                                    child: Image
                                                                        .network(
                                                                      "https://www.litpoodle.com/assets/new/assets/img/big-home-lit.png",
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          100,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      "The reason is, most often the smaller homes have higher returns than bigger properties. Also you get to diversify your portfolio and reduce risk.",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade500),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 25,
                                                                  ),
                                                                  Text(
                                                                    "Litpoodle Idea",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          150,
                                                                      width:
                                                                          150,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            new BoxShadow(
                                                                              color: shadowColor,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              box),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          "https://www.litpoodle.com/assets/new/assets/img/increase.png",
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              80,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Text(
                                                                    "Increase your investment amount !!!",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  //////////////////
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  )
                                                ]))
                                      ],
                                    ),
                                  ),

                                  /////////////////////////////////////////////////////////////////////////////////////

                                  // Image.network(snapshot.data["property-details"]
                                  //     ["general"]["default-image"])
                                ],
                              ),
                            )
                          ],
                        ));
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        color: secondarycolor,
                      ));
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // List<GDPData> getChartData() {
  //   final List<GDPData> chartData = [
  //     GDPData('America', 1600),
  //     GDPData('India', 2490),
  //     GDPData('Africa', 2900),
  //     GDPData('Asia', 23050),
  //     GDPData('Pakistan', 24880),
  //     GDPData('China', 34390),
  //   ];
  //   return chartData;
  // }

  ///////////////////////////////
  List<PieChartSectionData> showingSections() {
    FutureBuilder(
        future: propertycall(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {}
        });
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.orangeAccent[700],
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orangeAccent[100],
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orangeAccent[700],
            value: 8,
            title: '8%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.orangeAccent[200],
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: secondarycolor,
            value: 11,
            title: '11%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.orangeAccent,
            value: 6,
            title: '6%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.orange,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.orangeAccent[200],
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
