// import 'package:flutter/material.dart';

// class ProperyDashBoardPage extends StatefulWidget {
//   const ProperyDashBoardPage({Key key}) : super(key: key);

//   @override
//   State<ProperyDashBoardPage> createState() => _ProperyDashBoardPageState();
// }

// class _ProperyDashBoardPageState extends State<ProperyDashBoardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Propert Dashboard page "),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/models/graph_model/poodle%20graph.dart';
import 'package:litpoodle/models/graph_model/property_dashboard_models/currenthomemodel.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/bottom/buylist_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class Buylistcitytab {
  final String city;
  final String city20;

  const Buylistcitytab({
    this.city,
    this.city20,
  });
}

class ProperyDashBoardPage extends StatefulWidget {
  const ProperyDashBoardPage({Key key}) : super(key: key);

  @override
  State<ProperyDashBoardPage> createState() => _ProperyDashBoardPageState();
}

class _ProperyDashBoardPageState extends State<ProperyDashBoardPage> {
  int _currentStep = 0;
  List<Currenthomevaluemodel> currenthomegraph = [];
  // Initial Selected Value
  String dropdownvalue = '2022';
  String dropdownvaluefrom = '2022';
  String dropdownvalueto = '2022';
  String dropdownvalue1 = 'Net Cashflow';
  String dropdownvalue2 = 'July';
  String dropdownvalue3 = 'July';

  // List of items in our dropdown menu
  var items = [
    '2020',
    '2021',
    '2022',
  ];
  var from = [
    '2020',
    '2021',
    '2022',
  ];
  var to = [
    '2020',
    '2021',
    '2022',
  ];
  var items1 = [
    'Net Cashflow',
    'HOA',
    'Insurance',
    'Maintenance',
    'Property Tax',
    'PM Fees',
    'Utilities',
    'Other Expenses',
    'Mortgage Payment Principal',
    'Mortgage Payment Interest',
  ];
  var month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  var month1 = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
/////////////////////////////////////////////////////////

