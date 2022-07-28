// import 'package:firebase_admob/firebase_admob.dart';

//import 'package:focus_chronicle/widgets/category.dart';

class Config {
  /// Define your app title here
  static const appTitle = 'Litpoodle';

  /// Define your WordPress API url here
  static final apiEndpoint = 'https://www.litpoodle.com/blog/wp-json/wp/v2';

  /// Define your default color (light or dark)
  // static final defaultColor = 'dark';
  static final defaultColor = 'light';

  /// Define your default locale
  // static final defaultLocale = 'ar';
  static final defaultLocale = 'en';

  /// Define category IDs which you want to exclude
  static final excludeCategories = [];
  //static final excludeCategories = [28, 30, 361, 27, 4, 1, 36];

  /// Define home page category id if you want only one to be displayed instead of category tabs
  static final homePageCategory = 144;

  /// Enable push notifications
  // static final pushNotificationsEnabled = true;

  /// AdMob settings
  // static final adMobEnabled = false;
  // static final adMobShowInterstitialAd = false;
  // static final bannerAdMobiOSAppID = 'ca-app-pub-3940256099942544/2934735716';
  // static final bannerAdMobAndroidID = 'ca-app-pub-3940256099942544/6300978111';
  // static final interstitalAdMobiOSAppID =
  //     'ca-app-pub-3940256099942544/4411468910';
  // static final interstitalAdMobAndroidID =
  //     'ca-app-pub-3940256099942544/1033173712';
}
