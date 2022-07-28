import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/drawer/intro_scrollable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String videoID = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=9k0EAZhd6dY&ab_channel=Litpoodle");

  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId:
  //       'https://www.youtube.com/watch?time_continue=1&v=9k0EAZhd6dY&feature=emb_title',
  //   flags: YoutubePlayerFlags(
  //     mute: false,
  //     autoPlay: true,
  //     disableDragSeek: false,
  //     loop: false,
  //     isLive: false,
  //     forceHD: false,
  //     enableCaption: true,
  //   ),
  // );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: Text(
          "Intro",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1100),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset("assets/images/intro.jpg")),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(10.0),
                          //   child: Image.network(
                          //       'https://www.litpoodle.com/styles/img/home-svg/search-bg.jpg'),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Center(
                                child: Text(
                                  "Helping the 99%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Build real wealth through real estate investing",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Take a look at this graph from",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2019 Survey of Consumer \n               Finances",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "\$6,300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Median Net worth of\n   all Americans",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "\$255,000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 140,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondarycolor),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Median Net worth of\nall Americans who _ ?",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "So what is that thing that some Americans\n own that causes such a disparity\n in net worth?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "THE ANSWER IS",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '"HOMEOWNERSHIP"',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Investing in real estate makes a lot of difference. Real estate is the reason why the average American who invested in it is 40x wealthier than the average American who didn’t.​",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                        //width: 300,
                        child: SvgPicture.network(
                          'https://www.litpoodle.com/styles/img/home-svg/right-big-home.svg',
                          semanticsLabel: '',
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: const CircularProgressIndicator()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Now some of you might think that real estate investing is dependent on income levels and that it might not be for all income levels.​",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Is that really true?",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Here is an example to prove that notion wrong.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "\$48,000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "\$37,450",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 140,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondarycolor),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "\$45,000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "\$97,000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 140,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondarycolor),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 50, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Germany"), Text("United Kingdom")],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Per capita income',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: secondarycolor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Media net worth',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Homeownership rate in 3",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            //width: 300,
                            child: SvgPicture.network(
                              'https://www.litpoodle.com/styles/img/home-svg/uk-germany.svg',
                              semanticsLabel: '',
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child: const CircularProgressIndicator()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Take a look at this graph1. Germany has slightly higher per capita income than UK. But why is the median net worth of a German2 only around 40% of that of the average UK person?​",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Once again, the answer lies in real estate!!!!",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            //width: 300,
                            child: SvgPicture.network(
                              'https://www.litpoodle.com/styles/img/home-svg/think-again.svg',
                              semanticsLabel: '',
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child: const CircularProgressIndicator()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Text(
                                  "So, if you were thinking real estate is not for you, then!",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Think Again!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Text(
                                  "LitPoodle",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Introducing our superdog",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: SvgPicture.network(
                              'https://www.litpoodle.com/styles/img/home-svg/poodle.svg',
                              semanticsLabel: 'poodle',
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child: const CircularProgressIndicator()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 12),
                                    text:
                                        'Litpoodle was created to educate people, bring awareness and help with real estate investing and wealth building.​Litpoodle provides end-to-end hassle-free solution for residential real estate investing. This includes ', // default text style
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'identifying good investment opportunities, estimating & calculating investor metrics (e.g. % return, growth, etc.), helping with the buying process, handling the property management and finally tracking the investment’s performance. ​',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          text:
                                              'Ultimately, Litpoodle’s mission is to build real wealth for the rest 99%!',
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "America’s smartest and cutest wealth builder",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                IntroScrollable(),
                                // YoutubePlayer(
                                //   controller: _controller,
                                //   showVideoProgressIndicator: true,
                                //   //videoProgressIndicatorColor: Colors.amber,
                                //   // progressColors: ProgressColors(
                                //   //     playedColor: Colors.amber,
                                //   //     handleColor: Colors.amberAccent,
                                //   // ),
                                //   // onReady () {
                                //   //     _controller.addListener(listener);
                                //   // },
                                // ),
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: videoID, //Add videoID.
                                    flags: YoutubePlayerFlags(
                                        hideControls: false,
                                        controlsVisibleAtStart: true,
                                        autoPlay: false,
                                        mute: false,
                                        useHybridComposition: false,
                                        hideThumbnail: false,
                                        disableDragSeek: false),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: secondarycolor,
                                ),

                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Dog Investors, Dog A and Dog B graduate from college and land jobs in Gotham city where they both earn exactly the city’s median salary of \$65,000 p.a. They both diligently save 10% of their incomes. They also receive the same 3% salary increment annually",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "But you know what, the median condo price in expensive Gotham city is \$1M!! Dog A starts saving towards downpayment, aiming for 20% down. While Dog A collects its savings in a bank account, Dog B decides to invest in rental properties across USA (where the market is growing and the total annual return is 10%+), each time it collects \$25K for downpayment.",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Guess what happens after 20 years? Dog A has saved \$195K in its bank account. Meanwhile Dog B has built a portfolio of 7 rentals worth \$750K & \$20K in the bank.",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Dog A isn’t still able to afford that 20% down because the condo price has now jumped to \$1.5M. Whereas Dog B is not only 4 times wealthier but also can afford a bigger condo!!!",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: SvgPicture.network(
                                      'https://www.litpoodle.com/styles/img/home-svg/dog-a.svg',
                                      semanticsLabel: 'poodle',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Dog A",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: SvgPicture.network(
                                      'https://www.litpoodle.com/styles/img/home-svg/dog-b.svg',
                                      semanticsLabel: 'poodle',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Dog B",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "                  How did Dog B do it even though \nthey both started together and had similar incomes?",
                              style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Because Dog B, through real estate investments, was able to harness the",
                              style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "1.POWER OF TIME",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: secondarycolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Time is money. If you are not making money out of time you are wasting time. So Invest early.For e.g. the value of an initial investment of \$25K growing @ 10% p.a.. after",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // color: secondarycolor,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: SvgPicture.network(
                                          'https://www.litpoodle.com/styles/img/home-svg/after-5-years.svg',
                                          semanticsLabel: 'after 5 yrs',
                                          placeholderBuilder: (BuildContext
                                                  context) =>
                                              Container(
                                                  padding: const EdgeInsets.all(
                                                      30.0),
                                                  child:
                                                      const CircularProgressIndicator()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "After 5 Years",
                                              style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              "\$40,263",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.network(
                                      'https://www.litpoodle.com/styles/img/home-svg/power-of-time.svg',
                                      semanticsLabel: 'time',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: SvgPicture.network(
                                          'https://www.litpoodle.com/styles/img/home-svg/after-20-years.svg',
                                          semanticsLabel: 'after 20yrs',
                                          placeholderBuilder: (BuildContext
                                                  context) =>
                                              Container(
                                                  padding: const EdgeInsets.all(
                                                      30.0),
                                                  child:
                                                      const CircularProgressIndicator()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "After 25 Years",
                                              style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              "\$168,187",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Over the long run, most homes appreciate thanks to inflation. By investing early in appreciating assets, Dog B was able to capture the power of time.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ////////////////////

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "2.POWER OF GROWTH RATE\n& COMPOUNDING",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: secondarycolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Here’s the difference between letting \$10K in annual savings collect in a checking account returning 1.25% p.a. vs investing that in assets returning 10% p.a.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: SvgPicture.network(
                                  'https://www.litpoodle.com/styles/img/home-svg/checking-account.svg',
                                  semanticsLabel: 'after 20yrs',
                                  placeholderBuilder: (BuildContext context) =>
                                      Container(
                                          padding: const EdgeInsets.all(30.0),
                                          child:
                                              const CircularProgressIndicator()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Because of its compounding nature, the importance of growth rate cannot be understated. Even a difference of a few percentage points annually can create massive disparities eventually.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "So every time you consider investing, ask for the rate of return (or its growth rate) and use it to compare investment opportunities.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "3.POWER OF LEVERAGE",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: secondarycolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "You, the investor, get to keep all the appreciation in the property’s value. Many times this appreciation constitutes a significant portion of the return.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Real estate investments allows a high degree of leverage (75 – 80%) and when done carefully yields much higher returns, they are stable enough too.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "For e.g. let’s consider a house that has appreciated from \$100K to \$130K over a period of 10 years. And let’s say the investor put in \$25K (\$20K for downpayment and \$5K for closing)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: SvgPicture.network(
                                      'https://www.litpoodle.com/styles/img/home-svg/leverage.svg',
                                      semanticsLabel: 'leverage',
                                      fit: BoxFit.contain,
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: SvgPicture.network(
                                      'https://www.litpoodle.com/styles/img/home-svg/home-value.svg',
                                      semanticsLabel: 'home value',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Due to appreciation in value, the investor’s equity has ballooned by \$30K. Even though the house has appreciated only by 30% over 10 years, this \$30K is a 120% return on the investor’s original investment of \$25K!!!! All thanks to power of leverage.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Best of luck with your real estate investing!!",
                                      style: TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
