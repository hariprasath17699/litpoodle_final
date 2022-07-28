// import 'package:flutter/material.dart';
// import 'package:litpoodle/components/colors.dart';

// class Searchpage extends StatefulWidget {
//   const Searchpage({Key key}) : super(key: key);

//   @override
//   State<Searchpage> createState() => _SearchpageState();
// }

// class _SearchpageState extends State<Searchpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: secondarycolor,
//       ),
//     );
//   }
// }
//////////////////////////////
///
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/bottom/home_welcome.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/screens/scroll_widget_details.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
class Property {
  final String propid;
  String term;
  String usbond;
  String sp500;
  String monthlyHoa;
  double mortageinterest;
  double totalproject;
  double downpayment;
  double closingcost;
  double annualavgprice;
  double annualavgrent;
  double vacancyrate;
  double annualinsurance;
  double annualmaintenance;
  double annualpropertytax;
  double estimmnthrate;
  double pmcommision;
  double usgrowthrate;
  double spgrowthrate;

  Property({
    this.term,
    this.propid,
    this.usbond,
    this.sp500,
    this.monthlyHoa,
    this.mortageinterest,
    this.totalproject,
    this.closingcost,
    this.downpayment,
    this.annualavgprice,
    this.annualavgrent,
    this.vacancyrate,
    this.annualinsurance,
    this.annualmaintenance,
    this.annualpropertytax,
    this.estimmnthrate,
    this.pmcommision,
    this.usgrowthrate,
    this.spgrowthrate,
  });
}

class Searchpage extends StatefulWidget {
  Searchpage({
    Key key,
    this.value,
  }) : super(
          key: key,
        );

  //final String title;
  final Search value;

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final List<String> imgList = [];
  //final  List<String,dynamic> propertyList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Future<Map<String, dynamic>> data;
  @override
  void initState() {
    data = apicall();
    print(widget.value.search);
    super.initState();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    // final List<Widget> imageSliders = imgList
    //     .map((item) => Container(
    //           child: Image.network(
    //             item,
    //           ),
    //         ))
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Results",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          // Text(
          //   'Search Result',
          //   style: TextStyle(color: Colors.white, fontSize: 14.0),
          // ),
          // Text(
          //   widget.value.searchcity,
          //   style: TextStyle(color: Colors.white, fontSize: 16.0),
          // ),
        ],
        backgroundColor: secondarycolor,
        centerTitle: true,
        titleSpacing: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SearchWidget(),
                    Text(
                      widget.value.searchcity,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),

