import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';

class FollowSteps extends StatefulWidget {
  const FollowSteps({Key key}) : super(key: key);

  @override
  _FollowStepsState createState() => _FollowStepsState();
}

class _FollowStepsState extends State<FollowSteps> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Scaffold(
          body: FadeInUp(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 1100),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                // child: GestureDetector(
                //   onTap: () {
                //     FocusScope.of(context).requestFocus(new FocusNode());
                //   },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Back(),
                        SizedBox(
                          width: 65,
                        ),
                        Text(
                          "Follow these Steps",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //Padding(
                    //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // child:
                    // SingleChildScrollView(
                    //  scrollDirection: Axis.horizontal,
                    //  physics: BouncingScrollPhysics(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            //   decoration: BoxDecoration(
                            //       boxShadow: [
                            //         new BoxShadow(
                            //           color: shadowColor,
                            //           blurRadius: 1,
                            //         ),
                            //       ],
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: box),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "01",
                                      // style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.person_outline_outlined,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Sign up, it's free",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Signing up gives access to our specialized investment metrics and unique insights',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "02",
                                      //  style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.search_outlined,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Search",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Search for listed properties in your preferred area. You can also browse through our recommendations for top-pick cities.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "03",
                                      // style: TextStyle(color: Colors.grey
                                      // ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.reviews_outlined,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Review",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Review the property details and financial metrics. For many, buying a property is a big financial decision. So make sure you understand the ROI.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "04",
                                      // style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.sort,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Tweak & Play",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Tweak assumptions (like home price) and estimations (example: rent) under ‘Set Parameters’ and play with our calculators. You can also compare the property with stocks, bonds, etc.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "05",
                                      // style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.favorite_outline,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Add to Wishlist",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Add any property you like to your wish list by clicking on the ‘❤’ button. Access your wish list by logging into your ‘User Profile’.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "06",
                                      //style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.person_outline_outlined,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Get Visit Feedback",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'For a small fee, we will match you with a realtor who will visit homes and provide feedback. You are welcome to join the realtor during property visits.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "07",
                                      //style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.home_outlined,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Buy Home",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'Bid on any property you like and track the buying process with our status tracker.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: shadowColor,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "08",
                                      // style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.manage_accounts,
                                      color: secondarycolor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Manage Property",
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'You can self manage or request for a property manager who can help with finding renters, tracking expenses and monitoring investment performance.',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "01",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.person_outline_outlined,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Sign up, it's free",
                          //           // style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "02",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.search_outlined,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Search",
                          //           // style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "03",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.reviews_outlined,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Review",
                          //           // style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "04",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.sort,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Tweaks & Play",
                          //           //  style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "05",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.favorite_outline,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Add to Wishlist",
                          //           //  style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "06",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.feedback_outlined,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Get Visit Feedback",
                          //           //  style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "07",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.home_outlined,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Buy Home",
                          //           //  style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 320,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         new BoxShadow(
                          //           color: shadowColor,
                          //           blurRadius: 1,
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: box),
                          //   child: Padding(
                          //     padding: EdgeInsets.all(10),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "08",
                          //           style: TextStyle(color: Colors.grey),
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Icon(
                          //           Icons.manage_accounts,
                          //           color: secondarybgcolor,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Manage Property",
                          //           // style: TextStyle(color: secondarybgcolor),
                          //         ),
                          //         Spacer(),
                          //         Icon(
                          //           Icons.arrow_forward_ios_rounded,
                          //           size: 18,
                          //           color: Colors.grey,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                        ],
                      ),
                    ),
                    //  ),
                    //  )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
