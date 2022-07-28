// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:litpoodle/components/colors.dart';
// import 'package:litpoodle/components/domain_url.dart';

// class PropertyDetails extends StatefulWidget {
//   const PropertyDetails({Key key}) : super(key: key);

//   @override
//   State<PropertyDetails> createState() => _PropertyDetailsState();
// }

// class _PropertyDetailsState extends State<PropertyDetails> {
//   Future<Map<String, dynamic>> data;
//   final List<String> imgList = [];
//   int activeIndex = 0;
//   int _current = 0;
//   final CarouselController _controller = CarouselController();
//   @override
//   void initState() {
//     data = propertycall();
//     super.initState();
//   }

//   Future<Map<String, dynamic>> propertycall() async {
//     var headers = {
//       'Authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
//       'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
//     };

//     var request = http.Request('GET',
//         Uri.parse('$domain_url/api/home/property_details/LIT4168597016/'));

//     request.headers.addAll(headers);

//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//     final result = jsonDecode(response.body) as Map<String, dynamic>;

//     if (response.statusCode == 200) {
//       print("result");
//       print(result["result"]["property-details"]["gallery"].length);
//       print(result["result"]["property-details"]["gallery"][0]);
//       for (int i = 0;
//           i < result["result"]["property-details"]["gallery"].length;
//           i++) {
//         imgList
//             .add(result["result"]["property-details"]["gallery"][i]["photo"]);
//       }
//       print(imgList);
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
//     final List<Widget> imageSliders = imgList
//         .map((item) => Container(
//               height: 100,
//               width: 100,
//               child: Image.network(
//                 item,
//               ),
//             ))
//         .toList();
//     return Scaffold(
//       appBar: AppBar(backgroundColor: secondarycolor),
//       body: FutureBuilder(
//           future: data,
//           // ignore: missing_return
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return Center(
//                   child: Column(
//                 children: [
//                   Column(
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       // CarouselSlider.builder(
//                       //   itemCount: imgList.length,
//                       //   carouselController: _controller,
//                       //   itemBuilder: (context, index, realindex) {
//                       //     final urlImage = imgList[index];

//                       //     return buildImage1(urlImage, index);
//                       //   },
//                       //   options: CarouselOptions(
//                       //       autoPlay: true,
//                       //       enlargeCenterPage: true,
//                       //       aspectRatio: 2.0,
//                       //       onPageChanged: (index, reason) {
//                       //         setState(() {
//                       //           _current = index;
//                       //         });
//                       //       }),
//                       // ),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: imgList.asMap().entries.map((entry) {
//                       //     return GestureDetector(
//                       //       onTap: () => _controller.animateToPage(entry.key),
//                       //       child: Container(
//                       //         width: 8.0,
//                       //         height: 6.0,
//                       //         margin: const EdgeInsets.symmetric(
//                       //             vertical: 0.0, horizontal: 4.0),
//                       //         decoration: BoxDecoration(
//                       //             shape: BoxShape.rectangle,
//                       //             color: (Theme.of(context).brightness ==
//                       //                         Brightness.dark
//                       //                     ? Colors.white
//                       //                     : Colors.black)
//                       //                 .withOpacity(
//                       //                     _current == entry.key ? 0.9 : 0.4)),
//                       //       ),
//                       //     );
//                       //   }).toList(),
//                       // ),
//                       ////////////////////////////////////
//                       Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 4.0, vertical: 6.0),
//                           height: MediaQuery.of(context).size.height * 0.15,
//                           child: ListView.builder(
//                               physics: BouncingScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               // shrinkWrap: true,
//                               itemCount: snapshot
//                                   .data["property-details"]["gallery"].length,
//                               // gridDelegate:
//                               //     const SliverGridDelegateWithMaxCrossAxisExtent(
//                               //         maxCrossAxisExtent: 200,
//                               //         childAspectRatio: 0.8,
//                               //         crossAxisSpacing: 10,
//                               //         mainAxisSpacing: 10),
//                               itemBuilder: (BuildContext ctx, index) {
//                                 return InkWell(
//                                   // onTap: () => Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) {
//                                   //       return PropertyDetails();
//                                   //     },
//                                   //   ),
//                                   // ),

//                                   child: Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.30,

//                                       alignment: Alignment.center,
//                                       // height: 80,
//                                       // width: 100,
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 3.0),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(0.0),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 child: Image.network(
//                                                   snapshot
//                                                       .data["property-details"]
//                                                           ["gallery"][index]
//                                                           ["photo"]
//                                                       .toString(),
//                                                   fit: BoxFit.cover,
//                                                   height: 80,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       // decoration: BoxDecoration(
//                                       //     boxShadow: [
//                                       //       new BoxShadow(
//                                       //         color: shadowColor,
//                                       //         blurRadius: 3,
//                                       //       ),
//                                       //     ],
//                                       //     borderRadius:
//                                       //         BorderRadius.circular(10),
//                                       //     color: box),
//                                     ),
//                                   ),
//                                   // ),
//                                 );
//                                 //   decoration: BoxDecoration(
//                                 //       border: Border.all(),
//                                 //       // color: Colors.amber,
//                                 //       borderRadius: BorderRadius.circular(15)),
//                                 // );
//                               }),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ));
//             }
//             return Center(
//                 child: CircularProgressIndicator(
//               color: secondarycolor,
//             ));
//           }),
//     );
//   }
// }

// Widget buildImage1(String urlImage, int index) => Container(
//       child: Image.network(
//         urlImage,
//         fit: BoxFit.contain,
//       ),
//     );
