import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/views/Nointernet.dart';
import 'package:litpoodle/views/onboard_screen.dart';
import 'package:localstorage/localstorage.dart';

import '../screens/bottom/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalStorage storage = new LocalStorage('litpoodle');


  @override
  void initState() {


    super.initState();
    _internerCheck();
  }
_internerCheck()async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    Timer(const Duration(seconds: 3), () {
      if(storage.getItem("login") == "true"){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavScreen()),
        );
      }else{
        Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (_) => WelcomeScreen()),
          MaterialPageRoute(builder: (_) => OnboardingPage()),
        );
      }

    });
  } else {
    Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (_) => WelcomeScreen()),
      MaterialPageRoute(builder: (_) => Nointernet()),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        //backgroundColor: bgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/logo.png',

                        height: 300,
                        //width: 100,
                        width: MediaQuery.of(context).size.width * .8,
                      ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      // const Text(
                      //   "Vgenda",
                      //   style: TextStyle(
                      //     //color: Colors.white,
                      //     fontFamily: "AbadiMTStd-ExtraLight",
                      //     //color: kPrimaryColor,
                      //     fontSize: 35,
                      //     fontWeight: FontWeight.w800,
                      //   ),
                      // ),
                    ],
                  ),

                  // Text(
                  //   "Symptom Tracker",
                  //   style: TextStyle(
                  //       color: kPrimaryColor,
                  //       fontWeight: FontWeight.w800,
                  //       fontSize: 20),
                  // ),
                ],
              ),
              // Image.asset(
              //   'images/splash.png',
              //   width: MediaQuery.of(context).size.width * .4,
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              // Image.asset(
              //   'assets/images/logo.png',
              //   height: 50,
              //   width: MediaQuery.of(context).size.width * .4,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              const CircularProgressIndicator(
                // valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                valueColor: AlwaysStoppedAnimation<Color>(secondarycolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
