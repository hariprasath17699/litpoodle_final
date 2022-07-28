import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
        // child: CircularProgressIndicator(
        //   valueColor: AlwaysStoppedAnimation<Color>(isDark ? Colors.white : Color(0xFF1B1E28)),
        // )
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
          isDark ? secondarycolor : secondarycolor),
    ));
  }
}
