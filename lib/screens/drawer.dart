import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/blogfc/deconews.dart';

// import 'package:litpoodle/blog_fc/main1.dart';
import 'package:litpoodle/drawer/activity_history.dart';
import 'package:litpoodle/drawer/blog.dart';
import 'package:litpoodle/drawer/faq.dart';
import 'package:litpoodle/drawer/intro.dart';
import 'package:litpoodle/screens/property_dashboard/property_dashboard.dart';
import 'package:litpoodle/main.dart';
import 'package:litpoodle/screens/bottom/buylist_screen.dart';
import 'package:litpoodle/screens/bottom/choose_city_buylist.dart';
import 'package:litpoodle/screens/bottom/choose_wishlist_city.dart';
import 'package:litpoodle/screens/bottom/choosed_city_visitlist.dart';
import 'package:litpoodle/screens/bottom/visitlist_screen.dart';
import 'package:litpoodle/screens/bottom/wishlist_screen.dart';
import 'package:litpoodle/screens/notificationscreen.dart';
import 'package:litpoodle/screens/profile_screen/profile.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key key, ListView child}) : super(key: key);

// final String title;

  @override
  Widget build(BuildContext context) {
    // Widget MyDrawer({SizedBox drawer}) {
    return SizedBox(
      // height: 650,
      height: MediaQuery.of(context).size.height - 115,
      width: MediaQuery.of(context).size.width *
          0.80, // 75% of screen will be occupied
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Drawer(
            child: Container(
              child: ListView(
                //   addSemanticIndexes: true,

                // Important: Remove any padding from the ListView.
                //  padding: EdgeInsets.zero,
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                ),
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close_outlined)),
                          ),
                        ],
                      )
                    ],
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ChoosedCityWishlist()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Wishlist',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ChoosedCityVisitList()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Visitlist',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChoosedCityBuylist();
                        },
                      ),
                    ),
                    leading: Container(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Buylist',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ActivityHistoryPage();
                        },
                      ),
                    ),
                    leading: Container(
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activity History',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProperyDashBoardPage();
                        },
                      ),
                    ),
                    leading: Container(
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Property Dashboard',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      )),
                    ],
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notification',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => IntroPage()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Intro',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => BlogPage()),
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DecoNews()),
                      );
                    },
                    leading: Container(
                      child: Icon(
                        Icons.new_releases_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Blog',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FAQ();
                        },
                      ),
                    ),
                    leading: Container(
                      child: Icon(
                        Icons.support_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'FAQ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return Help();
                    //     },
                    //   ),
                    // ),
                    leading: Container(
                      child: Icon(
                        Icons.logout_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
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
    );
  }
}
