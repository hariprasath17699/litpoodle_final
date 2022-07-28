import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/forgetpassword_screen.dart';
import 'package:litpoodle/screens/login_screen.dart';

class ForgetPasswordMailSent extends StatefulWidget {
  final User value;
  const ForgetPasswordMailSent({Key key, this.value}) : super(key: key);

  @override
  _ForgetPasswordMailSentState createState() => _ForgetPasswordMailSentState();
}

class _ForgetPasswordMailSentState extends State<ForgetPasswordMailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1100),
          child: SingleChildScrollView(
            child: SafeArea(
              // child: GestureDetector(
              //   onTap: () {
              //     FocusScope.of(context).requestFocus(new FocusNode());
              //   },
              child: Column(
                children: [
                  Row(
                    children: [
                      Back(),
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/images/mail.png",
                      height: 100,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'An email has sent with a link to reset',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'your Password',
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Email sent to',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      Text(
                        ' ${widget.value.email}',
                        // 'xxxxxxxxx@gmail.com',
                        style: TextStyle(
                            color: secondarycolor, fontSize: 16, height: 1.5),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Know your Password ? '),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            ),
                            child: Text(
                              'Sign in now',
                              style: TextStyle(color: secondarycolor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
