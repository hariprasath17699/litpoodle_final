import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/bottom/buylist_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';

class Buylistcitytab {
  final String city;
  final String city20;

  const Buylistcitytab({
    this.city,
    this.city20,
  });
}

class ChoosedCityBuylist extends StatefulWidget {
  const ChoosedCityBuylist({Key key}) : super(key: key);

  @override
  State<ChoosedCityBuylist> createState() => _ChoosedCityBuylistState();
}

class _ChoosedCityBuylistState extends State<ChoosedCityBuylist> {
  int _currentStep = 0;
/////////////////////////////////////////////////////////

  ///////////////////  BuyList  /////////////////////////////
  Future<Map<String, dynamic>> buylistcall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request =
        http.Request('GET', Uri.parse('$domain_url/api/user/auth/buylist'));

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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                                fontWeight: FontWeight.bold),
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
                            //         childAspectRatio: 2 / 2,
                            //         crossAxisSpacing: 0,
                            //         mainAxisSpacing: 0),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                snapshot.data["cites-list"]["city"].length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 140,
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
                                      //     borderRadius: BorderRadius.circular(15),
                                      //     //color: box
                                      //     border: Border.all(
                                      //         color: Colors.grey[400])),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BuyListScreen(
                                                          value: Buylistcitytab(
                                                            city: snapshot.data[
                                                                    "cites-list"]
                                                                    ["city"]
                                                                    [index]
                                                                .toString(),
                                                            city20: snapshot
                                                                .data[
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
                                            child: Text(
                                              snapshot.data["cites-list"]
                                                      ["city"][index]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
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

                    ////////////////////////////////////////////////
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
