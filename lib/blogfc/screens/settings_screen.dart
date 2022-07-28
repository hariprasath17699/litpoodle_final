import 'package:flutter/material.dart';
import 'package:litpoodle/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/focus_localizations.dart';
//import '../config.dart';
import '../widgets/focuschronicle_appbar.dart';
import '../widgets/focus_news_drawer.dart';
import '../deconews.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();

    _areNotificationsEnabled();

    //  _isRTLEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DecoNewsAppBar(),
      //drawer: DecoNewsDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.black.withOpacity(0.13)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(DecoLocalizations.of(context)
                      .localizedString("enable_push_notifications")),
                  Switch(
                    onChanged: (bool enabled) {
                      setState(() {
                        _notificationsEnabled = enabled;
                        // _updateNotifications(enabled);
                      });
                    },
                    value: _notificationsEnabled,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  DecoNews.of(context).setBrightness(Brightness.light);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  DecoLocalizations.of(context).localizedString("light_mode"),
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  DecoNews.of(context).setBrightness(Brightness.dark);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  DecoLocalizations.of(context).localizedString("dark_mode"),
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Checks are notifications enabled
  Future<void> _areNotificationsEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _notificationsEnabled =
          (prefs.getBool('isPushNotificationEnabled') ?? true);
    });
  }

  /// Enables or disables notifications
  // Future<void> _updateNotifications(bool enabled) async {
  //   DecoNews.of(context).setSubscription(enabled);
  // }
}
