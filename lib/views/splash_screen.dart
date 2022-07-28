import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/views/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (_) => WelcomeScreen()),
        MaterialPageRoute(builder: (_) => OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
