import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/followsteps_screen.dart';
import 'package:litpoodle/screens/otp_screen.dart';
import 'package:litpoodle/screens/paymentscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScrollable extends StatefulWidget {
  const IntroScrollable({Key key}) : super(key: key);

  @override
  _IntroScrollableState createState() => _IntroScrollableState();
}

class _IntroScrollableState extends State<IntroScrollable> {
  ScrollController _mycontroller1 = new ScrollController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
      child: SingleChildScrollView(
        controller: _mycontroller1,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  height: 450.0,

                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  scrollPhysics: BouncingScrollPhysics(),
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: onch
                  //  onPageChanged: callbackFunction,
                  onPageChanged: (index, reason) =>
                      (setState(() => activeIndex = index)),
                ),
                items: [
                  // Container(
                  //   width: 300,
                  //   //width: MediaQuery.of(context).size.width,
                  //   margin: EdgeInsets.symmetric(horizontal: 0.0),

                  // child:
                  Container(
                    // decoration: BoxDecoration(
                    //   color: secondarycolor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        Text(
                          "One stop-shop",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // height: 100,
                          // width: ,
                          decoration: BoxDecoration(

                              // image: DecorationImage(
                              //   image: AssetImage("assets/images/intro/shop.PNG"),
                              //   fit: BoxFit.contain,
                              // ),
                              ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: SvgPicture.network(
                            'https://www.litpoodle.com/styles/img/home-svg/one-stop-shop.svg',
                            semanticsLabel: 'shop!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: Text(
                              "End to end solution for residential real investing (from identifying opportunities to property management) that makes investing as simple as 1-2-3.",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //////////
                  Container(
                    // decoration: BoxDecoration(
                    //   color: secondarycolor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "POODLE-O-METER INSIGHTS",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(

                            // width: ,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image:
                            //         AssetImage("assets/images/intro/meter.PNG"),
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: SvgPicture.network(
                            'https://www.litpoodle.com/styles/img/home-svg/poodle-o-meter.svg',
                            semanticsLabel: 'shop!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Get access to our proprietary metrics that will help you compare the returns between different homes and vis-à-vis other investment opportunities like S&P 500 and answer the most important question of ‘can this home make you a millionaire?’!!",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  ////
                  Container(
                    // decoration: BoxDecoration(
                    //   color: secondarycolor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Tracking TOOLS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            //  height: 100,
                            // width: ,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image:
                            //         AssetImage("assets/images/intro/track.PNG"),
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: SvgPicture.network(
                            'https://www.litpoodle.com/styles/img/home-svg/tracking-tools.svg',
                            semanticsLabel: 'shop!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Use our robust platform to track expenses, monitor performance of investments and analyze portfolio. Also we have a buying process tracker to keep you updated during the home purchasing stage.",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  ////
                  Container(
                    // decoration: BoxDecoration(
                    //   color: secondarycolor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "SPECIALIZED INVESTMENT METRICS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            // height: 100,
                            // // width: ,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image:
                            //         AssetImage("assets/images/intro/metrics.PNG"),
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: SvgPicture.network(
                            'https://www.litpoodle.com/styles/img/home-svg/specialist.svg',
                            semanticsLabel: 'shop!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "If you want answers to questions like how much you will gain by reinvesting the net cashflow or what will your return be if you want to sell at 10 years instead of 30 years, then don’t you worry - we got that covered!!",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  //////////
                  Container(
                    // decoration: BoxDecoration(
                    //   color: secondarycolor,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "EXPERT ADVICE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            // height: 100,
                            // // width: ,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image:
                            //         AssetImage("assets/images/intro/expert.PNG"),
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: SvgPicture.network(
                            'https://www.litpoodle.com/styles/img/home-svg/expert-advice.svg',
                            semanticsLabel: 'shop!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Stay tuned to our blog for tips and information on emerging areas for investment, optimizing your investment’s performance, etc.",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),

                  //  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: buildIndicator(),
            ),
            ///////////////
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect:
            ExpandingDotsEffect(dotHeight: 6, dotWidth: 5, activeDotColor: dot),
      );
}
