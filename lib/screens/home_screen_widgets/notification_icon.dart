import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/notificationscreen.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NotificationScreen()),
        );
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
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          child: Icon(
            Icons.notifications_rounded,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
