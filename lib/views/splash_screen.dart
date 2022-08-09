import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/views/Nointernet.dart';
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
   ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
   StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    readJson();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  Future<void> initConnectivity() async {
     ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {

      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
    if(_connectionStatus == ConnectivityResult.mobile ||_connectionStatus == ConnectivityResult.wifi){
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
    }else
    {
      Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (_) => WelcomeScreen()),
        MaterialPageRoute(builder: (_) => NointernetScreen()),
      );
    }
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