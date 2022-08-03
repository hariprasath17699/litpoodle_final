import 'dart:convert';
import 'dart:math';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/controller/google_login_controller.dart';
import 'package:litpoodle/models/session_model.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/bottom/home_screen.dart';
import 'package:litpoodle/screens/chart.dart';
import 'package:litpoodle/screens/forgetpassword_screen.dart';
import 'package:litpoodle/screens/register_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  bool isChecked = false;
  bool _isLoading = false;
  Session session;

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();
  TextEditingController loginemailtext = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode pswdFocusNode = new FocusNode();
  var key = "null";
  var encryptedText, plainText;
  final LocalStorage storage = new LocalStorage('litpoodle');
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String _email, _password;

  bool autovalidate = false;

  Future<Map<String, dynamic>> _submit() async {
    final form = formKey.currentState;
    var headers = {'Cookie': 'ci_session=2jc337nmfahdg88gj1qb6f64s8ujol97'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://clientdev.tagwebs.in/litpoodle/api/user/login/user_login'));
    request.fields
        .addAll({'email': loginemailtext.text, 'password': loginpassword.text});

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      await FlutterSession().set("token", result["token"]);

      setState(() {
        _isLoading = true;
        form.save();
        print(loginemailtext);
        print(loginpassword);
        Navigator.pop(context);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BottomNavScreen()),
        );
      });
      print("result");
      //print("propid:$propertyid");
      for (int i = 0; i < result["token"].length; i++);
      print(result["token"]);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  ///////////////////////////

  // Future<Session> _submit() async {
  //   final form = formKey.currentState;
  //   // String token =
  //   //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A";
  //   var headers = {
  //     'Cookie': 'ci_session=s6rfqo910mk00lk94kldsa67o0hiauhb',
  //   };
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('$domain_url/api/user/login/user_login'));
  //   request.fields
  //       .addAll({'email': loginemailtext.text, 'password': loginpassword.text});

  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   final result = jsonDecode(response.body) as Map<String, dynamic>;
  //   if (response.statusCode == 200) {
  //     /// Session mappeddata = Session(token: token);
  //     await FlutterSession().set("token", loginemailtext.text);

  //     setState(() {
  //       _isLoading = true;
  //       form.save();
  //       print(loginemailtext);
  //       print(loginpassword);
  //       Navigator.pop(context);

  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => BottomNavScreen()),
  //       );
  //     });
  //     print(response.reasonPhrase);
  //     print(result["result"]["credits"]);
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //     print(await response.stream.bytesToString());
  //   }

  // if (form.validate()) {
  //   setState(
  //     () {
  //       _isLoading = true;
  //       form.save();
  //       print(loginemailtext);
  //       print(loginpassword);
  //       // _presenter.doLogin(_email, _password);
  //       // Navigator.of(context).push(
  //       //   MaterialPageRoute(builder: (context) => MyHomePage()),
  //       // );
  //     },
  //   );
  // }
  //}

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
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
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
                        ClipRRect(
                          //  borderRadius: BorderRadius.circular(30),
                          // borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/img1.png",
                            height: 225,
                            //  width: 380,
                            fit: BoxFit.cover,
                            //fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: const [
                                Text(
                                  "Welcome back",
                                  style: TextStyle(fontSize: 30, height: 1.5),
                                ),
                                Text(
                                  "Login to your account",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: loginemailtext,
                            cursorColor: secondarycolor,
                            // focusNode: emailFocusNode,
                            onFieldSubmitted: (String value) {
                              FocusScope.of(context)
                                  .requestFocus(pswdFocusNode);
                            },
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            onSaved: (val) => _email = val,
                            validator: (val) {
                              // if (value.isEmpty) {
                              //   return 'Enter a notes!';
                              // }
                              if (val == null || val.isEmpty) {
                                return '* Please enter your email';
                              }
                              if (val != loginemailtext.text) {
                                return '* Please enter valid email';
                              }
                              if (!reg.hasMatch(loginemailtext.text)) {
                                return "* Please enter your valid email id";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'Email Id',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondarycolor),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: loginpassword,
                            cursorColor: secondarycolor,
                            focusNode: pswdFocusNode,
                            // onFieldSubmitted: (String value) {
                            //   FocusScope.of(context)
                            //       .requestFocus(pswdFocusNode);
                            // },
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            obscureText: !this._showPassword,
                            onSaved: (val) => _password = val,
                            validator: (value) {
                              // if (value.isEmpty) {
                              //   return 'Enter a notes!';
                              // }
                              if (value == null || value.isEmpty) {
                                return '* Please enter password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusColor: secondarycolor,

                              hintText: "Password",
                              // labelText: 'password',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondarycolor),
                                  borderRadius: BorderRadius.circular(14)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: this._showPassword
                                      ? secondarycolor
                                      : Colors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() =>
                                      this._showPassword = !this._showPassword);
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                //hoverColor: Colors.amber,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                activeColor: secondarycolor,
                                // focusColor: secondarycolor,
                                //overlayColor: Colors.grey[50],
                                // hoverColor: secondarycolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                value: isChecked,
                                checkColor: Colors.white,

                                //fillColor: MaterialStateProperty.resolveWith(),
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {
                                    if(isChecked == true){
                                      storage.setItem("login", "true");
                                    }
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ForgetPassword();
                                    },
                                  ),
                                ),
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(color: secondarycolor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Divider(
                                  thickness: 1.5,
                                ),
                              )),

                              //const EdgeInsets.symmetric(horizontal: 10),
                              Text(
                                "or",
                                style: TextStyle(color: Colors.grey),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Divider(
                                    thickness: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30,
                            0,
                            30,
                            10,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Provider.of<GoogleSignInController>(context,
                                          listen: false)
                                      .login();
                                  print("login");
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           BottomNavScreen()),
                                  // );
                                  // ignore: missing_return
                                  Consumer<GoogleSignInController>(
                                      // ignore: missing_return
                                      builder: (context, model, child) {
                                    if (model.googleAccount != null) {
                                      return BottomNavScreen();
                                    } else {
                                      return null;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/gmail.png",
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Google"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Spacer(),
                              // Container(
                              //   height: 35,
                              //   width: 120,
                              //   decoration: BoxDecoration(
                              //       boxShadow: [
                              //         new BoxShadow(
                              //           color: shadowColor,
                              //           blurRadius: 5,
                              //         ),
                              //       ],
                              //       color: bgColor,
                              //       borderRadius: BorderRadius.circular(20)),
                              //   child: Padding(
                              //     padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              //     child: Row(
                              //       children: [
                              //         Image.asset(
                              //           "assets/images/ffb.png",
                              //           height: 20,
                              //         ),
                              //         SizedBox(
                              //           width: 6,
                              //         ),
                              //         Text("Facebook"),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _submit();
                                });
                              },
                              // onTap: () => _submit(),
                              // onTap: () => Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       // setState(() {
                              //       //   _submit();
                              //       // });
                              //       return BottomNavScreen();
                              //     },
                              //   ),
                              // ),
                              child: Container(
                                height: 60,
                                width: 320,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: shadowColor,
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color: secondarycolor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?  ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterScreen();
                                  },
                                ),
                              ),
                              child: Text(
                                "Sign up",
                                style: TextStyle(color: secondarycolor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // ),
                  ],
                ),
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
