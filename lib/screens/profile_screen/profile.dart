import 'dart:convert';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/drawer/transaction_history.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/forgetpassword_screen.dart';
import 'package:litpoodle/screens/password_reset.dart';
import 'package:litpoodle/screens/register_screen.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
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
      setState(() {
        var fname = result["result"]["user-details"]["firstname"];
      });
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  //bool _showPassword = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      // appBar: AppBar(
      //   backgroundColor: null,
      //   elevation: 0,
      //   leading: IconButton(
      //     // onPressed: () {
      //     //   // Navigator.pop(context);
      //     //   Navigator.of(context).push(
      //     //     MaterialPageRoute(builder: (context) => CalenderScreen()),
      //     //   );
      //     // },
      //     icon: Icon(Icons.arrow_back_ios_new_outlined),
      //   ),
      // ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1100),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  // SafeArea(
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("assets/icons/logo.png"),
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  // child:
                  Column(
                    children: [
                      // Image.asset(
                      //   "assets/icons/logo.png",
                      //   height: 230,
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: Row(
                          children: [
                            Back(),
                            SizedBox(
                              width: 85,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      FutureBuilder(
                          future: profilecall(),
                          // ignore: missing_return
                          builder:
                              // ignore: missing_return
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  Text(snapshot.data["user-details"]
                                      ["firstname"]),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data["user-details"]["profile-image"]),
                                    radius: 60,
                                  ),
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(40),
                                  //   child: Image.network(
                                  //     snapshot.data["user-details"]
                                  //         ["profile-image"],
                                  //     height: 100,
                                  //     width: 100,
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 100,
                                  //   width: 100,
                                  //   decoration: BoxDecoration(
                                  //       color: white,
                                  //       borderRadius:
                                  //           BorderRadius.circular(50)),

                                  //   // color: white,
                                  //   child: Icon(
                                  //     Icons.person,
                                  //     size: 80,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // SizedBox(
                                  //   height: 120,
                                  // ),
                                  // SizedBox(
                                  //   child: ClipPath(
                                  //     // clipper: CurveClipper(),
                                  //     child: Container(
                                  //       decoration: BoxDecoration(
                                  //         color: Colors.red,
                                  //         borderRadius: new BorderRadius.only(
                                  //           bottomLeft: const Radius.circular(100),
                                  //           bottomRight: const Radius.circular(100),
                                  //         ),
                                  //       ),
                                  //       //color: Colors.red,
                                  //     ),
                                  //   ),
                                  //   height: 230,
                                  // ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("First Name"),
                                        ),
                                        TextField(
                                          // controller: TextEditingController.fromValue(
                                          // TextEditingValue(
                                          //   text: model.settings == null? '' :model.settings.host,
                                          // ),

                                          controller: TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: null ??
                                                      snapshot.data[
                                                              "user-details"]
                                                          ["firstname"])),

                                          // controller:
                                          //     snapshot.data["user-details"]
                                          //         ["firstname"],
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Last Name"),
                                        ),
                                        TextField(
                                          controller: TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: null ??
                                                      snapshot.data[
                                                              "user-details"]
                                                          ["lastname"])),
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Email"),
                                        ),
                                        TextField(
                                          controller: TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: null ??
                                                      snapshot.data[
                                                              "user-details"]
                                                          ["email"])),
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Mobile No"),
                                        ),
                                        TextField(
                                          controller: TextEditingController
                                              .fromValue(TextEditingValue(
                                                  text: null ??
                                                      snapshot.data[
                                                              "user-details"]
                                                          ["phone"])),
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text("My Credits"),
                                              Spacer(),
                                              InkWell(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return TransactionHistory();
                                                    },
                                                  ),
                                                ),
                                                child: Text(
                                                  "Payment History",
                                                  style: TextStyle(
                                                      color: secondarycolor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextField(
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Add ",
                                                    style: TextStyle(
                                                        color: secondarycolor),
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    color: secondarycolor,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Change Password"),
                                        ),
                                        TextField(
                                          cursorColor: secondarycolor,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5),
                                          decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return PasswordReset();
                                                  },
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.grey,
                                                size: 20,
                                              ),
                                            ),
                                            // hintText: 'Email Id',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 5),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300]),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondarycolor),
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                    ],
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // int curveHeight = 50;
//     Offset controlPoint = Offset(size.width / 2, size.height + 50);
//     Offset endPoint = Offset(size.width, size.height - 10);

//     Path path = Path()

//       ///..lineTo(0, size.height - 50)
//       ..quadraticBezierTo(
//           controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
//       ..lineTo(size.width, 0)
//       ..close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
