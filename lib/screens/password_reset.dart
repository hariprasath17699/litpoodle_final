import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/forget_pswd_mail_sent_screen.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Scaffold(
          body: FadeInUp(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 1100),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                          "Password Reset",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Current Password"),
                          ),
                          TextField(
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              // hintText: 'Email Id',
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("New Password"),
                          ),
                          TextField(
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              // hintText: 'Email Id',
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Confirm Password"),
                          ),
                          TextField(
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              // hintText: 'Email Id',
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Center(
                        child: InkWell(
                          // onTap: () => Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return const ForgetPasswordMailSent();
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
                              "Save Changes",
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                    ),
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
