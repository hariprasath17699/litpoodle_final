// import 'dart:convert';

// import 'package:litpoodle/screens/home_screen_widgets/recommended.dart';

// RecommendedList welcomeFromJson(String str) =>
//     RecommendedList.fromJson(json.decode(str));

// String welcomeToJson(RecommendedList data) => json.encode(data.toJson());

// class RecommendedList {
//   RecommendedList({
//     this.status,
//     this.message,
//     this.result,
//   });

//   bool status;
//   String message;
//   Result result;

//   factory RecommendedList.fromJson(Map<String, dynamic> json) =>
//       RecommendedList(
//         status: json["status"],
//         message: json["message"],
//         result: Result.fromJson(json["result"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "result": result.toJson(),
//       };
// }

// class Result {
//   Result({
//     this.recommentationsList,
//   });

//   List<RecommentationsList> recommentationsList;

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         recommentationsList: List<RecommentationsList>.from(
//             json["recommentations_list"]
//                 .map((x) => RecommentationsList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "recommentations_list":
//             List<dynamic>.from(recommentationsList.map((x) => x.toJson())),
//       };
// }

// class RecommentationsList {
//   RecommentationsList({
//     this.propertyId,
//     this.images,
//     this.price,
//     this.beds,
//     this.baths,
//     this.city,
//     this.stateCode,
//     this.cityStateCode,
//   });

//   String propertyId;
//   String images;
//   String price;
//   String beds;
//   String baths;
//   String city;
//   String stateCode;
//   String cityStateCode;

//   factory RecommentationsList.fromJson(Map<String, dynamic> json) =>
//       RecommentationsList(
//         propertyId: json["property_id"],
//         images: json["images"],
//         price: json["price"],
//         beds: json["beds"],
//         baths: json["baths"],
//         city: json["city"],
//         stateCode: json["state_code"],
//         cityStateCode: json["city_state_code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "property_id": propertyId,
//         "images": images,
//         "price": price,
//         "beds": beds,
//         "baths": baths,
//         "city": city,
//         "state_code": stateCode,
//         "city_state_code": cityStateCode,
//       };
// }



// /////////////////////////
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(StartupApplication());
// // }

// // enum Page { screenDashboard, screenProfile, screenSearch }

// // extension on Page {
// //   String get route => describeEnum(this);
// // }

// // class StartupApplication extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'BackStack Support App',
// //       home: MainBodyApp(),
// //     );
// //   }
// // }

// // class MainBodyApp extends StatelessWidget {
// //   final Map<Page, Widget> _fragments = {
// //     Page.screenDashboard: DashboardPage(),
// //     Page.screenProfile: UserProfilePage(),
// //     Page.screenSearch: SearchPage(),
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     final navigatorKey = GlobalObjectKey<NavigatorState>(context);

// //     return WillPopScope(
// //       onWillPop: () async {
// //         if (navigatorKey.currentState.canPop()) {
// //           navigatorKey.currentState.pop();
// //           return false;
// //         }

// //         return true;
// //       },
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('BackStack Screen'),
// //         ),
// //         body: Container(
// //           child: Column(
// //             children: <Widget>[
              
// //               Expanded(
// //                 child: Navigator(
// //                   key: navigatorKey,
// //                   initialRoute: Page.screenDashboard.route,
// //                   onGenerateRoute: (settings) {
// //                     final pageName = settings.name;

// //                     final page = _fragments.keys.firstWhere(
// //                         (element) => describeEnum(element) == pageName);

// //                     return MaterialPageRoute(
// //                         settings: settings,
// //                         builder: (context) => _fragments[page]);
// //                   },
// //                 ),
// //               ),
// //               Container(
// //                 width: double.infinity,
// //                 height: 50.0,
// //                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
// //                 color: Colors.indigo[400],
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: <Widget>[
// //                     RaisedButton(
// //                       onPressed: () => navigatorKey.currentState
// //                           .pushNamed(Page.screenDashboard.route),
// //                       child: Text('Dashboard'),
// //                     ),
// //                     RaisedButton(
// //                       onPressed: () => navigatorKey.currentState
// //                           .pushNamed(Page.screenProfile.route),
// //                       child: Text('Profile'),
// //                     ),
// //                     RaisedButton(
// //                       onPressed: () => navigatorKey.currentState
// //                           .pushNamed(Page.screenSearch.route),
// //                       child: Text('Search'),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class UserProfilePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       alignment: Alignment.center,
// //       child: Text(' screenProfile ...'),
// //     );
// //   }
// // }

// // class DashboardPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       alignment: Alignment.center,
// //       child: Text(' screenDashboard ...'),
// //     );
// //   }
// // }

// // class SearchPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       alignment: Alignment.center,
// //       child: Text(' screenSearch ...'),
// //     );
// //   }
// // }
