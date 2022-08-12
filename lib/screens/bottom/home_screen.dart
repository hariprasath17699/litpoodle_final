import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/controller/google_login_controller.dart';

import 'package:litpoodle/screens/bottom/home_welcome.dart';

import 'package:litpoodle/screens/drawer.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:litpoodle/screens/home_screen_widgets/poodle_algorithm.dart';
import 'package:litpoodle/screens/home_screen_widgets/recommended.dart';

import 'package:litpoodle/screens/home_screen_widgets/scrollable_container.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/screens/notificationscreen.dart';
import 'package:localstorage/localstorage.dart';

import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _mycontroller = new ScrollController();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final LocalStorage storage = new LocalStorage('litpoodle');
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleSignInController model;
  Future<Map<String, dynamic>> profilecall() async {
    var headers = {
      'Authorization':
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request =
    http.Request('GET', Uri.parse('$domain_url/api/user/auth/dashboard/'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      //print("propid:$propertyid");
      // for (int i = 0; i < result["result"]["cites-list"]["city"].length; i++);
      print(result["result"]["user-details"]["firstname"]);

      print(result["result"]["user-details"]);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }


  @override
  Widget build(BuildContext context) => WillPopScope(

    onWillPop: () => showDialog<bool>(
      context: context,

      builder: (c) => AlertDialog(

        title: Text('Warning'),
        content: Text('Do you really want to exit'),
        actions: [
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(c, true),
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(c, false),
          ),
        ],
      ),
    ),
    child: Scaffold(
          drawer: DrawerScreen(),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SearchWidget(),
                      ],
                    ),

                    // FutureBuilder(
                    //     future: data,
                    //     // ignore: missing_return
                    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //       if (snapshot.hasData) {
                    //         Text(snapshot.data);
                    //       }
                    //     })
                  ],
                ),
              ),
            ),
            title: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: profilecall(),
                    // ignore: missing_return
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(model.googleAccount.email),
                            Text(
                              snapshot.data["user-details"]["firstname"]
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              snapshot.data["user-details"]["lastname"]
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        );
                      } else {
                        Center(
                          child: Text("Some Thing Went Wrong"),
                        );
                      }
                      return SizedBox(
                        //height: 100,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: secondarycolor,
                        )),
                      );
                    }),
                // Text(
                //   '',
                //   // "Hi Ashlee",
                //   style:
                //       TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
                // ),
                Spacer(),
                NotificationIcon()
              ],
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Container(
                    // height: 30,
                    // width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // child: Icon(
                    //   Icons.person,
                    //   color: Colors.grey[600],
                    //   size: 25,
                    // ),
                    child: FutureBuilder(
                        future: profilecall(),
                        // ignore: missing_return
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                              backgroundColor: secondarycolor,
                              backgroundImage: NetworkImage(
                                  snapshot.data["user-details"]["profile-image"]),
                              radius: 80,
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
                        })),
                // onPressed: () => DrawerScreen()
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            iconTheme: IconThemeData(color: secondarycolor),
            // backgroundColor: Colors.white,
            backgroundColor: secondarycolor,
            elevation: 0,
            // /actions: [],
            //actions: [Drawer()],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ScrollableContainer(),

                ////////////////////
              ],
            ),
          ),

          // body: SafeArea(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: SearchBar<Post>(
          //         minimumChars: 0,
          //         onSearch: search,
          //         onItemFound: (Post post, int index) {
          //           return ListTile(
          //             title: Text(post.title),
          //             // subtitle: Text(post.description),
          //           );
          //         }),
          //   ),
          // ),

          // body: new ListView.builder(
          //   itemCount: 1,
          //   padding: EdgeInsets.zero,
          //   itemBuilder: (context, index) {
          //     return StickyHeader(
          //       header: HomeWelcome(),
          //       content: SingleChildScrollView(
          //         scrollDirection: Axis.vertical,
          //         physics: BouncingScrollPhysics(),
          //         child: Container(
          //           child: Column(
          //             children: [
          //               ScrollableContainer(),
          //               //Recommended(),
          //             ],
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),

        ),
  );
}




// Future<void> _recommended() async {
//   var headers = {
//     'Authorization':
//         'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTYzOTA0ODM3MSwibmJmIjoxNjM5MDQ4NDAxLCJleHAiOjE2MzkwNDg0MzEsImRhdGEiOnsiZW1haWwiOiJqYXdhaGFyMTMyQHRhZ3dlYnMuaW4iLCJ1c2VyX2lkIjoiMTY1OTgyIiwicGFzc3dvcmQiOiJ0ZXN0VFRAMTIzNCJ9fQ.XAPnJ0VlCQkt-GTcHrkVx5Q2lJ7MFnkMvtDpWswieFc',
//     'Cookie': 'ci_session=a84jufgrto803a8vdfsla2bmcof12s9d'
//   };
//   var request = http.Request('GET',
//       Uri.parse('https://clientdev.tagwebs.in/litpoodle/api/search/home'));

//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }
