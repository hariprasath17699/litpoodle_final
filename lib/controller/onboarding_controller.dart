import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:litpoodle/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:litpoodle/views/login_signup_screen.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  forwardAction() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease).obs;
    if (isLastPage == true) {
      Get.to(() => const LoginSignup());

      //move to homepage
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/1.png', 'One-Stop-Shop',
        'End to end solution for residential real investing that makes investment\n as simple as 1-2-3'),
    OnboardingInfo('assets/images/2.png', 'Investment Matrix',
        'How much you will gain by reinvesting\n the net cash or what will your return\n be if you want to sell at 10 years\n We got that covered!!'),
    OnboardingInfo('assets/images/3.png', 'Experts Advise',
        'Tips and informations emerging\n area for investment, Optimizing your\n Investment\'s performance, etc,')
  ];
}
