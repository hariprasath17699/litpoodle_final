import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_html/html_parser.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../helpers/focus_localizations.dart';
import '../widgets/focuschronicle_appbar.dart';
import '../widgets/focus_news_drawer.dart';
//import 'package:flutter_linkify/flutter_linkify.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: DecoNewsAppBar(),
      //  drawer: DecoNewsDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
              child: Image.asset(
                'images/launcher.png',
                width: 130,
              ),
            ),
            Container(
              color: Colors.black,
              width: 130,
              height: 28,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                // child: Text(
                //   'Focus Chronicle',
                //   style: TextStyle(
                //     color: isDark ? Colors.white : Color(0xFF1B1E28),
                //     fontSize: 20.0,
                //   ),
                // ),
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                  width: 170,
                ),
              ),
            ),
            Container(
              width: 220.0,
              padding: EdgeInsets.only(
                bottom: 60.0,
              ),
              child: Text(
                '-Unveiling the Chronicles',
                style: TextStyle(
                  color: Color(0xFF7F7E96),
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: isDark ? Color(0xFF1B1E28) : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          DecoLocalizations.of(context).localizedString(
                              "Focus Chronicle provides Exclusive Breaking news from India and around the world in Political news, Lifestyle, Beauty, Clothing, Travel, Health and Fitness, Culture, Business, Food, Review, Fashion, News Headlines, Entertainment, and Technology."),
                          style: TextStyle(
                            color: isDark ? Colors.white : Color(0xFF1B1E28),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: isDark ? Color(0xFF1B1E28) : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            DecoLocalizations.of(context).localizedString(
                                "Support - support@focuschronicle.com"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF3959C4),
                              // color: isDark ? Colors.white : Color(0xFF3959C4),
                              fontSize: 16.0,
                            ),
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
      ),
    );
  }
}
