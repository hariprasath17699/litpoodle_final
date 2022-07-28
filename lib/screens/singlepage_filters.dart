import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';
import 'package:litpoodle/screens/scroll_widget_details.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SinglePageFilters extends StatefulWidget {
  // Property value;
  SingleFilterPropId value;
  SinglePageFilters({Key key, this.value}) : super(key: key);

  @override
  State<SinglePageFilters> createState() => _SinglePageFiltersState();
}

// _ItemDetailState({Key key, @required this.item}) {
//     this.margin = ((item.listPrice - item.stdUnitCost)/item.listPrice)*100;
//   }
class _SinglePageFiltersState extends State<SinglePageFilters> {
  TextEditingController usbond = TextEditingController();
  TextEditingController sp500 = TextEditingController();
  TextEditingController monthHoacontroller = TextEditingController();
  SingleFilterPropId singleFilterPropId = SingleFilterPropId();
  String _mySelection;
  List data = List();
  String dropdownvalue = '30';

  // List of items in our dropdown menu
  var items = [
    '10',
    '15',
    '20',
    '30',
  ];
  void initState() {
    super.initState();
    propertycall();
    var propid = widget.value.propid;
    print("proid id $propid");
  }

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
      'mor_int_rate': '',
      'term_year': '',
      'tot_project': '',
      'downpayment': '',
      'clo_cost': '',
      'ann_ave_price_incr': '',
      'ann_ave_rent_incr': '',
      'ann_vac_rate': '',
      'ann_insur': '',
      'ann_main': '',
      'ann_pro_tax': '',
      'month_hoa': '',
      'est_mon_rent': '',
      'pm_com_value': '',
      'usbonds_5_text': '',
      'usbonds_5_percent': '',
      's_p_9_text': '',
      's_p_9_percent': ''
    });
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    var resbody = json.decode(response.body);
    var mortage = widget.value.value1;
    Map<String, dynamic> map = json.decode(response.body);
    // List<dynamic> data1 = map["set-parameters"]["term_year"]["term"];
    // print("value is $data1");
    //setState(() {
    //data = data1;
    // data = jsonDecode(response.body)["result"]["set-parameters"]["term_year"]
    //     ["term"];
    // });
    if (response.statusCode == 200) {
      print("result");
      print(usbond.text);
      // listResponse = result["result"] as List<dynamic>;
      // setState(() {
      //   statesList = result["result"]["set-parameters"]["term_year"]["term"];
      // });
      //print("propid:$propertyid");
      for (int i = 0;
          i < result["result"]["property-details"]["general"].length;
          i++);
      print(result["result"]["property-details"]["general"]);

      print(result["result"]["property-details"]["gallery"].length);
      print(result["result"]["property-details"]["gallery"][0]);

      // for (int i = 0;
      //     i < result["result"]["property-details"]["gallery"].length;
      //     i++) {
      //   imgList
      //       .add(result["result"]["property-details"]["gallery"][i]["photo"]);
      // }
      // print(imgList);
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

  double mortage = null;
  double totalproject = null;
  double downpayment = null;
  double closingcost = null;
  double annualavgprice = null;
  double annualavgrent = null;
  double vacancyrate = null;
  double annualinsurance = null;
  double annualmaintenance = null;
  double annualpropertytax = null;

  double estimmnthrate = null;
  double pmcommision = null;
  double usgrowthrate = null;
  double spgrowthrate = null;

  List listResponse;

//String id = widget.value.value1;
  @override
  Widget build(BuildContext context) {
    String propid = widget.value.propid;

    /// Widget _filtersinglepagepopup(BuildContext context) {
    ///
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: Text("Filters"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: propertycall(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///////////////////////////////////////////////////////
                                      Text(
                                        'Term(Year):',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          DropdownButtonHideUnderline(
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color: shadowColor,
                                                      blurRadius: 2,
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: DropdownButton(
                                                // Initial Value
                                                value: dropdownvalue,
                                                // menuMaxHeight: 180,

                                                // Down Arrow Icon
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),

                                                // Array list of items
                                                items:
                                                    items.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                          child: Text(items)),
                                                    ),
                                                  );
                                                }).toList(),
                                                // After selecting the desired option,it will
                                                // change button value to selected value
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    dropdownvalue = newValue;
                                                    print(dropdownvalue);
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Mortgage Interest rate (%)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        children: [
                                          SfSlider(
                                            shouldAlwaysShowTooltip: true,

                                            activeColor: secondarycolor,

                                            min: snapshot.data["set-parameters"]
                                                    ["mortgage_interest_rate"]
                                                ["min_value"],
                                            max: snapshot.data["set-parameters"]
                                                    ["mortgage_interest_rate"]
                                                ["max_value"],
                                            value: mortage ??
                                                snapshot.data["set-parameters"][
                                                        "mortgage_interest_rate"]
                                                    ["default_value"],
                                            interval: snapshot
                                                        .data["set-parameters"]
                                                    ["mortgage_interest_rate"]
                                                ["steps_value"],
                                            showTicks: false,
                                            showLabels: false,
                                            enableTooltip: true,
                                            numberFormat: NumberFormat(),
                                            // minorTicksPerInterval: 1,
                                            onChanged: (new_value) {
                                              setState(() {
                                                mortage = new_value;
                                                print(
                                                    "motage value is $mortage");
                                              });
                                            },
                                          ),
                                        ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Project (\$)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
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
                                        value: totalproject ??
                                            double.parse(
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
                                            totalproject = value;
                                            // Navigator.of(context).pop();
                                            // _filtersinglepagepopup(context);
                                          });
                                        },
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: downpayment ??
                                                double.parse(
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
                                                downpayment = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: closingcost ??
                                                double.parse(
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
                                                closingcost = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: annualavgprice ??
                                                double.parse(
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
                                                annualavgprice = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: annualavgrent ??
                                                double.parse(
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
                                                annualavgrent = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: vacancyrate ??
                                                double.parse(
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
                                                vacancyrate = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: annualinsurance ??
                                                double.parse(
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
                                                annualinsurance = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: annualmaintenance ??
                                                double.parse(
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
                                                annualmaintenance = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: annualpropertytax ??
                                                double.parse(
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
                                                annualpropertytax = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Monthly HOA',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                              height: 40,
                                              width: 300,
                                              child: TextFormField(
                                                //focusNode: fieldFocusNode,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: monthHoacontroller,
                                                //controller: usbond,
                                                // (home: token != '' ? BottomNavScreen() : MyApp()));
                                                // controller: TextEditingController
                                                //     .fromValue(TextEditingValue(
                                                //             text: snapshot.data[
                                                //                         "set-parameters"]
                                                //                     ["S_P_500"]
                                                //                 ["label"]) ??
                                                //         sp500),

                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: searchtext.text),
                                                // ),
                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: null ?? searchtext.text),
                                                // ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                  hintText: snapshot.data[
                                                              "set-parameters"]
                                                          ["month_hoa"]
                                                      ["default_value"],
                                                  // hintText:
                                                  //     '  City, State or Zipcode',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                  errorStyle: const TextStyle(
                                                      fontSize: 0.1),
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .grey[300]),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  shadowColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: estimmnthrate ??
                                                double.parse(
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
                                                estimmnthrate = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: pmcommision ??
                                                double.parse(
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
                                                pmcommision = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          "Compare this home to other investment opportunities. See below, your investment today could be worth.",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                              height: 40,
                                              width: 300,
                                              child: TextFormField(
                                                //focusNode: fieldFocusNode,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: usbond,

                                                // (home: token != '' ? BottomNavScreen() : MyApp()));
                                                // controller: TextEditingController
                                                //     .fromValue(TextEditingValue(
                                                //             text: snapshot.data[
                                                //                         "set-parameters"]
                                                //                     ["us_bonds"]
                                                //                 ["label"]) ??
                                                //         usbond),
                                                // controller: TextEditingController
                                                //     .fromValue(TextEditingValue(
                                                //             text: snapshot.data[
                                                //                         "set-parameters"]
                                                //                     ["us_bonds"]
                                                //                 ["label"]) ??
                                                //         usbond),

                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: searchtext.text),
                                                // ),
                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: null ?? searchtext.text),
                                                // ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                  hintText: snapshot.data[
                                                          "set-parameters"]
                                                      ["us_bonds"]["label"],
                                                  // hintText:
                                                  //     '  City, State or Zipcode',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                  errorStyle: const TextStyle(
                                                      fontSize: 0.1),
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .grey[300]),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  shadowColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: usgrowthrate ??
                                                double.parse(
                                                        '${snapshot.data["set-parameters"]["us_bonds"]["percent"]}')
                                                    .toDouble(),
                                            interval: double.parse(
                                                '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                            showTicks: false,
                                            showLabels: false,
                                            enableTooltip: true,
                                            minorTicksPerInterval: 1,
                                            onChanged: (dynamic value) {
                                              setState(() {
                                                usgrowthrate = value;
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
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: sp500,
                                                //controller: usbond,
                                                // (home: token != '' ? BottomNavScreen() : MyApp()));
                                                // controller: TextEditingController
                                                //     .fromValue(TextEditingValue(
                                                //             text: snapshot.data[
                                                //                         "set-parameters"]
                                                //                     ["S_P_500"]
                                                //                 ["label"]) ??
                                                //         sp500),

                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: searchtext.text),
                                                // ),
                                                // controller: TextEditingController.fromValue(
                                                //   TextEditingValue(text: null ?? searchtext.text),
                                                // ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                  hintText: snapshot.data[
                                                          "set-parameters"]
                                                      ["S_P_500"]["label"],
                                                  // hintText:
                                                  //     '  City, State or Zipcode',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                  errorStyle: const TextStyle(
                                                      fontSize: 0.1),
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .grey[300]),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  shadowColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            value: spgrowthrate ??
                                                double.parse(
                                                        '${snapshot.data["set-parameters"]["S_P_500"]["percent"]}')
                                                    .toDouble(),
                                            interval: double.parse(
                                                '${snapshot.data["set-parameters"]["closing_cost"]["steps_value"]}'),
                                            showTicks: false,
                                            showLabels: false,
                                            enableTooltip: true,
                                            minorTicksPerInterval: 1,
                                            onChanged: (dynamic value) {
                                              setState(() {
                                                spgrowthrate = value;
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                        child: Text("Reset")),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          // return PropertyDetails();
                                                          return SinglePostProperty(
                                                            value: Property(
                                                              propid: propid,
                                                              term:
                                                                  dropdownvalue,
                                                              usbond:
                                                                  usbond.text,
                                                              sp500: sp500.text,
                                                              monthlyHoa:
                                                                  monthHoacontroller
                                                                      .text,

                                                              mortageinterest:
                                                                  mortage,
                                                              // totalproject:
                                                              //     totalproject
                                                              //         .toDouble(),
                                                              downpayment:
                                                                  downpayment,
                                                              closingcost:
                                                                  closingcost,
                                                              annualavgprice:
                                                                  annualavgprice,
                                                              annualavgrent:
                                                                  annualavgrent,
                                                              vacancyrate:
                                                                  vacancyrate,
                                                              annualinsurance:
                                                                  annualinsurance,
                                                              // annualmaintenance:
                                                              //     annualmaintenance,
                                                              annualpropertytax:
                                                                  annualpropertytax,
                                                              estimmnthrate:
                                                                  estimmnthrate,
                                                              // pmcommision:
                                                              //     pmcommision,
                                                              usgrowthrate:
                                                                  usgrowthrate,
                                                              spgrowthrate:
                                                                  spgrowthrate,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    // onTap: () {
                                                    //   Navigator.pop(
                                                    //       context, usbond,);
                                                    //   // propertycall();
                                                    //   // Navigator.pop(
                                                    //   //     context, mortgage);
                                                    // },
                                                    child: Container(
                                                      height: 50,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            new BoxShadow(
                                                              color:
                                                                  shadowColor,
                                                              blurRadius: 5,
                                                            ),
                                                          ],
                                                          color: secondarycolor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                          child: Text(
                                                        "Apply",
                                                        style: TextStyle(
                                                            color: white),
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
                  })
            ],
          ),
        ),
      ),
    );

    // actions: <Widget>[
    //   new FlatButton(
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //     textColor: Theme.of(context).primaryColor,
    //     child: const Text('Close'),
    //   ),
    // ],
  }
}
