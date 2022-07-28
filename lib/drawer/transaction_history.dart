// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:http/http.dart' as http;

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  Future<Map<String, dynamic>> activityhistorycall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request =
        http.Request('GET', Uri.parse('$domain_url/api/user/auth/purchase'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      //print("propid:$propertyid");
      for (int i = 0; i < result["result"]["credits"].length; i++);
      print(result["result"]["credits"]);
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
        title: Text("Transaction History"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: activityhistorycall(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(boxShadow: [
                          new BoxShadow(
                            color: shadowColor,
                            blurRadius: 3,
                          ),
                        ], borderRadius: BorderRadius.circular(10), color: box),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                        // height: MediaQuery.of(context).size.height * 0.34,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("Credits Added"),
                                  Row(
                                    children: [
                                      Text("\$"),
                                      Text(snapshot.data["credits"]["price"]
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text("+"),
                                  Text(snapshot.data["credits"]["qty"]
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
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
            }),
      ),
    );
  }
}
