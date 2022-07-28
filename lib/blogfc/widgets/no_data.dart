import 'package:flutter/material.dart';
import '../helpers/focus_localizations.dart';

class NoData extends StatelessWidget {
  final String message;

  NoData(this.message);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Image.asset(
              'assets/images/poodle1.PNG',
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              DecoLocalizations.of(context).localizedString(""),
              style: TextStyle(
                color: isDark ? Colors.white : Color(0xFF1B1E28),
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            width: 220.0,
            child: Text(
              message,
              style: TextStyle(
                color: Color(0xFF7F7E96),
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class NoBookmark extends StatelessWidget {
  final String message;

  NoBookmark(this.message);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Image.asset(
              'assets/images/poodle1.PNG',
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              DecoLocalizations.of(context).localizedString(
                "You haven't added anything to your bookmarks",
              ),
              style: TextStyle(
                color: isDark ? Colors.white : Color(0xFF1B1E28),
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            width: 220.0,
            child: Text(
              message,
              style: TextStyle(
                color: Color(0xFF7F7E96),
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
