import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/forget_pswd_mail_sent_screen.dart';
import 'package:http/http.dart' as http;

class User {
  final String email;

  const User({
    this.email,
  });
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController loginemailtextforpassword = TextEditingController();
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool autovalidate = false;
  bool _isLoading = false;
  String _email;
  Future<void> _submit() async {
    final form = formKey.currentState;
    var headers = {'Cookie': 'ci_session=nmi51n6mpitu1l0dghbt5lsj97l00klf'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$domain_url/api/user/login/forgot_password'));
    request.fields.addAll({
      'email': loginemailtextforpassword.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = true;
        //form.save();
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new ForgetPasswordMailSent(
            value: User(
              email: loginemailtextforpassword.text,
            ),
          ),
        );
        Navigator.of(context).push(route);
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => ForgetPasswordMailSent()),
        // );
      });
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    if (form.validate()) {
      setState(
        () {
          _isLoading = true;
          //form.save();
          print(loginemailtextforpassword);

          // _presenter.doLogin(_email, _password);
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => MyHomePage()),
          // );
        },
      );
    }
  }

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
              child: SafeArea(
                // child: GestureDetector(
                //   onTap: () {
                //     FocusScope.of(context).requestFocus(new FocusNode());
                //   },
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enter your register email id",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: loginemailtextforpassword,
                          cursorColor: secondarycolor,
                          style: const TextStyle(fontSize: 12, height: 1.5),
                          onSaved: (val) => _email = val,
                          validator: (val) {
                            // if (value.isEmpty) {
                            //   return 'Enter a notes!';
                            // }
                            if (val == null || val.isEmpty) {
                              return '* Please enter your email';
                            }
                            if (val != loginemailtextforpassword.text) {
                              return '* Please enter valid email';
                            }
                            if (!reg.hasMatch(loginemailtextforpassword.text)) {
                              return "* Please enter your valid email id";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_rounded,
                              color: Colors.grey,
                              size: 20,
                            ),
                            hintText: 'Email Id',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(14)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: secondarycolor),
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 12, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Resend Code",
                              style: TextStyle(
                                color: secondarycolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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
                            onTap: () {
                              setState(() {
                                _submit();
                              });
                            },
                            //onTap: () => _submit(),
                            // onTap: () {
                            //   setState(() {
                            //     _submit();
                            //     // ForgetPasswordMailSent();
                            //   });
                            // },
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
                              width: 340,
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
                                "Send",
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
