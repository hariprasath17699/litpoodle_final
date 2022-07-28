import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/choose_wishlist_city.dart';
import 'package:litpoodle/screens/bottom/visitlist_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';

class WishlistScreen extends StatefulWidget {
  final Wishlistcitytab value;
  const WishlistScreen({Key key, this.value}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Future Movetovisitlistcall() async {
  //   String city = widget.value.city20;
  //   print(city);
  //   var headers = {
  //     'Authorization':
  //         'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
  //     'Cookie': 'ci_session=e1r5kakn30n8dgso0khvdfonbammrt1h'
  //   };
  //   var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(
  //           'https://clientdev.tagwebs.in/litpoodle/api/user/user/insert_visitlist/'));
  //   request.fields.addAll({'property_id': 'LIT9764120961'});
  //   request.headers.addAll(headers);

  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   final result = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     print("result");
  //     print(result);
  //     //print("propid:$propertyid");
  //     // for (int i = 0; i < result["result"]["cites-list"]["city"].length; i++);
  //     // print(result["result"]["cites-list"]["city"]);

  //     // print(result["result"]["cites-list"]["city"].length);
  //     // print(result["result"]["cites-list"]["city"][0]);
  //   } else {
  //     print("called error");
  //     print(response.reasonPhrase);
  //   }
  //   return result["result"];
  // }

  ////////////////////////////////
  Future<Map<String, dynamic>> wishlistcall() async {
    String city = widget.value.city20;
    print(city);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET', Uri.parse('$domain_url/api/user/auth/wishlist/$city'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
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
        backgroundColor: bgColor,
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              // ' ${widget.value.city}',
              "My Wishlist",
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
        // title: Text(
        //   "My WishList",
        //   style: TextStyle(
        //       color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        // ),
      ),
      body: FutureBuilder(
        future: wishlistcall(),

        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Text(snapshot.data["cites-list"]["city"][0]),
                    // Text(snapshot.data["cites-list"]["city"][10]),
                    SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 60,
                          //   child: ListView.builder(
                          //     physics: BouncingScrollPhysics(),
                          //     shrinkWrap: true,
                          //     itemCount:
                          //         snapshot.data["cites-list"]["city"].length,
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
                          //                   borderRadius:
                          //                       BorderRadius.circular(15),
                          //                   //color: box,
                          //                   border: Border.all(
                          //                       color: Colors.grey[400])),
                          //               child: Center(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(
                          //                       10, 0, 10, 0),
                          //                   child: Text(
                          //                     snapshot.data["cites-list"]
                          //                             ["city"][index]
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
                          ///////
                          SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data["credits"]
                                            ["credit-purchased"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "    CREDIT \nPURCHASED",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data["credits"]
                                            ["credits-remaining"],
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "   CREDIT \nREMAINING",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "+",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: secondarycolor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "  ADD \nCREDIT",
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: secondarycolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(25.0),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //         Icons.person_outline_outlined,
                          //         color: secondarycolor,
                          //       ),
                          //       SizedBox(
                          //         width: 15,
                          //       ),
                          //       Text(
                          //         "Realtor",
                          //       ),
                          //       Spacer(),
                          //       Icon(
                          //         Icons.arrow_forward_ios_rounded,
                          //         color: secondarycolor,
                          //         size: 18,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          ///////////////////////////////////////////
                          /// // home: token != '' ? BottomNavScreen() : MyApp()));
                          // Text(
                          //   snapshot.data["wishlist"][
                          //                       "user-wishlist"]
                          //                   [index]
                          //               ["price"] ==
                          //           "--"
                          //       ? "--"

                          //       :
                          SizedBox(
                            height: 10,
                          ),
                          snapshot.data["realtor-details"] ==
                                  "Requested For Realtor"
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: secondarycolor),
                                    child: Center(
                                      child: Text(
                                        "Requested For Realtor",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                )
                              : snapshot.data["realtor-details"] ==
                                      "Request for Agent"
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                BorderRadius.circular(10),
                                            color: secondarycolor),
                                        child: Center(
                                          child: Text(
                                            "Request for Agent",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Card(
                                        color: bgColor,
                                        elevation: 0,
                                        // shadowColor: shadowColor,
                                        // elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            //onExpansionChanged: ,
                                            textColor: secondarycolor,
                                            iconColor: secondarycolor,
                                            title: Row(
                                              children: [
                                                Icon(
                                                  Icons.person_outline_outlined,
                                                  color: secondarycolor,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "Realtor",
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Column(
                                                  children: [
                                                    // Image.network(snapshot.data[
                                                    //         "realtor-details"]
                                                    //     ["profile-image"]),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.person,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Row(
                                                          //  text: snapshot.data["closing"] ==
                                                          //                                   ""
                                                          //                               ? " "
                                                          //                               : snapshot.data["closing"]["comments"].toString()
                                                          children: [
                                                            Text(snapshot
                                                                        .data ==
                                                                    null
                                                                ? [""]
                                                                : snapshot.data[
                                                                        "realtor-details"]
                                                                    [
                                                                    "firstname"]),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(snapshot
                                                                        .data ==
                                                                    null
                                                                ? [""]
                                                                : snapshot.data[
                                                                        "realtor-details"]
                                                                    [
                                                                    "lastname"]),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.mail_rounded,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(snapshot.data ==
                                                                null
                                                            ? [""]
                                                            : snapshot.data[
                                                                    "realtor-details"]
                                                                ["email"]),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Selected Homes",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // SizedBox(
                                //   height: 200,
                                // )
                              ],
                            ),
                          ),
                          //////////
                          ///
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 8.0, vertical: 15.0),
                              height: MediaQuery.of(context).size.height * 0.34,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot
                                      .data["wishlist"]["user-wishlist"].length,

                                  // gridDelegate:
                                  //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                  //         maxCrossAxisExtent: 200,
                                  //         childAspectRatio: 0.8,
                                  //         crossAxisSpacing: 10,
                                  //         mainAxisSpacing: 10),
                                  itemBuilder: (BuildContext ctx, index) {
                                    Future Movetovisitlistcall() async {
                                      String city = widget.value.city20;
                                      print(city);
                                      var headers = {
                                        'Authorization':
                                            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
                                        'Cookie':
                                            'ci_session=e1r5kakn30n8dgso0khvdfonbammrt1h'
                                      };
                                      var request = http.MultipartRequest(
                                          'POST',
                                          Uri.parse(
                                              'https://clientdev.tagwebs.in/litpoodle/api/user/user/insert_visitlist/'));
                                      request.fields.addAll({
                                        'property_id': snapshot.data["wishlist"]
                                                ["user-wishlist"][index]
                                            ["property-id"]
                                      });
                                      request.headers.addAll(headers);

                                      var streamedResponse =
                                          await request.send();
                                      var response =
                                          await http.Response.fromStream(
                                              streamedResponse);
                                      final result = jsonDecode(response.body);

                                      if (response.statusCode == 200) {
                                        print(snapshot.data["wishlist"]
                                                ["user-wishlist"][index]
                                            ["property-id"]);
                                        print("result");
                                        print(result);
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

                                    return InkWell(
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 4, 4, 4),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  // child: Image.network(
                                                  //       snapshot.data["wishlist"][
                                                  //                   "user-wishlist"]
                                                  //               [index]
                                                  //           ["property-image"],
                                                  //       fit: BoxFit.fitWidth,
                                                  //     ) ??
                                                  // child: SvgPicture.network(

                                                  //       snapshot.data["wishlist"][
                                                  //                   "user-wishlist"]
                                                  //               [index]
                                                  //           ["property-image"],
                                                  //       semanticsLabel: 'poodle',
                                                  //       placeholderBuilder: (BuildContext
                                                  //               context) =>
                                                  //           Container(
                                                  //               padding:
                                                  //                   const EdgeInsets
                                                  //                           .all(
                                                  //                       30.0),
                                                  //               child:
                                                  //                   const CircularProgressIndicator(
                                                  //                 color:
                                                  //                     secondarycolor,
                                                  //               )),
                                                  //     ) ??
                                                  child: Stack(
                                                    children: [
                                                      Image.network(
                                                        snapshot.data["wishlist"]
                                                                    [
                                                                    "user-wishlist"]
                                                                [index]
                                                            ["property-image"],
                                                        fit: BoxFit.fitWidth,
                                                        height: 100,
                                                        width: 200,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment
                                                            //         .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  // height: 35,
                                                                  // width: 32,
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: [
                                                                        new BoxShadow(
                                                                          color:
                                                                              shadowColor,
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      color:
                                                                          box),
                                                                  child: Center(
                                                                    child:
                                                                        LikeButton(
                                                                      // mainAxisAlignment:
                                                                      //     MainAxisAlignment
                                                                      //         .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // Padding(
                                                              //   padding:
                                                              //       EdgeInsets
                                                              //           .all(4),
                                                              //   child:
                                                              //       Container(
                                                              //     height: 30,
                                                              //     width: 30,
                                                              //     // height: 35,
                                                              //     // width: 32,
                                                              //     decoration: BoxDecoration(
                                                              //         boxShadow: [
                                                              //           new BoxShadow(
                                                              //             color:
                                                              //                 shadowColor,
                                                              //             blurRadius:
                                                              //                 2,
                                                              //           ),
                                                              //         ],
                                                              //         borderRadius:
                                                              //             BorderRadius.circular(
                                                              //                 30),
                                                              //         color:
                                                              //             box),
                                                              //     child: SvgPicture
                                                              //         .network(
                                                              //       "https://www.litpoodle.com/assets/user/img/compare.svg",
                                                              //       height: 1,
                                                              //       width: 1,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                    // child: Image.network(
                                                    //       snapshot.data["wishlist"]
                                                    //                   [
                                                    //                   "user-wishlist"]
                                                    //               [index]
                                                    //           ["property-image"],
                                                    //       fit: BoxFit.fitWidth,
                                                    //       height: 100,
                                                    //       width: 200,
                                                    //     ) ??
                                                    //     null,
                                                  ),
                                                ),
                                              ),

                                              // Text(
                                              //   snapshot.data["wishlist"]
                                              //           ["user-wishlist"][index]
                                              //           ["property-id"]
                                              //       .toString(),
                                              //   style: TextStyle(
                                              //     fontSize: 10,
                                              //     color: Colors.green,
                                              //   ),
                                              // ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Icon(
                                                    //   Icons.home,
                                                    //   size: 14,
                                                    //   color: Colors.grey,
                                                    // ),
                                                    // Text(
                                                    //   snapshot.data["wishlist"]
                                                    //           ["user-wishlist"]
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
                                                    // home: token != '' ? BottomNavScreen() : MyApp()));
                                                    Text(
                                                      snapshot.data["wishlist"][
                                                                          "user-wishlist"]
                                                                      [index]
                                                                  ["price"] ==
                                                              "--"
                                                          ? "--"
                                                          : '${oCcy.format(int.parse(snapshot.data["wishlist"]["user-wishlist"][index]["price"]))}',
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
                                                        2, 6, 2, 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                              .data["wishlist"][
                                                                  "user-wishlist"]
                                                                  [index]["bed"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  iconcolorgrey),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
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
                                                              .data["wishlist"][
                                                                  "user-wishlist"]
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
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .view_array_outlined,
                                                          size: 20,
                                                          color: iconcolorgrey,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["wishlist"][
                                                                  "user-wishlist"]
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
                                              ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  super
                                                                      .widget));

                                                      Movetovisitlistcall();
                                                    });
                                                    // Navigator.of(context).push(
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           VisitlistScreen()),
                                                    // );
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
                                                            BorderRadius
                                                                .circular(10),
                                                        color: secondarycolor),
                                                    child: Center(
                                                      child: Text(
                                                        "Move to VisitList",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
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
                                  }),
                            ),
                          ),
                          ///////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Agent Recommendations",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // SizedBox(
                                //   height: 200,
                                // )
                              ],
                            ),
                          ),
                          ///////////////////
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 8.0, vertical: 15.0),
                              height: MediaQuery.of(context).size.height * 0.26,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot
                                      .data["wishlist"]["realtor-wishlist"]
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  // child: Image.network(
                                                  //       snapshot.data["wishlist"][
                                                  //                   "user-wishlist"]
                                                  //               [index]
                                                  //           ["property-image"],
                                                  //       fit: BoxFit.fitWidth,
                                                  //     ) ??
                                                  // child: SvgPicture.network(
                                                  //       snapshot.data["wishlist"]
                                                  //                   [
                                                  //                   "realtor-wishlist"]
                                                  //               [index]
                                                  //           ["property-image"],
                                                  //       semanticsLabel:
                                                  //           'poodle',
                                                  //       placeholderBuilder: (BuildContext
                                                  //               context) =>
                                                  //           Container(
                                                  //               padding:
                                                  //                   const EdgeInsets
                                                  //                           .all(
                                                  //                       30.0),
                                                  //               child:
                                                  //                   const CircularProgressIndicator(
                                                  //                 color:
                                                  //                     secondarycolor,
                                                  //               )),
                                                  //     ) ??
                                                  child: Image.network(
                                                        snapshot.data["wishlist"]
                                                                    [
                                                                    "realtor-wishlist"]
                                                                [index]
                                                            ["property-image"],
                                                        fit: BoxFit.fitWidth,
                                                        height: 100,
                                                        width: 200,
                                                      ) ??
                                                      null,
                                                ),
                                              ),

                                              // Text(
                                              //   snapshot.data["wishlist"]
                                              //           ["realtor-wishlist"]
                                              //           [index]["property-id"]
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
                                                    // Icon(
                                                    //   Icons.home,
                                                    //   size: 14,
                                                    //   color: Colors.grey,
                                                    // ),
                                                    // Text(
                                                    //   snapshot.data["wishlist"][
                                                    //           "realtor-wishlist"]
                                                    //           [index]["region"]
                                                    //       .toString(),
                                                    //   style: TextStyle(
                                                    //       fontSize: 10),
                                                    // ),
                                                    // Spacer(),
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                        color: secondarycolor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data["wishlist"][
                                                              "realtor-wishlist"]
                                                              [index]["price"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
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
                                                        10, 5, 10, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                              .data["wishlist"][
                                                                  "realtor-wishlist"]
                                                                  [index]["bed"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  iconcolorgrey),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
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
                                                              .data["wishlist"][
                                                                  "realtor-wishlist"]
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
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .view_array_outlined,
                                                          size: 20,
                                                          color: iconcolorgrey,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data["wishlist"][
                                                                  "realtor-wishlist"]
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
                                  }),
                            ),
                          ),
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
