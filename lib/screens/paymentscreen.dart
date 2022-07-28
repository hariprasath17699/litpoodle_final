import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/forget_pswd_mail_sent_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;
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
                          width: 90,
                        ),
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 120,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Available Credits",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: secondarycolor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline_rounded),
                              Text(
                                " \$1 is converted to 10 credits",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
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
                            child: Text("Amount"),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              hintText: "0000.00",

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
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Card Details"),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              hintText: "Card Number",

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
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Expiration month/year"),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: secondarycolor,
                                      style: const TextStyle(
                                          fontSize: 12, height: 1.5),
                                      decoration: InputDecoration(
                                        hintText: "MM/YYYY",

                                        // hintText: 'Email Id',
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
                                            borderSide: BorderSide(
                                                color: secondarycolor),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("CVC"),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      // maxLength: 3,
                                      cursorColor: secondarycolor,
                                      style: const TextStyle(
                                          fontSize: 12, height: 1.5),
                                      decoration: InputDecoration(
                                        hintText: "000",

                                        // hintText: 'Email Id',
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
                                            borderSide: BorderSide(
                                                color: secondarycolor),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Card Holder Name"),
                          ),
                          TextField(
                            cursorColor: secondarycolor,
                            style: const TextStyle(fontSize: 12, height: 1.5),
                            decoration: InputDecoration(
                              hintText: "  Name",

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            //hoverColor: Colors.amber,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            activeColor: secondarycolor,
                            // focusColor: secondarycolor,
                            //overlayColor: Colors.grey[50],
                            // hoverColor: secondarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                          "save card details",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
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
                              "Continue",
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
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
