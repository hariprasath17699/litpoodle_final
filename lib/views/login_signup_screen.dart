import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/login_screen.dart';
import 'package:litpoodle/screens/register_screen.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key key}) : super(key: key);

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ls-bg1.png"),
            fit: BoxFit.fitHeight,
            // colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcOver)
            // fit: BoxFit.contain,
          ),
        ),
        child: Column(
          children: [
            Container(
              // height: 50,
              // width: 250,
              //  width: double.infinity,
              //height: MediaQuery.of(context).size.,

              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(8),
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 10, vertical: 50),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 50),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 1100),
                            child: const Text(
                              "Wealth\nthrough\nReal-estate",
                              style: TextStyle(
                                  fontSize: 42,
                                  height: 1.5,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      //)
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterScreen();
                            },
                          ),
                        ),
                        child: Container(
                          height: 60,
                          width: 320,
                          decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: shadowColor,
                                  //blurRadius: 2,
                                ),
                              ],
                              color: white,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: secondarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 900),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        ),
                        child: Container(
                          height: 60,
                          width: 320,
                          decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: shadowColor,
                                  //   blurRadius: 2,
                                ),
                              ],
                              color: secondarycolor,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
