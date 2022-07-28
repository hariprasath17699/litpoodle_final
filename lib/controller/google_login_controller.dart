import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount googleAccount;

  login() async {
    googleAccount = await _googleSignIn.signIn();
    notifyListeners();
  }

  logout() async {
    googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}
