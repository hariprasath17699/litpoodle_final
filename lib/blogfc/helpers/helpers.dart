import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'focus_localizations.dart';

/// Show loading message
void showLoadingDialog(context) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  isDark ? Colors.white : Color(0xFF1B1E28))),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
            child: Text(
              DecoLocalizations.of(context)
                  .localizedString("dialog_please_wait"),
              style: TextStyle(
                  color: isDark ? Colors.white : Color(0xFF1B1E28),
                  fontSize: 14,
                  height: 16 / 14),
            ),
          )
        ],
      ),
    ),
  );
}

/// Show error messages
void showErrorDialog(context, String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child:
              Text(DecoLocalizations.of(context).localizedString("dialog_ok")),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

String localizedDate(context, String date) {
  return DateFormat("d MMM y", Localizations.localeOf(context).languageCode)
      .format(DateTime.parse(date));
}
