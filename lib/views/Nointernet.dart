import 'package:flutter/material.dart';
import 'package:litpoodle/views/onboard_screen.dart';
import 'package:litpoodle/views/splash_screen.dart';
class Nointernet extends StatefulWidget {
  const Nointernet();

  @override
  State<Nointernet> createState() => _NointernetState();
}

class _NointernetState extends State<Nointernet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_cellular_connected_no_internet_4_bar_outlined,size: 200,),
        GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(
                // MaterialPageRoute(builder: (_) => WelcomeScreen()),
                MaterialPageRoute(builder: (_) => SplashScreen()),
              );
            },
            child: Text('Retry'),),
        ],
      )),
    );
  }
}
