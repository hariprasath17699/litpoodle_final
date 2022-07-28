import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/controller/google_login_controller.dart';
import 'package:litpoodle/screens/bottom/bottom_navigation_screen.dart';
import 'package:litpoodle/screens/login_screen.dart';
import 'package:litpoodle/views/login_signup_screen.dart';

import 'package:litpoodle/views/onboard_screen.dart';
import 'package:litpoodle/views/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // dynamic token = FlutterSession().get("token");
  //runApp(MyApp());
  dynamic token = await FlutterSession().get("token");
  print("err $token");
  runApp(MyApp());
  // runApp(MaterialApp(home: token != '' ? BottomNavScreen() : MyApp()));
  //runApp(token != '' ? BottomNavScreen() : MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // dynamic token = FlutterSession().get("token");
  // runApp(token != '' ? BottomNavScreen() : MyApp());
  MyApp({Key key}) : super(key: key);
  //dynamic token = FlutterSession().get('token');

  //runApp(token != '' ? BottomNavScreen() : MyApp());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: Colors.grey.shade200,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginScreen(),
          ),
        ],
        child: GetMaterialApp(
          // routes: <String, WidgetBuilder>{
          //   '/loginsignup': (BuildContext context) => LoginSignup(),
          // },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Poppins",
            backgroundColor: bgColor,
          ),
          home: SplashScreen(),
        ));
    // home: token != '' ? BottomNavScreen() : SplashScreen()
    // home: token == null ? SplashScreen() : BottomNavScreen());
  }
}
///////////////