  ///////////////////  BuyList  /////////////////////////////
  Future<Map<String, dynamic>> buylistcall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://clientdev.tagwebs.in/litpoodle/api/user/user/investment/LIT3557912800'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    final tempdata = json.decode(response.body)['result']["investment"]["graph"]
        ["current-home-value"];
    final data = tempdata
        .map<Currenthomevaluemodel>(
            (e) => Currenthomevaluemodel(year: e['year'], value: e['value']))
        .toList();
    currenthomegraph = data;
    if (response.statusCode == 200) {
      print("result");
      print(currenthomegraph);
      //print("propid:$propertyid");
      // for (int i = 0; i < result["result"]["cites-list"]["city"].length; i++);
      // print(result["result"]["cites-list"]["city"]);

      // print(result["result"]["cites-list"]["city"].length);
      // print(result["result"]["cites-list"]["city"][0]);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          },
        ),
        backgroundColor: bgColor,
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Property Dashboard",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
            ),
            NotificationIcon(),
          ],
        ),
        // title: Text(
        //   "Buylist",
        //   style: TextStyle(
        //       color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        // ),
      ),
      body: FutureBuilder(
        future: buylistcall(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  height: 40,
                                  // width: 25,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child:
                                        Text("7117 Foch Rd, New Orleans, LA"),
                                  ))),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  height: 40,
                                  // width: 25,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("289 Avenue S, Brooklyn, NY"),
                                  ))),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  height: 40,
                                  // width: 25,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("2054 77th St, Brooklyn, NY"),
                                  ))),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  height: 40,
                                  // width: 25,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                        "155-44 Linden Blvd, Brooklyn, NY"),
                                  ))),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  height: 40,
                                  // width: 25,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("1951 77th St, Brooklyn, NY"),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        color: secondarycolor, fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: dropdownvalue1,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              menuMaxHeight: 250,
                              // Array list of items
                              items: items1.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        color: secondarycolor, fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownvalue1 = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 150.0),
                    DefaultTabController(
                      length: 3, // length of tabs
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              isScrollable: true,
                              labelColor: secondarycolor,
                              unselectedLabelColor: Colors.black,
                              indicatorColor: secondarycolor,
                              tabs: [
                                Tab(text: 'Property Manager'),
                                Tab(text: 'Cash Flow'),
                                Tab(text: 'Investment Performance'),
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height *
                                  1, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  child: Center(
                                    child: Text('',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text("From"),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Text("To"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  // Initial Value
                                                  value: dropdownvalue2,

                                                  // Down Arrow Icon
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                  menuMaxHeight: 250,
                                                  // Array list of items
                                                  items: month1
                                                      .map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(
                                                        items,
                                                        style: TextStyle(
                                                            color:
                                                                secondarycolor,
                                                            fontSize: 12),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // After selecting the desired option,it will
                                                  // change button value to selected value
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      dropdownvalue2 = newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  // Initial Value
                                                  value: dropdownvaluefrom,

                                                  // Down Arrow Icon
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),

                                                  // Array list of items
                                                  items:
                                                      from.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(
                                                        items,
                                                        style: TextStyle(
                                                            color:
                                                                secondarycolor,
                                                            fontSize: 12),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // After selecting the desired option,it will
                                                  // change button value to selected value
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      dropdownvaluefrom =
                                                          newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  // Initial Value
                                                  value: dropdownvalue3,

                                                  // Down Arrow Icon
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                  menuMaxHeight: 250,
                                                  // Array list of items
                                                  items:
                                                      month.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(
                                                        items,
                                                        style: TextStyle(
                                                            color:
                                                                secondarycolor,
                                                            fontSize: 12),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // After selecting the desired option,it will
                                                  // change button value to selected value
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      dropdownvalue3 = newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  // Initial Value
                                                  value: dropdownvalueto,

                                                  // Down Arrow Icon
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),

                                                  // Array list of items
                                                  items:
                                                      from.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(
                                                        items,
                                                        style: TextStyle(
                                                            color:
                                                                secondarycolor,
                                                            fontSize: 12),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // After selecting the desired option,it will
                                                  // change button value to selected value
                                                  onChanged: (String newValue) {
                                                    setState(() {
                                                      dropdownvalueto =
                                                          newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text('HOA',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('Insurance',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('Maintenance',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('Property Tax',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('PM Fees',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('Utilities',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('Other Expenses',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      'Mortgage Payment Principal',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      'Mortgage Payment Interest',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Column(
                                                children: [
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text('0',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Purchase Price",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text("\$",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Text(
                                                            '${oCcy.format(int.parse(snapshot.data["investment"]["purchase-price"]))}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Investment",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text("\$",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Text(
                                                            '${oCcy.format(snapshot.data["investment"]["investment"])}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                      //////
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: box),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    "https://clientdev.tagwebs.in/litpoodle/assets/user/img/pig.jpg",
                                                    height: 75,
                                                  ),
                                                  Text(
                                                      '${oCcy.format(snapshot.data["investment"]["investment"])}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: box),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    "https://clientdev.tagwebs.in/litpoodle/assets/user/img/savings.jpg",
                                                    height: 75,
                                                  ),
                                                  Text(
                                                      '${oCcy.format(snapshot.data["investment"]["total-return"])}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: box),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    "https://clientdev.tagwebs.in/litpoodle/assets/user/img/growth.jpg",
                                                    height: 75,
                                                  ),
                                                  Text(
                                                      '${oCcy.format(snapshot.data["investment"]["annual-growth-rate"])}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 300,
                                            width: 300,
                                            child: SfCartesianChart(
                                                // trackballBehavior:
                                                //     _trackballBehavior,
                                                series: <
                                                    LineSeries<
                                                        Currenthomevaluemodel,
                                                        String>>[
                                                  LineSeries<
                                                          Currenthomevaluemodel,
                                                          String>(
                                                      dataSource:
                                                          currenthomegraph,
                                                      xValueMapper: (Currenthomevaluemodel
                                                                  currenthomevaluemodel,
                                                              _) =>
                                                          currenthomevaluemodel
                                                              .year
                                                              .toString(),
                                                      yValueMapper: (Currenthomevaluemodel
                                                                  currenthomevaluemodel,
                                                              _) =>
                                                          currenthomevaluemodel.value ==
                                                                  int.parse(currenthomevaluemodel.value)
                                                                      .toInt()
                                                              ? int.parse(currenthomevaluemodel.value)
                                                                  .toInt()
                                                              : currenthomevaluemodel.value)
                                                ])),
                                      ),

                                      ///////////////
                                      // Card(
                                      //   shadowColor: shadowColor,
                                      //   elevation: 4,
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(15.0),
                                      //   ),
                                      //   child: Theme(
                                      //     data: Theme.of(context).copyWith(
                                      //         dividerColor: Colors.transparent),
                                      //     child: ExpansionTile(
                                      //       initiallyExpanded: false,
                                      //       //onExpansionChanged: ,
                                      //       textColor: secondarycolor,
                                      //       iconColor: secondarycolor,
                                      //       title: Row(
                                      //         children: [
                                      //           // Text(
                                      //           //   "05",
                                      //           //   // style: TextStyle(color: Colors.grey),
                                      //           // ),
                                      //           // SizedBox(
                                      //           //   width: 15,
                                      //           // ),
                                      //           // Icon(
                                      //           //   Icons.favorite_outline,
                                      //           //   color: secondarycolor,
                                      //           // ),
                                      //           SizedBox(
                                      //             width: 15,
                                      //           ),
                                      //           Text(
                                      //             "Current Home Value",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       children: <Widget>[
                                      //         Padding(
                                      //           padding:
                                      //               const EdgeInsets.fromLTRB(
                                      //                   0, 0, 0, 10),
                                      //           child: charts.BarChart(
                                      //             currentgraph(),
                                      //             // vertical:
                                      //             //     false,
                                      //             animate: true,
                                      //             behaviors: [
                                      //               charts.LinePointHighlighter(
                                      //                   symbolRenderer:
                                      //                       Region2CircleSymbolRenderer() // add this line in behaviours

                                      //                   )
                                      //             ],
                                      //             selectionModels: [
                                      //               charts.SelectionModelConfig(
                                      //                   changedListener: (charts
                                      //                           .SelectionModel
                                      //                       model) {
                                      //                 if (model
                                      //                     .hasDatumSelection) {
                                      //                   final value = model
                                      //                       .selectedSeries[0]
                                      //                       .measureFn(model
                                      //                           .selectedDatum[
                                      //                               0]
                                      //                           .index);
                                      //                   Region2CircleSymbolRenderer
                                      //                           .value =
                                      //                       value
                                      //                           .toString(); // paints the tapped value
                                      //                 }
                                      //               }),
                                      //             ],
                                      //             defaultRenderer:
                                      //                 new charts
                                      //                         .BarRendererConfig(
                                      //                     cornerStrategy:
                                      //                         const charts
                                      //                             .ConstCornerStrategy(30),
                                      //                     maxBarWidthPx: 20),
                                      //             domainAxis: new charts
                                      //                     .OrdinalAxisSpec(
                                      //                 renderSpec: new charts
                                      //                         .SmallTickRendererSpec(

                                      //                     // Tick and Label styling here.
                                      //                     labelStyle: new charts
                                      //                             .TextStyleSpec(
                                      //                         fontSize:
                                      //                             10, // size in Pts.
                                      //                         color: charts
                                      //                             .MaterialPalette
                                      //                             .black),

                                      //                     // Change the line colors to match text color.
                                      //                     lineStyle: new charts
                                      //                             .LineStyleSpec(
                                      //                         color: charts
                                      //                                 .ColorUtil
                                      //                             .fromDartColor(
                                      //                                 Colors
                                      //                                     .black12)))),
                                      //             primaryMeasureAxis: new charts
                                      //                     .NumericAxisSpec(
                                      //                 tickProviderSpec: charts
                                      //                     .BasicNumericTickProviderSpec(
                                      //                   desiredMinTickCount: 4,
                                      //                   desiredTickCount: 4,
                                      //                   dataIsInWholeNumbers:
                                      //                       false,
                                      //                   zeroBound: true,
                                      //                 ),
                                      //                 renderSpec: new charts
                                      //                         .GridlineRendererSpec(

                                      //                     // Tick and Label styling here.
                                      //                     labelStyle: new charts
                                      //                             .TextStyleSpec(
                                      //                         fontSize:
                                      //                             6, // size in Pts.
                                      //                         color: charts
                                      //                             .MaterialPalette
                                      //                             .black),

                                      //                     // Change the line colors to match text color.
                                      //                     lineStyle: new charts
                                      //                             .LineStyleSpec(
                                      //                         color: charts
                                      //                                 .ColorUtil
                                      //                             .fromDartColor(
                                      //                                 Colors
                                      //                                     .black12)))),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            Center(
              child: Text("Some Thing Went Wrong"),
            );
          }
          return SizedBox(
            height: 100,
            child: Center(
                child: CircularProgressIndicator(
              color: secondarycolor,
            )),
          );
        },
      ),
    );
  }
}
