import 'dart:async';
import 'dart:convert';
import 'dart:ui';
//import 'package:focus_chronicle/ads/google/AdState.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import 'config.dart';
import 'helpers/focus_localizations.dart';
import 'helpers/wordpress.dart';
import 'models/post_model.dart';
import 'models/category_model.dart';
import 'helpers/helpers.dart';
import 'screens/home_screen.dart';
import 'screens/single_post.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   final initFuture = MobileAds.instance.initialize();
//   final adState = AdState(initFuture);

//   runApp(Provider.value(
//     value: adState,
//     builder: (context, child) => DecoNews(),
//   ));
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DecoNews(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => DecoNews()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/splash.png',
//               width: MediaQuery.of(context).size.width * .4,
//             ),
//             Image.asset(
//               'images/logo.png',
//               height: 50,
//               //width: MediaQuery.of(context).size.width * .4,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFaf8521)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore: unused_element
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

class DecoNews extends StatefulWidget {
  static final navKey = new GlobalKey<NavigatorState>();
  static final scaffoldKey = new GlobalKey<ScaffoldState>();
  static _DecoNewsState of(BuildContext context) =>
      context.findAncestorStateOfType<_DecoNewsState>();
  const DecoNews({Key navKey}) : super(key: navKey);

  @override
  _DecoNewsState createState() => _DecoNewsState();
}

class _DecoNewsState extends State<DecoNews> {
  /// Keeps index of selected item from drawer
  int _selectedDrawerItem = 0;

  /// Theme brightness
  Brightness _brightness;

  /// Right to left language support
  bool _rtlEnabled = false;

  // BannerAd banner;

  // InterstitialAd interstitialAd;

  /// Firebase messaging
  //static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    /// set default app theme
    _setDefaultBrightness();

    ///init runtime RTL support
    _setDefaultRTLSupport();

    /// init push notifications
    //_initPushNotifications();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (Config.adMobEnabled) {
  //     final adState = Provider.of<AdState>(this.context);
  //     adState.initialization.then((status) => {
  //           setState(() => {
  //                 if (Config.adMobEnabled)
  //                   {
  //                     banner = BannerAd(
  //                       adUnitId: adState.bannerAdUnitId,
  //                       size: AdSize.smartBanner,
  //                       listener: AdListener(),
  //                       request: AdRequest(),
  //                     )..load()
  //                   },
  //                 if (Config.adMobShowInterstitialAd)
  //                   {
  //                     interstitialAd = InterstitialAd(
  //                       adUnitId: adState.interstitialAdUnitId,
  //                       listener: AdListener(
  //                           onAdLoaded: (ad) => {interstitialAd.show()}),
  //                       request: AdRequest(),
  //                     )..load()
  //                   }
  //               })
  //         });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: Colors.grey.shade200,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // getToken();
    return Padding(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _getLocale(),
          navigatorKey: DecoNews.navKey,
          title: Config.appTitle,
          theme: ThemeData(
            // primarySwatch: Color(0xFFfaca28),
            brightness: _brightness,
            canvasColor: _brightness == Brightness.dark
                ? Color(0xFF000000)
                : Color(0xFFFAFAFA),
            primaryColor: _brightness == Brightness.dark
                ? Color(0xFF000000)
                : Color(0xFFFFFFFF),
          ),
          localizationsDelegates: <LocalizationsDelegate>[
            //add custom localizations delegate
            const DecoLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: _getLocalesFromLocaleCodes(),
          builder: (BuildContext context, Widget child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          ),
          home: Column(
            children: [
              Expanded(child: HomeScreen()),
              // if (banner != null)
              //   Container(
              //     height: 50,
              //     child: AdWidget(ad: banner),
              //   )
            ],
          ),
        ),
        padding: EdgeInsets.all(0));
  }

  Locale _getLocale() {
    Locale locale = Locale(Config.defaultLocale);

    if (_rtlEnabled) locale = Locale('ar');

    return locale;
  }

  /// Adds locales to the locale list
  List<Locale> _getLocalesFromLocaleCodes() {
    List<Locale> locales = [Locale(Config.defaultLocale)];

    if (Config.defaultLocale != 'ar')
      locales.add(Locale('ar'));
    else
      locales.add(Locale('en'));

    return locales;
  }

  /// Returns index of selected item in drawer
  int getSelected() {
    return _selectedDrawerItem;
  }

  /// Updates index of selected item in drawer
  void setSelected(int index) {
    _selectedDrawerItem = index;
  }

  /// On app launch set correct theme color
  void _setDefaultBrightness() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String brightness = (prefs.getString('brightness') ?? '');

    if (brightness != 'light' && brightness != 'dark') {
      brightness = Config.defaultColor == 'dark' ? 'dark' : 'light';
    }

    setBrightness(brightness == 'dark' ? Brightness.dark : Brightness.light);
  }

  /// Change theme color
  Future<void> setBrightness(Brightness brightness) async {
    setState(() {
      _brightness = brightness;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'brightness', brightness == Brightness.dark ? 'dark' : 'light');
  }

  /// On app launch set correct text and screen direction support
  void _setDefaultRTLSupport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRTLEnabled = (prefs.getBool('isRTLEnabled') ?? null);

    if (isRTLEnabled == null) {
      isRTLEnabled = Config.defaultLocale == 'ar';
    }

    setRTLSettings(isRTLEnabled);
  }

  /// Change right to left support settings
  Future<void> setRTLSettings(bool enabled) async {
    setState(() => _rtlEnabled = enabled);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRTLEnabled', enabled);
  }

  /// init push notifications
  // Future<void> _initPushNotifications() async {
  //   if (!Config.pushNotificationsEnabled) {
  //     return;
  //   }

  //   RemoteMessage initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     _processPushNotification(message);
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     _processPushNotification(message);
  //   });

  //   if (initialMessage?.data != null) {
  //     _processPushNotification(initialMessage?.data);
  //   }

  //   if (Platform.isIOS) {
  //     iOSPermission();
  //   }

  //SharedPreferences prefs = await SharedPreferences.getInstance();
  // firebaseMessaging.getToken().then((token) {
  //   if (prefs.getBool('isPushNotificationEnabled') ?? true) {
  //     setSubscription(true);
  //   }
  // });
  //}

  void _processPushNotification(payload) async {
    // get context
    final context = DecoNews.navKey.currentState.overlay.context;

    // debug lines
    // print('Processing push notification. Payload:');
    // print(payload);
    // print(payload['data']);
    // print(payload['data']['post_id']);

    // show loading message
    showLoadingDialog(context);

    // get post id
    int postID = int.parse(payload['data']['post_id']);

    try {
      // get post data by id
      Response postResponse = await WordPress.fetchPost(postID);
      var postData = jsonDecode(postResponse.body);

      // get category data
      var categoryID = postData['categories'][0];
      Response categoryResponse =
          await WordPress.fetchCategory(categoryID.toString());
      var categoryData = jsonDecode(categoryResponse.body);

      CategoryModel category = CategoryModel.fromJson(categoryData[0]);
      PostModel post = PostModel.fromJson(postData, category);

      // close dialog and open article
      Navigator.of(context, rootNavigator: true).pop('dialog');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SinglePost(post),
      ));
    } catch (exception) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      // ignore: deprecated_member_use
      DecoNews.scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('An error occured loading post data!'),
        duration: Duration(seconds: 5),
      ));
    }
  }

  /// ask for permission on iOS
  void iOSPermission() async {
    // await firebaseMessaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
  }

  // void getToken() async {
  //   print(await firebaseMessaging.getToken());
  // }

  // setSubscription(value) {
  //   value ? _subscribe() : _unsubscribe();
  //   _setSettingToStorage(value);
  // }

  // static _subscribe() {
  //   firebaseMessaging.subscribeToTopic('Focus Chronicle');
  // }

  // static _unsubscribe() {
  //   firebaseMessaging.unsubscribeFromTopic('Focus Chronicle');
  // }

  static void _setSettingToStorage(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPushNotificationEnabled', value);
  }
}
