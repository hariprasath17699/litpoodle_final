import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/buylist_screen.dart';
import 'package:litpoodle/screens/bottom/choosed_city_visitlist.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:litpoodle/screens/visitlist/realtorfeedback.dart';

class Visitlistproperty {
  final String propid;
  final String city;

  const Visitlistproperty({
    this.propid,
    this.city,
  });
}

class VisitlistScreen extends StatefulWidget {
  final Visitlistcitytab value;
  VisitlistScreen({Key key, this.value}) : super(key: key);

  @override
  State<VisitlistScreen> createState() => _VisitlistScreenState();
}

class _VisitlistScreenState extends State<VisitlistScreen> {
  Future<Map<String, dynamic>> visitlistcall() async {
    String city = widget.value.city20;
    print(city);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET', Uri.parse('$domain_url/api/user/auth/visitlist/$city'));
    // Uri.parse('$domain_url/api/user/auth/visitlist/New%20Orleans%80LA'));

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
    var cityname = widget.value.city;
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
            Text(
              //' ${widget.value.city}',
              "My Visitlist",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
            ),
            NotificationIcon(),
          ],
        ),
      ),
      body: FutureBuilder(
        future: visitlistcall(),
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
                      //                   border:
                      //                       Border.all(color: Colors.grey[400])
                      //                   // color: box
                      //                   ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "To Be Visited",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 10.0),
                              height: MediaQuery.of(context).size.height * 0.28,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  // shrinkWrap: true,
                                  itemCount: snapshot
                                      .data["visitlist"]["going-visitlist"]
                                      .length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: 200,
                                          // width: MediaQuery.of(context).size.width *
                                          //     0.42,
                                          // alignment: Alignment.center,
                                          // height: 80,
                                          // width: 100,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 4, 4, 4),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    snapshot.data["visitlist"]
                                                            ["going-visitlist"][
                                                        index]["property-image"],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 200,
                                                  ),
                                                ),
                                              ),

                                              // Text(
                                              //   snapshot.data["visitlist"]
                                              //           ["going-visitlist"][index]
                                              //           ["property-id"]
                                              //       .toString(),
                                              //   style: TextStyle(
                                              //     fontSize: 10,
                                              //     color: Colors.green,
                                              //   ),
                                              // ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        // Icon(
                                                        //   Icons.home,
                                                        //   size: 14,
                                                        //   color: Colors.grey,
                                                        // ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   snapshot.data["visitlist"]
                                                    //           [
                                                    //           "going-visitlist"]
                                                    //           [index]["type"]
                                                    //       .toString(),
                                                    //   style: TextStyle(
                                                    //       fontSize: 10),
                                                    // ),
                                                    // Spacer(),
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                    Text(
                                                      snapshot.data["visitlist"]
                                                                          [
                                                                          "going-visitlist"]
                                                                      [index]
                                                                  ["price"] ==
                                                              "--"
                                                          ? "--"
                                                          : '${oCcy.format(int.parse(snapshot.data["visitlist"]["going-visitlist"][index]["price"]))}',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 5, 10, 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.bed_rounded,
                                                              size: 20,
                                                              color:
                                                                  iconcolorgrey,
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              snapshot.data[
                                                                      "visitlist"]
                                                                      [
                                                                      "going-visitlist"]
                                                                      [index]
                                                                      ["bed"]
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
                                                              color:
                                                                  iconcolorgrey,
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              snapshot.data[
                                                                      "visitlist"]
                                                                      [
                                                                      "going-visitlist"]
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
                                                                  .view_array_outlined,
                                                              size: 20,
                                                              color:
                                                                  iconcolorgrey,
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              snapshot.data[
                                                                      "visitlist"]
                                                                      [
                                                                      "going-visitlist"]
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

                          /////////////////
                        ],
                      ),
                    ],
                  ),
                  ////////////////////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Visit Completed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 0.0, vertical: 10.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.42,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      // shrinkWrap: true,
                                      itemCount: snapshot
                                          .data["visitlist"]["going-visitlist"]
                                          .length,

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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 200,
                                              // width: MediaQuery.of(context).size.width *
                                              //     0.42,
                                              // alignment: Alignment.center,
                                              // height: 80,
                                              // width: 100,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(4, 4, 4, 4),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        snapshot.data[
                                                                    "visitlist"]
                                                                [
                                                                "complete-visitlist"]
                                                            [
                                                            index]["property-image"],
                                                        fit: BoxFit.cover,
                                                        height: 120,
                                                        width: 200,
                                                      ),
                                                    ),
                                                  ),

                                                  // Text(
                                                  //   snapshot.data["visitlist"]
                                                  //           ["going-visitlist"][index]
                                                  //           ["property-id"]
                                                  //       .toString(),
                                                  //   style: TextStyle(
                                                  //     fontSize: 10,
                                                  //     color: Colors.green,
                                                  //   ),
                                                  // ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.home,
                                                              size: 14,
                                                              color:
                                                                  iconcolorgrey,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["visitlist"]
                                                                  [
                                                                  "complete-visitlist"]
                                                                  [index]
                                                                  ["type"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "\$",
                                                          style: TextStyle(
                                                              color:
                                                                  secondarycolor),
                                                        ),
                                                        Text(
                                                          snapshot.data["visitlist"]
                                                                              [
                                                                              "complete-visitlist"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      "price"] ==
                                                                  "--"
                                                              ? "--"
                                                              : '${oCcy.format(int.parse(snapshot.data["visitlist"]["complete-visitlist"][index]["price"]))}',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  secondarycolor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 5, 10, 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .bed_rounded,
                                                                  size: 20,
                                                                  color:
                                                                      iconcolorgrey,
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  snapshot.data[
                                                                          "visitlist"]
                                                                          [
                                                                          "complete-visitlist"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "bed"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                  color:
                                                                      iconcolorgrey,
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  snapshot.data[
                                                                          "visitlist"]
                                                                          [
                                                                          "complete-visitlist"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "bath"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                      .view_array_outlined,
                                                                  size: 20,
                                                                  color:
                                                                      iconcolorgrey,
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  snapshot.data[
                                                                          "visitlist"]
                                                                          [
                                                                          "complete-visitlist"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "sqft"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          iconcolorgrey),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),

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
                                                  //////
                                                  Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        RealtorFeedback(
                                                                          value: Visitlistproperty(
                                                                              propid: snapshot.data["visitlist"]["complete-visitlist"][index]["property-id"],
                                                                              city: snapshot.data["visitlist"]["complete-visitlist"][index]["slug-region"].toString()
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
                                                                  color:
                                                                      shadowColor,
                                                                  blurRadius: 3,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color:
                                                                  secondarycolor),
                                                          child: Center(
                                                            child: Text(
                                                              "Realtor Feedback",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        width: 180,
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
                                                            color:
                                                                secondarycolor),
                                                        child: Center(
                                                          child: Text(
                                                            "Move to Buylist",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  /////////////////////////
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