                // FutureBuilder(
                //     future: data,
                //     // ignore: missing_return
                //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                //       if (snapshot.hasData) {
                //         Text(snapshot.data);
                //       }
                //     })
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          },
        ),
        //title: Text("Search"),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Expanded(
                  //   flex: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20),
                  //     child: Column(
                  //         //mainAxisAlignment: MainAxisAlignment.center,
                  //         children: <Widget>[]),
                  //   ),
                  // ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 250),
                        duration: const Duration(milliseconds: 1100),
                        child: GridView.builder(
                            itemCount: snapshot.data["properties"].length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 0.8,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      // return PropertyDetails();
                                      return SinglePostProperty(
                                        value: Property(
                                            propid: snapshot.data["properties"]
                                                [index]["property_id"]),
                                      );
                                    },
                                  ),
                                ),
                                child: Container(
                                  // alignment: Alignment.center,
                                  // height: 80,
                                  // width: 100,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 4, 4, 4),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              snapshot.data["properties"][index]
                                                  ["image"],
                                              fit: BoxFit.cover,
                                              repeat: ImageRepeat.noRepeat,
                                              height: 100,
                                              width: 200,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Text(snapshot.data["properties"][index]
                                      //     ["property_id"]),

                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.home,
                                              size: 16,
                                              color: iconcolorgrey,
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              snapshot.data["properties"][index]
                                                      ["type"]
                                                  .toString()
                                                  .replaceAll("_", " "),
                                              // .toLowerCase(),
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              snapshot.data["properties"][index]
                                                      ["status"]
                                                  .toString()
                                                  .replaceAll("_", " "),
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              size: 14,
                                              color: iconcolorgrey,
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              snapshot.data["properties"][index]
                                                      ["city"]
                                                  .toString(),
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Spacer(),
                                            Text(
                                              "\$",
                                              style: TextStyle(
                                                  color: secondarycolor),
                                            ),
                                            Text(
                                              '${oCcy.format(int.parse(snapshot.data["properties"][index]["price"].toString()))}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: secondarycolor),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.bed_rounded,
                                                  size: 20,
                                                  color: iconcolorgrey,
                                                ),
                                                Text(
                                                  snapshot.data["properties"]
                                                          [index]["bed"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: iconcolorgrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    Icon(
                                                      Icons.bathroom_rounded,
                                                      size: 20,
                                                      color: iconcolorgrey,
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data["properties"]
                                                              [index]["bath"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: iconcolorgrey),
                                                    ),
                                                  ],
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
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data["properties"]
                                                              [index]["size"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: iconcolorgrey),
                                                    ),
                                                    // Text(
                                                    //   snapshot.data["properties"]
                                                    //           [index]["unit"]
                                                    //       .toString(),
                                                    //   style: TextStyle(
                                                    //       fontSize: 12,
                                                    //       color: Colors.grey),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       const Text("Price:"),
                                      //       Text(snapshot.data["properties"][index]
                                      //               ["price"]
                                      //           .toString()),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Row(
                                      //     children: [
                                      //       Expanded(
                                      //         flex: 1,
                                      //         child: Padding(
                                      //           padding: const EdgeInsets.all(5.0),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.center,
                                      //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //             children: [
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                         right: 3.0),
                                      //                 child: const Text("Beds:"),
                                      //               ),
                                      //               Text(snapshot.data["properties"]
                                      //                       [index]["bed"]
                                      //                   .toString()),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       Expanded(
                                      //         flex: 1,
                                      //         child: Padding(
                                      //           padding: const EdgeInsets.all(5.0),
                                      //           child: Row(
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment.center,
                                      //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //             children: [
                                      //               const Padding(
                                      //                 padding: EdgeInsets.only(
                                      //                     right: 3.0),
                                      //                 child: Text("Baths:"),
                                      //               ),
                                      //               Text(snapshot.data["properties"]
                                      //                       [index]["bath"]
                                      //                   .toString()),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(6.0),
                                      //     child: Row(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,

                                      //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //       children: [
                                      //         const Padding(
                                      //           padding:
                                      //               EdgeInsets.only(right: 3.0),
                                      //           child: Text("City:"),
                                      //         ),
                                      //         Text(snapshot.data["properties"]
                                      //             [index]["city"]),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                ),
                              );
                              //   decoration: BoxDecoration(
                              //       border: Border.all(),
                              //       // color: Colors.amber,
                              //       borderRadius: BorderRadius.circular(15)),
                              // );
                            }),
                      ),
                    ),
                  )
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
        },
      ),
    );
  }

  Future<Map<String, dynamic>> apicall() async {
    String searchtxt = widget.value.search;
    print(widget.value.search.toString());

    print("yes $searchtxt");
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=r6uv0s7l1v7gdr8bkutoe1o6ug9tv671'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '$domain_url/api/search/search_homes/$searchtxt/old_age/mx_sq/2/low_val/mi_lot/type_first/type_second/type_third/type_forth/type_fifth/2/high_val/mi_sq/new_age/mx_lot/construction/amifirst/amisecond/amithird/amifour/amifive/amisix/force/pending/type_sixth/ZIP'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("$result");
      // print(result["data"]["banner"].length);
      // print(result["data"]["banner"][0]);
      // for (int i = 0; i < result["data"]["banner"].length; i++) {
      //   imgList.add(result["data"]["banner"][i]["images"]);
      // }
      // print(imgList);
      print(result["data"]["properties"].length);
      print(result["data"]["properties"]);
      for (int i = 0; i < result["data"]["properties"].length; i++) {
        // result['data']['properties'].forEach((key, value) => propertyList.add(value));
        // propertyList.addAll(result["data"]["properties"][i]);
      }
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["data"];
  }

  // Widget buildImage(String urlImage, int index) => Container(
  //       child: Image.network(
  //         urlImage,
  //         fit: BoxFit.contain,
  //       ),
  //     );
}
