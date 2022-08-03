// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:litpoodle/components/colors.dart';
// // import 'package:litpoodle/screens/login_screen.dart';

// // class BottomNavBar extends StatefulWidget {
// //   @override
// //   _BottomNavBarState createState() => _BottomNavBarState();
// // }

// // class _BottomNavBarState extends State<BottomNavBar> {
// //   int _page = 0;
// //   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

// //   final screens = [
// //     // LoginScreen(),
// //     // LoginScreen(),
// //     // LoginScreen(),
// //     // LoginScreen(),
// //     // LoginScreen(),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBody: true,
// //       // body: screens[_page],
// //       bottomNavigationBar: Theme(
// //         data: Theme.of(context)
// //             .copyWith(iconTheme: IconThemeData(color: Colors.white)),
// //         child: CurvedNavigationBar(
// //           key: _bottomNavigationKey,
// //           index: 0,
// //           height: 60.0,
// //           items: <Widget>[
// //             Icon(
// //               Icons.home,
// //               size: 20,
// //             ),
// //             Icon(Icons.favorite_rounded, size: 20),
// //             Icon(Icons.location_on_rounded, size: 20),
// //             Icon(Icons.shopping_cart_rounded, size: 20),
// //             Icon(Icons.perm_identity, size: 20),
// //           ],
// //           color: secondarycolor,
// //           buttonBackgroundColor: secondarycolor,
// //           backgroundColor: Colors.transparent,
// //           animationCurve: Curves.easeInOut,
// //           animationDuration: Duration(milliseconds: 600),
// //           onTap: (index) {
// //             setState(() {
// //               _page = index;
// //             });
// //           },
// //           letIndexChange: (index) => true,
// //         ),
// //       ),
// //       // body: Container(
// //       //   color: Colors.blueAccent,
// //       //   child: Center(
// //       //     child: Column(
// //       //       mainAxisAlignment: MainAxisAlignment.center,
// //       //       children: <Widget>[
// //       //         Text(_page.toString(), textScaleFactor: 10.0),
// //       //         ElevatedButton(
// //       //           child: Text('Go To Page of index 1'),
// //       //           onPressed: () {
// //       //             final CurvedNavigationBarState navBarState =
// //       //                 _bottomNavigationKey.currentState;
// //       //             navBarState?.setPage(1);
// //       //           },
// //       //         )
// //       //       ],
// //       //     ),
// //       //   ),
// //       // ),
// //     );
// //   }
// // }

// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:litpoodle/components/colors.dart';
// import 'package:litpoodle/screens/login_screen.dart';
// import 'package:litpoodle/views/login_signup_screen.dart';

// class HelloConvexAppBar extends StatelessWidget {
//   //final index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: MaterialApp(

//       //   initialRoute: "/",
//       //   routes: {
//       //     "/": (_) => LoginSignup(),
//       //     "//": (BuildContext context) => LoginScreen(),
//       //     "///": (BuildContext context) => LoginSignup(),
//       //     "////": (BuildContext context) => LoginScreen(),
//       //     "/////": (BuildContext context) => LoginSignup(),
//       //   },
//       // ),
//       //Center(
//       //child: TextButton(
//       //  child: Text('Click to show full example'),
//       // onPressed: () => Navigator.of(context).pushNamed('/bar'),
//       // )),
//       bottomNavigationBar: ConvexAppBar(
//         backgroundColor: secondarycolor,
//         style: TabStyle.react,
//         items: [
//           TabItem(
//             icon: Icons.home,
//             title: "Home",
//           ),
//           TabItem(icon: Icons.favorite_rounded, title: "Wishlist"),
//           TabItem(icon: Icons.location_on_rounded, title: "Visitlist"),
//           TabItem(icon: Icons.shopping_cart_rounded, title: "Buylist"),
//           TabItem(icon: Icons.perm_identity, title: "Dashboard"),
//         ],
//         initialActiveIndex: 0,
//         onTap: (int i) => print('click index=$i'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/bottom/buylist_screen.dart';
import 'package:litpoodle/screens/bottom/choose_city_buylist.dart';
import 'package:litpoodle/screens/bottom/choose_wishlist_city.dart';
import 'package:litpoodle/screens/bottom/choosed_city_visitlist.dart';
import 'package:litpoodle/screens/bottom/dashboard_screen.dart';
import 'package:litpoodle/screens/bottom/home_screen.dart';
import 'package:litpoodle/screens/bottom/visitlist_screen.dart';
import 'package:litpoodle/screens/bottom/wishlist_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final tabs = [
    HomeScreen(),
    //WishlistScreen(),
    ChoosedCityWishlist(),
    ChoosedCityVisitList(),
    // VisitlistScreen(),
    //BuyListScreen(),
    ChoosedCityBuylist(),
    DashboardScreen(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        unselectedFontSize: 10,
        iconSize: 20,
        selectedFontSize: 12,
        selectedItemColor: secondarycolor,
        selectedIconTheme: IconThemeData(
          color: secondarycolor,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              // decoration: BoxDecoration(
              //     color: secondarycolor,
              //     borderRadius: BorderRadius.circular(14)),
              child: Icon(
                Icons.home_outlined,
                //  color: secondarycolor,
              ),
            ),
            label: "Home",
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline_outlined,
            ),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label: "Visitlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: "Buylist",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
            ),
            label: "Dashboard",
          ),
        ],
        onTap: (current_index) {
          setState(() {
            index = current_index;
          });
        },
      ),
    );
  }
}
