import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';

class Back extends StatelessWidget {
  const Back({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: shadowColor,
                blurRadius: 5,
              ),
            ],
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: secondarycolor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
