import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/controller/onboarding_controller.dart';
import 'package:litpoodle/views/login_signup_screen.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key key}) : super(key: key);
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 1000),
                        child: Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 1100),
                        child: Text(
                          _controller.onboardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 1150),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                height: 1.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              // bottom: 20,
              //left: 20,
              top: 20,
              right: 30,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginSignup();
                        },
                      ),
                    ),
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                          color: secondarycolor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginSignup();
                        },
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: secondarycolor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              // left: 150,
              right: 150,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      //  alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.all(4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? secondarycolor
                              : Colors.grey,
                          shape: BoxShape.circle),

                      //   ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: InkWell(
                onTap: _controller.forwardAction,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: secondarycolor,
                ),
              ),
              // child: FloatingActionButton(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   onPressed: _controller.forwardAction,
              //   // child: Text("Next"),
              //   child: const Icon(
              //     Icons.arrow_forward_ios_outlined,
              //     color: secondarycolor,
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
