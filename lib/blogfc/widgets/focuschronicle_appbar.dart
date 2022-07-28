import 'package:flutter/material.dart';
import 'package:litpoodle/blogfc/screens/categories_screen.dart';
import 'package:litpoodle/components/colors.dart';

import '../config.dart';

class DecoNewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final double elevation;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;

  DecoNewsAppBar(
      {Key key,
      this.title = Config.appTitle,
      this.centerTitle = true,
      this.elevation = 2.0,
      this.bottom,
      this.actions})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
          backgroundColor: secondarycolor,
          // backgroundColor: Colors.black,
          centerTitle: centerTitle,
          elevation: elevation,
          iconTheme: IconThemeData(color: Color(0xFFaf8521)),
          // title: Text(
          //   "",
          //   style: TextStyle(
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.w500,
          //       color: Colors.white),
          // ),
          title: GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return CategoriesScreen();
            //     },
            //   ),
            // ),
            child: Image.asset(
              'assets/icons/logo.png',
              fit: BoxFit.cover,
              height: 38,
            ),
          ),
          bottom: bottom,
          actions: actions),
    );
  }
}
