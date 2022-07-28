// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:http/http.dart' as http;

class ActivityHistoryPage extends StatefulWidget {
  const ActivityHistoryPage({Key key}) : super(key: key);

  @override
  State<ActivityHistoryPage> createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  Future<Map<String, dynamic>> activityhistorycall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET', Uri.parse('$domain_url/api/user/auth/activity_history/'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      //print("propid:$propertyid");
      for (int i = 0; i < result["result"]["user_log_details"].length; i++);
      print(result["result"]["user_log_details"]);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: Text("Activity History"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: activityhistorycall(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    // height: MediaQuery.of(context).size.height * 0.34,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 00, 0),
                      child: CupertinoScrollbar(
                        isAlwaysShown: true,
                        thickness: 14,
                        radius: Radius.circular(10),
                        thicknessWhileDragging: 14,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            // shrinkWrap: true,
                            itemCount: snapshot.data["user_log_details"].length,
                            // gridDelegate:
                            //     const SliverGridDelegateWithMaxCrossAxisExtent(
                            //         maxCrossAxisExtent: 200,
                            //         childAspectRatio: 0.8,
                            //         crossAxisSpacing: 10,
                            //         mainAxisSpacing: 10),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                // onTap: () => Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                //   builder: (context) {
                                //     // return PropertyDetails();
                                //     return SinglePostProperty(
                                //       value: Property(
                                //           propid: snapshot.data[
                                //                   "recommentations-list"]
                                //               [index]["property_id"]),
                                //     );
                                //   },
                                // ),
                                //),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 12,
                                          width: 12,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: secondarycolor,
                                              ),
                                              color: secondarycolor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data["user_log_details"]
                                              [index]["timestamp"],
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          // height: 100,
                                          // width: 320,
                                          child: Card(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.42,
                                              // alignment: Alignment.center,
                                              // height: 80,
                                              // width: 100,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 3.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      // child: ClipRRect(
                                                      //   borderRadius:
                                                      //       BorderRadius.circular(20),
                                                      //   child: Image.network(
                                                      //     snapshot.data["user_log_details"]
                                                      //         [index]["images"],
                                                      //     fit: BoxFit.cover,
                                                      //   ),
                                                      // ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  6, 0, 0, 0),
                                                          child: Text(
                                                            snapshot.data[
                                                                    "user_log_details"]
                                                                    [index]
                                                                    ["action"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    secondarycolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  6, 0, 0, 0),
                                                          child: Text(
                                                            snapshot.data[
                                                                    "user_log_details"]
                                                                    [index]
                                                                    ["command"]
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 10,
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
                                        ),
                                      ],
                                    ),
                                  ],
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
            }),
      ),
    );
  }
}
