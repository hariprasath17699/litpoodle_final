import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  bool isChecked = false;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  // final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();
  TextEditingController regfirstname = new TextEditingController();
  TextEditingController reglastname = new TextEditingController();
  TextEditingController regemail = new TextEditingController();
  TextEditingController regpassword = new TextEditingController();
  TextEditingController regconfpwsd = new TextEditingController();

  var key = "null";
  var encryptedText, plainText;

  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String _fname, _lname, _email, _password;

  bool autovalidate = false;
  FocusNode lnameFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode pswdFocusNode = new FocusNode();
  FocusNode cpswdFocusNode = new FocusNode();
  final LocalStorage storage = new LocalStorage('litpoodle');
  Future<void> _submit() async {
    // ignore: unused_local_variable
    DateTime now = DateTime.now();
    var currentTime =
        new DateTime(now.year, now.month, now.day, now.hour, now.minute);
    // Text('$currentTime');

    //  print(currentTime);

    final form = formKey.currentState;
    var headers = {'Cookie': 'ci_session=k8vvg9rcig29a105jakv67fqfoq1o1eo'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$domain_url/api/user/login/user_register'));
    request.fields.addAll({
      'firstname': regfirstname.text,
      'lastname': reglastname.text,
      'email': regemail.text,
      'password': regpassword.text,
      'registered_on': currentTime.timeZoneName
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = true;
        form.save();
        storage.setItem("login", "true");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
      print(response.reasonPhrase);

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      print(await response.stream.bytesToString());
      print("error");

      print(currentTime);
    }

    // if (form.validate()) {
    //   setState(
    //     () {
    //       _isLoading = true;
    //       form.save();
    //       // print(loginemailtext);
    //       // print(loginpassword);
    //       // _presenter.doLogin(_email, _password);
    //       // Navigator.of(context).push(
    //       //   MaterialPageRoute(builder: (context) => MyHomePage()),
    //       // );
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      // appBar: AppBar(
      //   backgroundColor: null,
      //   elevation: 0,
      //   leading: IconButton(
      //     // onPressed: () {
      //     //   // Navigator.pop(context);
      //     //   Navigator.of(context).push(
      //     //     MaterialPageRoute(builder: (context) => CalenderScreen()),
      //     //   );
      //     // },
      //     icon: Icon(Icons.arrow_back_ios_new_outlined),
      //   ),
      // ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1100),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Container(
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("assets/icons/logo.png"),
                //     fit: BoxFit.contain,
                //   ),
                // ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
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

                                // SizedBox(
                                //   height: 200,
                                // ),

                                Row(
                                  children: [
                                    Back(),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "Register",
                                            style: TextStyle(
                                                fontSize: 30, height: 1.5),
                                          ),
                                          Text(
                                            "Create your new account",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                height: 1.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context)
                                          .requestFocus(lnameFocusNode);
                                    },
                                    cursorColor: secondarycolor,
                                    controller: regfirstname,
                                    validator: (val) {
                                      // if (value.isEmpty) {
                                      //   return 'Enter a notes!';
                                      // }
                                      if (val == null || val.isEmpty) {
                                        return '* Please enter Firstname';
                                      }

                                      return null;
                                    },
                                    style: const TextStyle(
                                        fontSize: 12, height: 1.5),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      hintText: 'Firstname',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondarycolor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    focusNode: lnameFocusNode,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context)
                                          .requestFocus(emailFocusNode);
                                    },
                                    controller: reglastname,
                                    validator: (val) {
                                      // if (value.isEmpty) {
                                      //   return 'Enter a notes!';
                                      // }
                                      if (val == null || val.isEmpty) {
                                        return '* Please enter Lastname';
                                      }

                                      return null;
                                    },
                                    cursorColor: secondarycolor,
                                    style: const TextStyle(
                                        fontSize: 12, height: 1.5),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      hintText: 'Lastname',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondarycolor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    focusNode: emailFocusNode,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context)
                                          .requestFocus(pswdFocusNode);
                                    },
                                    controller: regemail,
                                    onSaved: (val) => _email = val,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return '* Please enter your email';
                                      }
                                      if (val != regemail.text) {
                                        return '* Please enter valid email';
                                      }
                                      if (!reg.hasMatch(regemail.text)) {
                                        return "* Please enter your valid email id";
                                      }

                                      return null;
                                    },
                                    cursorColor: secondarycolor,
                                    style: const TextStyle(
                                        fontSize: 12, height: 1.5),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mail_rounded,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      hintText: 'Email Id',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondarycolor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    focusNode: pswdFocusNode,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context)
                                          .requestFocus(cpswdFocusNode);
                                    },
                                    controller: regpassword,
                                    validator: (value) {
                                      // if (value.isEmpty) {
                                      //   return 'Enter a notes!';
                                      // }
                                      if (value == null || value.isEmpty) {
                                        return '* Please enter password';
                                      }
                                      return null;
                                    },
                                    cursorColor: secondarycolor,
                                    style: const TextStyle(
                                        fontSize: 12, height: 1.5),
                                    obscureText: !this._showPassword1,
                                    decoration: InputDecoration(
                                      focusColor: secondarycolor,

                                      hintText: "Password",
                                      // labelText: 'password',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondarycolor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      prefixIcon: Icon(
                                        Icons.lock_rounded,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: this._showPassword1
                                              ? secondarycolor
                                              : Colors.grey,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() => this._showPassword1 =
                                              !this._showPassword1);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: regconfpwsd,
                                    focusNode: cpswdFocusNode,
                                    validator: (value) {
                                      // if (value.isEmpty) {
                                      //   return 'Enter a notes!';
                                      // }
                                      if (value == null || value.isEmpty) {
                                        return '* Please enter confirm password';
                                      }
                                      if (value != regpassword.text) {
                                        return "* Password Not match";
                                      }
                                      return null;
                                    },
                                    cursorColor: secondarycolor,
                                    style: const TextStyle(
                                        fontSize: 12, height: 1.5),
                                    obscureText: !this._showPassword2,
                                    decoration: InputDecoration(
                                      focusColor: secondarycolor,

                                      hintText: "Confirm Password",
                                      // labelText: 'password',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 5),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondarycolor),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      prefixIcon: Icon(
                                        Icons.lock_rounded,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: this._showPassword2
                                              ? secondarycolor
                                              : Colors.grey,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() => this._showPassword2 =
                                              !this._showPassword2);
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Transform.scale(
                                      scale: 0.8,
                                      child: Checkbox(
                                        activeColor: secondarycolor,
                                        // focusColor: secondarycolor,
                                        //overlayColor: Colors.grey[50],
                                        // hoverColor: secondarycolor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        value: isChecked,
                                        checkColor: Colors.white,
                                        //fillColor: MaterialStateProperty.resolveWith(),
                                        onChanged: (value) {
                                          isChecked = !isChecked;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Text(
                                      "I Agree to the ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    // Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "Terms",
                                          style:
                                              TextStyle(color: secondarycolor),
                                        ),
                                        Text(
                                          " & ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "Conditions",
                                          style:
                                              TextStyle(color: secondarycolor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Divider(
                                          thickness: 1.5,
                                        ),
                                      )),

                                      //const EdgeInsets.symmetric(horizontal: 10),
                                      Text(
                                        "or",
                                        style: TextStyle(color: Colors.grey),
                                      ),

                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: Divider(
                                            thickness: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    30,
                                    0,
                                    30,
                                    10,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              new BoxShadow(
                                                color: shadowColor,
                                                blurRadius: 5,
                                              ),
                                            ],
                                            color: bgColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 2, 10, 2),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/gmail.png",
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("Google"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 35,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              new BoxShadow(
                                                color: shadowColor,
                                                blurRadius: 5,
                                              ),
                                            ],
                                            color: bgColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 2, 10, 2),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/ffb.png",
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text("Facebook"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () => _submit(),
                                      // onTap: () {
                                      //   setState(() {
                                      //     _submit();
                                      //   });
                                      // },
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
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Center(
                                            child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return LoginScreen();
                                          },
                                        ),
                                      ),
                                      child: Text(
                                        " Login",
                                        style: TextStyle(color: secondarycolor),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
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
