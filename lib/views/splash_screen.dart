import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/views/onboard_screen.dart';
import 'package:localstorage/localstorage.dart';

import '../screens/bottom/bottom_navigation_screen.dart';
List<Continent> continentOptions=[] ;
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
    readJson();
    Timer(const Duration(seconds: 3), () {
      if (storage.getItem("login") == "true") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (_) => WelcomeScreen()),
          MaterialPageRoute(builder: (_) => OnboardingPage()),
        );
      }
    });
  }

  Future<void> readJson() async {
    print("posts123466789");
    String response = await rootBundle.loadString('asset/convertcsv.json');
    print("posts........");

    var data = await json.decode(response);
    // print("data");
    //  print(data);
    print(data['city'][0]["undefined"]);
    print("data.length");
    print(data['city'].length);
    print(data['city'][0]);
    setState(() {
      //try from here changed from data.length to data['city'].length
      for (int i = 0; i < data['city'].length; i++) {
        continentOptions.add(Continent(
            name: data['city'][i]["undefined"],
            pin: data['city'][i]["combain_name"]));
      }

      //  for (int i = 0; i < data['city'].length; i++) {
      //   citys.add(data['city'][i]["undefined"]);
      // }
      // posts = data['city'].map((data) => City.fromJson(data)).toList();
    });
    //  print("posts");
    //  print(posts);
    print("citys1");
    print(continentOptions);
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