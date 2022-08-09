import 'package:flutter/material.dart';
import 'package:litpoodle/views/onboard_screen.dart';
import 'package:litpoodle/views/splash_screen.dart';
class NointernetScreen extends StatefulWidget {
  const NointernetScreen();

  @override
  State<NointernetScreen> createState() => _NointernetScreenState();
}

class _NointernetScreenState extends State<NointernetScreen> {
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
