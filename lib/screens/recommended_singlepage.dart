import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/chart.dart';
import 'package:litpoodle/screens/otp_screen.dart';
import 'package:litpoodle/screens/paymentscreen.dart';
import 'package:litpoodle/screens/recommended_home_singlepg/circular_chart.dart';
import 'package:litpoodle/screens/recommended_home_singlepg/detail.dart';
import 'package:like_button/like_button.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:litpoodle/screens/recommended_home_singlepg/functionalities/setparameters.dart';
import 'package:litpoodle/screens/recommended_home_singlepg/single_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecommendedSinglePage extends StatefulWidget {
  const RecommendedSinglePage({Key key}) : super(key: key);

  @override
  _RecommendedSinglePageState createState() => _RecommendedSinglePageState();
}

class _RecommendedSinglePageState extends State<RecommendedSinglePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  int _selectedSize = 1;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 1, end: 0).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeInUp(
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 1100),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: secondarycolor, //change your color here
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            elevation: 5,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: bgColor,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Stack(
                children: [
                  Image.asset(
                    'assets/images/american.png',
                    //  height: 250,
                    width: double.infinity,

                    //background: Image.network( fit: BoxFit.cover,)
                  ),
                  Positioned(
                    //left: 10,
                    right: 20,
                    top: 200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: LikeButton(
                        size: 30,
                        circleColor: CircleColor(
                            start: Color(0xff00ddff), end: Color(0xff0099cc)),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: secondarycolor,
                          dotSecondaryColor: Colors.red,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.white,
                            size: 30,
                          );
                        },
                        //likeCount: 665,
                        countBuilder: (int count, bool isLiked, String text) {
                          var color = isLiked ? Colors.red : Colors.white;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "love",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),
                    ),
                  ),
                  //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

                  //Init Floating Action Bubble
                  // Container(
                  //   height: 400,
                  //   child: Positioned(
                  //     left: 100,
                  //     top: 10,
                  //     right: 10,
                  //     child: FloatingActionBubble(
                  //       // Menu items
                  //       items: <Bubble>[
                  //         // Floating action menu item
                  //         Bubble(
                  //           title: "Notification",
                  //           iconColor: Colors.white,
                  //           bubbleColor: null,
                  //           icon: Icons.settings,
                  //           titleStyle:
                  //               TextStyle(fontSize: 10, color: Colors.white),
                  //           onPress: () {
                  //             _animationController.reverse();
                  //           },
                  //         ),
                  //         // Floating action menu item
                  //         Bubble(
                  //           title: "Set Parameters",
                  //           iconColor: Colors.white,
                  //           bubbleColor: null,
                  //           icon: Icons.people,
                  //           titleStyle:
                  //               TextStyle(fontSize: 10, color: Colors.white),
                  //           onPress: () {
                  //             _animationController.reverse();
                  //           },
                  //         ),
                  //         //Floating action menu item
                  //         Bubble(
                  //           title: "Request Agent",
                  //           iconColor: Colors.white,
                  //           bubbleColor: null,
                  //           icon: Icons.home,
                  //           titleStyle:
                  //               TextStyle(fontSize: 10, color: Colors.white),
                  //           onPress: () {
                  //             // Navigator.push(
                  //             //   context,
                  //             //   new MaterialPageRoute(
                  //             //     builder: (BuildContext context) => Homepage(),
                  //             //   ),
                  //             // );
                  //             _animationController.reverse();
                  //           },
                  //         ),
                  //         Bubble(
                  //           title: "Add to wishlist",
                  //           iconColor: Colors.white,
                  //           bubbleColor: null,
                  //           icon: Icons.home,
                  //           titleStyle:
                  //               TextStyle(fontSize: 10, color: Colors.white),
                  //           onPress: () {
                  //             // Navigator.push(
                  //             //   context,
                  //             //   new MaterialPageRoute(
                  //             //     builder: (BuildContext context) => Homepage(),
                  //             //   ),
                  //             // );
                  //             _animationController.reverse();
                  //           },
                  //         ),
                  //       ],

                  //       // animation controller
                  //       animation: _animation,

                  //       // On pressed change animation state
                  //       onPress: () => _animationController.isCompleted
                  //           ? _animationController.reverse()
                  //           : _animationController.forward(),

                  //       // Floating Action button Icon color
                  //       iconColor: white,

                  //       // Flaoting Action button Icon
                  //       iconData: Icons.add,
                  //       backGroundColor: secondarycolor,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // )
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(45),
                child: Transform.translate(
                  offset: Offset(0, 1),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),

                    // child: Center(
                    //     child: Container(
                    //   width: 50,
                    //   height: 8,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.shade300,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // )),
                  ),
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  //height: MediaQuery.of(context).size.height * 0.55,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      Setparameter(context),
                                );
                              },
                              child: Icon(Icons.filter),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            //   child: LikeButton(
                            //     size: 30,
                            //     circleColor: CircleColor(
                            //         start: Color(0xff00ddff),
                            //         end: Color(0xff0099cc)),
                            //     bubblesColor: BubblesColor(
                            //       dotPrimaryColor: secondarycolor,
                            //       dotSecondaryColor: Colors.red,
                            //     ),
                            //     likeBuilder: (bool isLiked) {
                            //       return Icon(
                            //         Icons.favorite,
                            //         color: isLiked ? Colors.red : Colors.grey,
                            //         size: 30,
                            //       );
                            //     },
                            //     //likeCount: 665,
                            //     countBuilder:
                            //         (int count, bool isLiked, String text) {
                            //       var color =
                            //           isLiked ? Colors.red : Colors.grey;
                            //       Widget result;
                            //       if (count == 0) {
                            //         result = Text(
                            //           "love",
                            //           style: TextStyle(color: color),
                            //         );
                            //       } else
                            //         result = Text(
                            //           text,
                            //           style: TextStyle(color: color),
                            //         );
                            //       return result;
                            //     },
                            //   ),
                            // ),
                          ],
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    " Single Family",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    "For Sale",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "American Fork",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$586,344",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: secondarycolor,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    " 2022",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$325/per sqft",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      //color: secondarycolor,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bed_rounded,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        " 3 Beds",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bathroom_rounded,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        " 4 Baths",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.view_array_outlined,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        " 1803 Sqft",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => SingleImage()),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(40), // Image radius
                                    child: Image.asset(
                                      'assets/images/american.png',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) => DetailPage()),
                                      // );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Details",
                                            style: TextStyle(
                                                color: secondarybgcolor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PaymentScreen()),
                                      // );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Poodle-O-Meter",
                                            style: TextStyle(
                                                color: secondarybgcolor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PaymentScreen()),
                                      // );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Investor Metrics",
                                            style: TextStyle(
                                                color: secondarybgcolor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PaymentScreen()),
                                      // );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Cash flow",
                                            style: TextStyle(
                                                color: secondarybgcolor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PaymentScreen()),
                                      // );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Neighborhood",
                                            style: TextStyle(
                                                color: secondarybgcolor,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          new BoxShadow(
                                            color: shadowColor,
                                            blurRadius: 3,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: box),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Recommendations",
                                          style: TextStyle(
                                              color: secondarybgcolor,
                                              fontSize: 11),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              "This 2 story home is the best seller of our Vista product line. A great home for a young family. It boasts 9' ceilings, a spacious loft upstairs, a vault in the master bedroom ceiling. 2 sinks in the master bath. White cabinets laminate flooring and quartz countertops. This home is scheduled to be complete in June."),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "Can this home make you a",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " millionaire ",
                                style: TextStyle(color: secondarycolor),
                              ),
                              Text(
                                "??",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Your investment of \$134K* Could be worth \$585K* in 30 years. And if you reinvest the net cash flow procceds, it could be worth \$1304K*",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 3,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: box),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "*Assumes a downpayment of 20%. Please click 'Set Paramaters' to see the list of all assumptions behind this calculation.",
                                  style: TextStyle(
                                      color: secondarybgcolor, fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Compare investment opportunities",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  "In 10 years",
                                  style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Chart1(),
                              //BarChartSample3(),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: Text(
                                  "Annualized Growth rates used for the purpose of comparison: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        "US Bonds   (with interest reinvested)    :5%",
                                        style: TextStyle(
                                            color: secondarybgcolor,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        "S&P 500     (with dividend reinvested)    :9.42%",
                                        style: TextStyle(
                                            color: secondarybgcolor,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        "Home   (with cash flow reinvested)    :5%",
                                        style: TextStyle(
                                            color: secondarybgcolor,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.01,
                                    center: new Text("1%"),
                                    progressColor: secondarycolor,
                                    fillColor: Colors.transparent,
                                  ),
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: new Text("100%"),
                                    progressColor: secondarycolor,
                                    fillColor: Colors.transparent,
                                  ),
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.52,
                                    center: new Text("52%"),
                                    progressColor: secondarycolor,
                                    fillColor: Colors.transparent,
                                  ),
                                  // CircularPercentIndicator(
                                  //   radius: 60.0,
                                  //   lineWidth: 5.0,
                                  //   percent: 0.51,
                                  //   center: new Text("51%"),
                                  //   progressColor: secondarycolor,
                                  //   fillColor: Colors.transparent,
                                  // ),
                                ],
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cash Flow",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "     Region Growth",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "     Neighborhood",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  // Text(
                                  //   "Total Score",
                                  //   style: TextStyle(fontSize: 10),
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "=",
                                style: TextStyle(
                                    fontSize: 20, color: secondarycolor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.51,
                                    center: new Text("51%"),
                                    progressColor: secondarycolor,
                                    fillColor: Colors.transparent,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.49,
                                    center: new Text("49%"),
                                    progressColor: Colors.red,
                                    fillColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "This home is better than 49% of homes on the market in the USA",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 370,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          // height: 200,
                                          width: 60,
                                          child: SvgPicture.network(
                                            'https://www.litpoodle.com/styles/img/home-svg/poodle.svg',
                                            semanticsLabel: 'poodle',
                                            placeholderBuilder: (BuildContext
                                                    context) =>
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30.0),
                                                    child:
                                                        const CircularProgressIndicator()),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "LITPOODLE VERDICT",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "Keep looking. There are better investment \nopportunities out there!",
                                                style: TextStyle(fontSize: 9),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Investor Metrix",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 370,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Monthly Estimated \nRent for this home",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Purchase Price \nof home",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Gross Annual \nRental Yield",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        // SizedBox(
                                        //   // height: 200,
                                        //   width: 60,
                                        //   child: SvgPicture.network(
                                        //     'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg',
                                        //     semanticsLabel: 'poodle',
                                        //     placeholderBuilder: (BuildContext
                                        //             context) =>
                                        //         Container(
                                        //             padding:
                                        //                 const EdgeInsets.all(
                                        //                     30.0),
                                        //             child:
                                        //                 const CircularProgressIndicator()),
                                        //   ),
                                        // ),
                                        // // SizedBox(
                                        // //   width: 10,
                                        // // ),
                                        // SizedBox(
                                        //   // height: 200,
                                        //   width: 60,
                                        //   child: SvgPicture.network(
                                        //     'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/dog-house.svg',
                                        //     semanticsLabel: 'poodle',
                                        //     placeholderBuilder: (BuildContext
                                        //             context) =>
                                        //         Container(
                                        //             padding:
                                        //                 const EdgeInsets.all(
                                        //                     30.0),
                                        //             child:
                                        //                 const CircularProgressIndicator()),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   // height: 200,
                                        //   width: 60,
                                        //   child: SvgPicture.network(
                                        //     'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/file.svg',
                                        //     semanticsLabel: 'poodle',
                                        //     placeholderBuilder: (BuildContext
                                        //             context) =>
                                        //         Container(
                                        //             padding:
                                        //                 const EdgeInsets.all(
                                        //                     30.0),
                                        //             child:
                                        //                 const CircularProgressIndicator()),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 370,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        new BoxShadow(
                                          color: shadowColor,
                                          blurRadius: 3,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: box),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // height: 200,
                                          width: 60,
                                          child: SvgPicture.network(
                                            'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg',
                                            semanticsLabel: 'poodle',
                                            placeholderBuilder:
                                                (BuildContext context) =>
                                                    Container(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 10,
                                        // ),
                                        SizedBox(
                                          // height: 200,
                                          width: 60,
                                          child: SvgPicture.network(
                                            'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/dog-house.svg',
                                            semanticsLabel: 'poodle',
                                            placeholderBuilder: (BuildContext
                                                    context) =>
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30.0),
                                                    child:
                                                        const CircularProgressIndicator()),
                                          ),
                                        ),
                                        SizedBox(
                                          // height: 200,
                                          width: 60,
                                          child: SvgPicture.network(
                                            'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/file.svg',
                                            semanticsLabel: 'poodle',
                                            placeholderBuilder: (BuildContext
                                                    context) =>
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30.0),
                                                    child:
                                                        const CircularProgressIndicator()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 80,
                                      width: 370,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: shadowColor,
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: box),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              // height: 200,
                                              width: 60,
                                              child: SvgPicture.network(
                                                'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg',
                                                semanticsLabel: 'poodle',
                                                placeholderBuilder: (BuildContext
                                                        context) =>
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(30.0),
                                                        child:
                                                            const CircularProgressIndicator()),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            SizedBox(
                                              // height: 200,
                                              width: 60,
                                              child: SvgPicture.network(
                                                'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg',
                                                semanticsLabel: 'poodle',
                                                placeholderBuilder: (BuildContext
                                                        context) =>
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(30.0),
                                                        child:
                                                            const CircularProgressIndicator()),
                                              ),
                                            ),
                                            SizedBox(
                                              // height: 200,
                                              width: 60,
                                              child: SvgPicture.network(
                                                'https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg',
                                                semanticsLabel: 'poodle',
                                                placeholderBuilder: (BuildContext
                                                        context) =>
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(30.0),
                                                        child:
                                                            const CircularProgressIndicator()),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),

                              //  Circlechart(),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Container(
                              //     height: 80,
                              //     width: 370,
                              //     decoration: BoxDecoration(
                              //         boxShadow: [
                              //           new BoxShadow(
                              //             color: shadowColor,
                              //             blurRadius: 3,
                              //           ),
                              //         ],
                              //         borderRadius: BorderRadius.circular(10),
                              //         color: box),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(6.0),
                              //       child: Row(
                              //         children: [
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             // mainAxisAlignment:
                              //             //     MainAxisAlignment.start,
                              //             children: [
                              //               Text(
                              //                 "\$2,051 * 12",
                              //                 style: TextStyle(fontSize: 10),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Text(
                              //                 "Estimated Rent",
                              //                 style: TextStyle(fontSize: 8),
                              //               )
                              //             ],
                              //           ),
                              //           SizedBox(
                              //             width: 15,
                              //           ),
                              //           Text("/"),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             // mainAxisAlignment:
                              //             //     MainAxisAlignment.start,
                              //             children: [
                              //               Text(
                              //                 "\$586,344",
                              //                 style: TextStyle(fontSize: 10),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Text(
                              //                 "Estimated Rent",
                              //                 style: TextStyle(fontSize: 8),
                              //               ),
                              //               SizedBox(
                              //                 width: 15,
                              //               ),
                              //             ],
                              //           ),
                              //           Text("="),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             // mainAxisAlignment:
                              //             //     MainAxisAlignment.start,
                              //             children: [
                              //               Text(
                              //                 "\$2,051 * 12",
                              //                 style: TextStyle(fontSize: 10),
                              //               ),
                              //               SizedBox(
                              //                 width: 10,
                              //               ),
                              //               Text(
                              //                 "Estimated Rent",
                              //                 style: TextStyle(fontSize: 8),
                              //               )
                              //             ],
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // body: SingleChildScrollView(
            //   physics: BouncingScrollPhysics(),
            //   child: Column(
            //     children: [
            //       Stack(
            //         children: <Widget>[
            //           Container(
            //             alignment: Alignment.center,
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.only(
            //                   bottomLeft: Radius.circular(30),
            //                   bottomRight: Radius.circular(30)),
            //               child: Image.asset(
            //                 'assets/images/build1.png',
            //                 //  height: 250,
            //                 width: double.infinity,
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             alignment: Alignment.topLeft,
            //             child: Padding(
            //               padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            //               child: Back(),
            //             ),
            //           ),
            //         ],
            //       ),

            //       /////
            //       Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.home,
            //                   size: 16,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " Single Family",
            //                   style: TextStyle(fontSize: 14, color: Colors.grey),
            //                 ),
            //                 Spacer(),
            //                 Text(
            //                   "For Sale",
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       color: Colors.green,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.location_on_rounded,
            //                   size: 16,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " Location",
            //                   style: TextStyle(fontSize: 14, color: Colors.grey),
            //                 ),
            //                 Spacer(),
            //                 Text(
            //                   "\$899,900",
            //                   style: TextStyle(
            //                     fontSize: 14,
            //                     color: secondarycolor,
            //                     //fontWeight: FontWeight.bold,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.calendar_today_rounded,
            //                   size: 16,
            //                   color: Colors.grey,
            //                 ),
            //                 Text(
            //                   " 1997",
            //                   style: TextStyle(fontSize: 14, color: Colors.grey),
            //                 ),
            //                 Spacer(),
            //                 Text(
            //                   "\$159/per sqft",
            //                   style: TextStyle(
            //                     fontSize: 14,
            //                     color: Colors.grey,
            //                     //color: secondarycolor,
            //                     //fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Icon(
            //                       Icons.bed_rounded,
            //                       size: 16,
            //                       color: Colors.grey,
            //                     ),
            //                     Text(
            //                       " 6 Beds",
            //                       style: TextStyle(fontSize: 14, color: Colors.grey),
            //                     ),
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     Icon(
            //                       Icons.bathroom_rounded,
            //                       size: 14,
            //                       color: Colors.grey,
            //                     ),
            //                     Text(
            //                       " 4 Baths",
            //                       style: TextStyle(fontSize: 14, color: Colors.grey),
            //                     ),
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     Icon(
            //                       Icons.view_array_outlined,
            //                       size: 16,
            //                       color: Colors.grey,
            //                     ),
            //                     Text(
            //                       " 5675 Sqft",
            //                       style: TextStyle(fontSize: 14, color: Colors.grey),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       /////////////////////////////////////////////////////////////
            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Row(
            //           children: [
            //             Text(
            //               "Gallery",
            //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: 60,
            //       ),

            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Text(
            //             "This home has everything you need on the main level with customized painting throughout with 20 foot ceilings. Stunning kitchen with granite countertops and very spacious master bedroom with jetted tub. You will love the built-in entertainment center with built in surround sound system through out the main level. It includes two new air conditioners, new water softener, two furnaces, tankless water heater, and nest thermostat. The completely finished walk-out basement is perfect for entertaining or just hanging out with it's wet bar, exercise/weight room with storage cabinets and cold storage. The Fort Knox walk-in safe and pool table are amazing added bonuses to this home. Upstairs has a spacious bonus room and a nice loft that can be used for a study, playroom, or craft room. More great features include plantation shutters, secluded cul-de-sac, private backyard with trampoline, large patio with patio gas hookup and storage shed. You won't want to miss this remarkable home in an amazing neighborhood."),
            //       )
            //     ],
            //   ),
          ),
        ],
      ),
    ));
  }
}
// TooltipBehavior _tooltipBehavior;

// @override
// void initState(){
//   _tooltipBehavior = TooltipBehavior(enable: true);
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//         child: Container(
//           child: SfCartesianChart(

//             primaryXAxis: CategoryAxis(),
//             // Chart title
//             title: ChartTitle(text: ''),
//             // Enable legend
//             legend: Legend(isVisible: true),
//             // Enable tooltip
//             tooltipBehavior: _tooltipBehavior,

//             series: <LineSeries<SalesData, String>>[
//               LineSeries<SalesData, String>(
//                 dataSource:  <SalesData>[
//                   SalesData(),
//                   SalesData(),
//                   SalesData(),
//                   SalesData(),
//                   SalesData())
//                 ],
//                 xValueMapper: (SalesData sales, _) => sales.year,
//                 yValueMapper: (SalesData sales, _) => sales.sales,
//                 // Enable data label
//                 dataLabelSettings: DataLabelSettings(isVisible: true)
//               )
//             ]
//           )
//         )
//       )
//   );
// }
