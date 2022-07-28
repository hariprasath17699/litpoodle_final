import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litpoodle/blogfc/screens/home_screen.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/bottom/visitlist_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/screens/visitlist/realtorfeedback.dart';

class Visitlistcitytab {
  final String city;
  final String city20;

  const Visitlistcitytab({
    this.city,
    this.city20,
  });
}

class ChoosedCityVisitList extends StatefulWidget {
  const ChoosedCityVisitList({Key key}) : super(key: key);

  @override
  State<ChoosedCityVisitList> createState() => _ChoosedCityVisitListState();
}

class _ChoosedCityVisitListState extends State<ChoosedCityVisitList> {
  Future<Map<String, dynamic>> Choosedcityvisitlistcall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request =
        http.Request('GET', Uri.parse('$domain_url/api/user/auth/visitlist'));

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          },
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: bgColor,
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
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
        future: Choosedcityvisitlistcall(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Choose City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavScreen()),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: box),
                                            child: Center(
                                              child: Text(
                                                "Back",
                                                style: TextStyle(
                                                    color: secondarycolor,
                                                    //color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              //height: 60,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3.3 / 1,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                ),
                                // gridDelegate:
                                //     SliverGridDelegateWithFixedCrossAxisCount(
                                //         crossAxisCount: 2,
                                //         //  maxCrossAxisExtent: 150,
                                //         childAspectRatio: 2 / 2,
                                //         crossAxisSpacing: 0,
                                //         mainAxisSpacing: 0),

                                // gridDelegate:
                                //     SliverGridDelegateWithMaxCrossAxisExtent(

                                //         maxCrossAxisExtent: 150,
                                //         childAspectRatio: 2,
                                //         crossAxisSpacing: 0,
                                //         mainAxisSpacing: 10),
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    snapshot.data["cites-list"]["city"].length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VisitlistScreen(
                                                        value: Visitlistcitytab(
                                                          city: snapshot.data[
                                                                  "cites-list"]
                                                                  ["city"]
                                                                  [index]
                                                              .toString(),
                                                          city20: snapshot.data[
                                                                  "cites-list"]
                                                                  ["city"]
                                                                  [index]
                                                              .replaceAll(
                                                                  ', ', '%80')
                                                              .replaceAll(
                                                                  " ", "%20"),
                                                        ),
                                                      )),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 140,
                                            //width: 40,
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
                                            // decoration: BoxDecoration(
                                            //     // boxShadow: [
                                            //     //   new BoxShadow(
                                            //     //     color: shadowColor,
                                            //     //     blurRadius: 3,
                                            //     //   ),
                                            //     // ],
                                            //     borderRadius:
                                            //         BorderRadius.circular(15),
                                            //     border: Border.all(
                                            //         color: Colors.grey[400])
                                            //     // color: box
                                            //     ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 10, 0),
                                                child: Text(
                                                  snapshot.data["cites-list"]
                                                          ["city"][index]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                ));
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
