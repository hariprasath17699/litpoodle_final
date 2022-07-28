import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/choose_city_buylist.dart';
import 'package:litpoodle/screens/buylist/buying_status_tracker.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';

class Buylistproperty {
  final String propid;
  final String city;

  const Buylistproperty({
    this.propid,
    this.city,
  });
}

class BuyListScreen extends StatefulWidget {
  final Buylistcitytab value;
  const BuyListScreen({Key key, this.value}) : super(key: key);

  @override
  State<BuyListScreen> createState() => _BuyListScreenState();
}

class _BuyListScreenState extends State<BuyListScreen> {
/////////////////////////////////////////////////////////

  ///////////////////  BuyList  /////////////////////////////
  Future<Map<String, dynamic>> buylistcall() async {
    String city = widget.value.city20;
    print(city);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET', Uri.parse('$domain_url/api/user/auth/buylist/$city'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      //print("propid:$propertyid");
      for (int i = 0; i < result["result"]["cites-list"]["city"].length; i++);
      print(result["result"]["cites-list"]["city"]);

      print(result["result"]["cites-list"]["city"].length);
      print(result["result"]["cites-list"]["city"][0]);
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
        backgroundColor: bgColor,
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Buylist",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 110,
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
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' ${widget.value.city}',
                            //  "My Wishlist",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      //   child: Text(
                      //     "Cities",
                      //     style: TextStyle(
                      //         color: Colors.black, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 60,
                      //   child: ListView.builder(
                      //     physics: BouncingScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: snapshot.data["cites-list"]["city"].length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (BuildContext ctx, index) {
                      //       return Padding(
                      //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      //         child: Column(
                      //           children: [
                      //             Container(
                      //               height: 40,
                      //               //width: 40,
                      //               decoration: BoxDecoration(
                      //                   // boxShadow: [
                      //                   //   new BoxShadow(
                      //                   //     color: shadowColor,
                      //                   //     blurRadius: 3,
                      //                   //   ),
                      //                   // ],
                      //                   borderRadius: BorderRadius.circular(15),
                      //                   //color: box
                      //                   border: Border.all(
                      //                       color: Colors.grey[400])),
                      //               child: Center(
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.fromLTRB(
                      //                       10, 0, 10, 0),
                      //                   child: Text(
                      //                     snapshot.data["cites-list"]["city"]
                      //                             [index]
                      //                         .toString(),
                      //                     style: TextStyle(
                      //                         fontSize: 11,
                      //                         fontWeight: FontWeight.w700),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "In Progress",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Container(
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 0.0, vertical: 10.0),
                          height: MediaQuery.of(context).size.height * 0.32,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              itemCount: snapshot
                                  .data["buylist"]["going-buylist"].length,
                              // gridDelegate:
                              //     const SliverGridDelegateWithMaxCrossAxisExtent(
                              //         maxCrossAxisExtent: 200,
                              //         childAspectRatio: 0.8,
                              //         crossAxisSpacing: 10,
                              //         mainAxisSpacing: 10),
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      // height: 300,
                                      width: 200,
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.42,
                                      // alignment: Alignment.center,
                                      // height: 80,
                                      // width: 100,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 4, 4, 4),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                snapshot.data["buylist"]
                                                        ["going-buylist"][index]
                                                    ["property-image"],

                                                // SvgPicture.network(
                                                //   snapshot.data["buylist"][
                                                //               "going-buylist"]
                                                //           [index]
                                                //       ["property-image"],
                                                //   semanticsLabel: 'poodle',
                                                //   placeholderBuilder: (BuildContext
                                                //           context) =>
                                                //       Container(
                                                //           padding:
                                                //               const EdgeInsets
                                                //                       .all(
                                                //                   30.0),
                                                //           child:
                                                //               const CircularProgressIndicator()),
                                                // ),
                                                fit: BoxFit.fitWidth,
                                                height: 100,
                                                width: 200,
                                              ),
                                            ),
                                          ),

                                          // Text(
                                          //   snapshot.data["buylist"]
                                          //           ["going-buylist"][index]
                                          //           ["property-id"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //     fontSize: 10,
                                          //     color: Colors.green,
                                          //   ),
                                          // ),

                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                    //children: [
                                                    //     Icon(
                                                    //       Icons.home,
                                                    //       size: 14,
                                                    //       color: Colors.grey,
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                    // Text(
                                                    //   snapshot.data["buylist"]
                                                    //           ["going-buylist"]
                                                    //           [index]["type"]
                                                    //       .toString(),
                                                    //   style:
                                                    //       TextStyle(fontSize: 10),
                                                    ),
                                                // Spacer(),
                                                Text(
                                                  "\$",
                                                  style: TextStyle(
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data["buylist"][
                                                                  "going-buylist"]
                                                              [
                                                              index]["price"] ==
                                                          "--"
                                                      ? "--"
                                                      : '${oCcy.format(int.parse(snapshot.data["buylist"]["going-buylist"][index]["price"]))}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bed_rounded,
                                                      size: 20,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data["buylist"]
                                                              ["going-buylist"]
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
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bathroom_rounded,
                                                      size: 20,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data["buylist"]
                                                              ["going-buylist"]
                                                              [index]["bath"]
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
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.view_array_outlined,
                                                      size: 20,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data["buylist"]
                                                              ["going-buylist"]
                                                              [index]["sqft"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: iconcolorgrey),
                                                    ),
                                                  ],
                                                ),
                                                // Icon(
                                                //   Icons.view_array_outlined,
                                                //   size: 16,
                                                //   color: Colors.grey,
                                                // ),
                                                // Text(
                                                //   snapshot.data[
                                                //           "recommentations-list"]
                                                //           [index]["size"]
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 10,
                                                //       color: Colors.grey),
                                                // ),
                                                // Text(
                                                //   snapshot.data[
                                                //           "recommentations-list"]
                                                //           [index]["unit"]
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 10,
                                                //       color: Colors.grey),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BuyingStatusTracker(
                                                              value: Buylistproperty(
                                                                  propid: snapshot.data["buylist"]
                                                                              ["going-buylist"]
                                                                          [index]
                                                                      [
                                                                      "property-id"],
                                                                  city: snapshot
                                                                      .data[
                                                                          "buylist"]
                                                                          ["going-buylist"]
                                                                          [index]
                                                                          ["slug-region"]
                                                                      .toString()
                                                                  // .replaceAll(
                                                                  //     ',',
                                                                  //     '/')
                                                                  // .replaceAll(
                                                                  //     " ",
                                                                  //     "%20"),
                                                                  ),
                                                            )),
                                                  );
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 180,
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
                                                      color: secondarycolor),
                                                  child: Center(
                                                    child: Text(
                                                      "Buying Status Tracker",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
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
                                    ),
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
                    ],
                  ),
                  ////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Owned",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 8.0, vertical: 10.0),
                          height: MediaQuery.of(context).size.height * 0.32,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              itemCount: snapshot
                                  .data["buylist"]["complete-buylist"].length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      // height: 300,
                                      width: 200,
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.42,
                                      // alignment: Alignment.center,
                                      // height: 80,
                                      // width: 100,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 4, 4, 4),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                snapshot.data["buylist"]
                                                        ["complete-buylist"]
                                                    [index]["property-image"],

                                                // SvgPicture.network(
                                                //   snapshot.data["buylist"][
                                                //               "going-buylist"]
                                                //           [index]
                                                //       ["property-image"],
                                                //   semanticsLabel: 'poodle',
                                                //   placeholderBuilder: (BuildContext
                                                //           context) =>
                                                //       Container(
                                                //           padding:
                                                //               const EdgeInsets
                                                //                       .all(
                                                //                   30.0),
                                                //           child:
                                                //               const CircularProgressIndicator()),
                                                // ),
                                                fit: BoxFit.fitWidth,
                                                height: 100,
                                                width: 200,
                                              ),
                                            ),
                                          ),

                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.all(4.0),
                                          //   child: Row(
                                          //     children: [
                                          //       Icon(
                                          //         Icons.home,
                                          //         size: 16,
                                          //         color: Colors.grey,
                                          //       ),
                                          //       Text(
                                          //         snapshot.data[
                                          //                 "recommentations-list"]
                                          //                 [index]["type"]
                                          //             .toString(),
                                          //         style: TextStyle(
                                          //           fontSize: 10,
                                          //         ),
                                          //       ),
                                          //       Spacer(),
                                          // Text(
                                          //   snapshot.data["buylist"]
                                          //           ["complete-buylist"][index]
                                          //           ["property-id"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //     fontSize: 10,
                                          //     color: Colors.green,
                                          //   ),
                                          // ),

                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Icon(
                                                //   Icons.home,
                                                //   size: 20,
                                                //   color: Colors.grey,
                                                // ),
                                                // Text(
                                                //   snapshot.data["buylist"]
                                                //           ["complete-buylist"]
                                                //           [index]["type"]
                                                //       .toString(),
                                                //   style:
                                                //       TextStyle(fontSize: 10),
                                                // ),
                                                // Spacer(),
                                                Text(
                                                  "\$",
                                                  style: TextStyle(
                                                      color: secondarycolor),
                                                ),
                                                Text(
                                                  snapshot.data["buylist"][
                                                                  "complete-buylist"]
                                                              [
                                                              index]["price"] ==
                                                          "--"
                                                      ? "--"
                                                      : '${oCcy.format(int.parse(snapshot.data["buylist"]["complete-buylist"][index]["price"]))}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.bed_rounded,
                                                          size: 20,
                                                          color: iconcolorgrey,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["buylist"][
                                                                  "complete-buylist"]
                                                                  [index]["bed"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  iconcolorgrey),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),

                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .bathroom_rounded,
                                                          size: 20,
                                                          color: iconcolorgrey,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["buylist"][
                                                                  "complete-buylist"]
                                                                  [index]
                                                                  ["bath"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  iconcolorgrey),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),

                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .bathroom_rounded,
                                                          size: 20,
                                                          color: iconcolorgrey,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["buylist"][
                                                                  "complete-buylist"]
                                                                  [index]
                                                                  ["sqft"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  iconcolorgrey),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // Icon(
                                                //   Icons.view_array_outlined,
                                                //   size: 16,
                                                //   color: Colors.grey,
                                                // ),
                                                // Text(
                                                //   snapshot.data[
                                                //           "recommentations-list"]
                                                //           [index]["size"]
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 10,
                                                //       color: Colors.grey),
                                                // ),
                                                // Text(
                                                //   snapshot.data[
                                                //           "recommentations-list"]
                                                //           [index]["unit"]
                                                //       .toString(),
                                                //   style: TextStyle(
                                                //       fontSize: 10,
                                                //       color: Colors.grey),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 180,
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
                                                    color: secondarycolor),
                                                child: Center(
                                                  child: Text(
                                                    "Property Dashboard",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
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
                                    ),
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
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
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
