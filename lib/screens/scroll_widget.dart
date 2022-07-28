// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:litpoodle/components/domain_url.dart';
// import 'package:http/http.dart' as http;
// import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';

// class Scroll extends StatefulWidget {
//   final int id;
//   final ImageProvider image;
//   final double height;
//   final List<Widget> widgets;
//   final AppBar appBar;
//   final double padding;
//   final double contentOffset;
//   Property value;
//   Scroll(this.id, this.image, this.height, this.widgets,
//       {this.appBar, this.padding = 0.0, this.contentOffset = 0.0, this.value});

//   @override
//   _ScrollState createState() => _ScrollState();
// }

// class _ScrollState extends State<Scroll> {
//   ScrollController scrollController;
//   double offset = 0.0;
//   double top;
//   Timer timer;
//   Future<Map<String, dynamic>> propertycall() async {
//     String propid = widget.value.propid;
//     print(propid);
//     var headers = {
//       'Authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
//       'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
//     };

//     var request = http.Request(
//         'GET', Uri.parse('$domain_url/api/home/property_details/$propid/'));

//     request.headers.addAll(headers);

//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     final result = jsonDecode(response.body) as Map<String, dynamic>;

//     if (response.statusCode == 200) {
//       print("result");
//       //print("propid:$propertyid");
//       for (int i = 0;
//           i < result["result"]["property-details"]["general"].length;
//           i++);
//       print(result["result"]["property-details"]["general"]);

//       print(result["result"]["property-details"]["gallery"].length);
//       print(result["result"]["property-details"]["gallery"][0]);

//       // for (int i = 0;
//       //     i < result["result"]["property-details"]["gallery"].length;
//       //     i++) {
//       //   imgList
//       //       .add(result["result"]["property-details"]["gallery"][i]["photo"]);
//       // }
//       // print(imgList);
//       print(
//           result["result"]["property-details"]["property-tax-details"].length);
//       print(result["result"]["property-details"]["property-tax-details"]);
//       for (int i = 0;
//           i <
//               result["result"]["property-details"]["property-tax-details"]
//                   .length;
//           i++) {
//         // result['data']['property_list'].forEach((key, value) => propertyList.add(value));
//         // propertyList.addAll(result["data"]["property_list"][i]);
//       }
//     } else {
//       print("called error");
//       print(response.reasonPhrase);
//     }
//     return result["result"];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       children: <Widget>[
//         Container(
//           height: (this.widget.height - offset).clamp(0.0, this.widget.height),
//           child: Hero(
//             tag: "image",
//             //tag: 'news-image-' + this.widget.id.toString(),
//             // tag: null,

//             child: Image(
//               //image:AssetImage(""),
//               image:
//                   AssetImage("assets/images/poodle1.PNG") ?? NetworkImage(""),
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//             ),
//           ),
//         ),
//         AnimatedContainer(
//           duration: Duration(milliseconds: 250),
//           padding: EdgeInsets.only(top: top),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: ListView(
//               padding: EdgeInsets.only(
//                 top: this.widget.height - this.widget.contentOffset,
//                 left: this.widget.padding,
//                 right: this.widget.padding,
//               ),
//               controller: scrollController,
//               children: <Widget>[
//                 Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: this.widget.widgets)
//               ],
//             ),
//           ),
//         ),
//         this.widget.appBar == null
//             ? Container()
//             : Positioned(
//                 top: 0.0 - offset * 0.2,
//                 left: 0.0,
//                 right: 0.0,
//                 child: this.widget.appBar)
//       ],
//     );
//   }

//   void updateOffset() {
//     setState(() {
//       offset = scrollController.offset;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(updateOffset);

//     top = 1000;
//     timer = new Timer(const Duration(milliseconds: 50), () {
//       setState(() {
//         top = 0;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     scrollController.removeListener(updateOffset);
//     timer.cancel();
//   }
// }
