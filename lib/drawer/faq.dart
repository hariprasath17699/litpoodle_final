import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/back_button.dart';
import 'package:litpoodle/components/colors.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            elevation: null,
            backgroundColor: secondarycolor,
            title: Text(
              'LitPoodle FAQs',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
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
                    Column(
                      children: [
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
                              Text(
                                "General:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "01",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "What does LitPoodle do?",
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "LitPoodle provides an end-to-end hassle-free solution for residential real estate investing. This includes identifying & recommending good investment opportunities, estimating & calculating investor metrics (example: % return, rental yield, etc.), helping with the buying process, assisting with the property management and finally tracking the investment’s performance."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "02",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "What is LitPoodle’s mission?",
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "LitPoodle’s mission is to democratize the real estate investing process and alleviate the stress points so that more people get on this wealth ladder. Real estate is one of the primary mechanisms for building wealth and unfortunately there is a sizable section of our society that is missing out due to the lack of awareness. LitPoodle aims to address this gap by educating people on the opportunities and offering unique insights, providing transparency and making the investing process as simple and efficient as possible."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "03",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "In what ways is LitPoodle unique? Why use LitPoodle?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "LitPoodle’s technology is a key differentiator. Here a few ways where our technology stands out"
                                          "Our algorithms and calculators provide unique insights and proprietary metrics for every investment opportunity. (Insights such as how does the home stack up against stock market opportunities)."
                                          "Our home purchase tracker provides as much transparency as possible to the purchasing process. Check out our tracker under the ‘Buying Process’ tab of the ‘User Profile’ page, after signing up."
                                          "Our revolutionary property management dashboard can make tracking your investment’s performance as intuitive and efficient as possible."
                                          "Also, LitPoodle is a one-stop solution for residential real estate investing that makes investing as simple as 1-2-3."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "04",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Is LitPoodle a crowdsourced fund or a REIT?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "LitPoodle is neither a crowdsourced fund nor a REIT. You, as an investor, will be owning the investment properties. We will help facilitate the investing and managing process. We believe that buying carefully selected individual investment properties yields better returns for the investor than investing in REITS or funds since the law of diminishing returns holds true for real estate investing as well."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "05",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Is LitPoodle a brokerage?",
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "LitPoodle is not a brokerage. It is an online real estate investment portal where you can search for properties, find recommendations, peruse the investment metrics, get linked to licensed agents for purchasing property, keep track of the purchasing process, get assistance with management of property and finally track the investment performance."
                                          "LitPoodle, however, will you refer you to a licensed real estate brokerage for the actual purchase of property."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "06",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Will a brokerage be assisting you in the purchase? Will my transaction be handled by licensed agents?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Yes, LitPoodle will refer you to a licensed real estate brokerage to help you in the purchase of property. So you will have the benefit of buying a property through a regulated process."
                                          "And yes, your purchase of the property will be handled by licensed real estate agents. Your interests will be protected by a licensed agent representing you."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "07",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "How do I request a change of brokerage, realtor or property manager?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "If you are not satisfied with the performance of your assigned brokerage, agent or property manager and would like to request for a change, please contact support@litpoodle.com. We also would love to hear your feedback and suggestions, if any, at support@litpoodle.com"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "08",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Where are the property listings sourced from? Can you list your own properties on LitPoodle?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Currently, all listings on LitPoodle are sourced from MLS. MLS is one of the most trusted and reputed listing services available in the USA. To find more details on MLS, click here."
                                          "At the moment, LitPoodle does not have the ability to directly list properties from the seller. But if you do have a property that you want to list either on MLS or other listing aggregators, we can refer you to a licensed agent who can help you. For more information, please contact support@litpoodle.com."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "09",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "How is LitPoodle trustworthy?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "At LitPoodle, we believe transparency is paramount. We are continuously developing our products and improving our technology to provide much more transparency than what is available through conventional processes (like for example, providing status updates through a tracker once the property is under contract).\n\n"
                                          "Also,\n  All our property listings are from MLS. So you can be rest assured that the standards and regulations that apply to MLS listings also apply to our property listings.\n\n  A licensed real estate agent will be helping you in the actual transaction of the property. An agent can be licensed only after completion of rigorous state mandated licensing requirements. \n\n  You will also be protected by the state regulations that govern real estate transactions.You will be owning the property post purchase unlike in a fund or a REIT. You will be holding the title to your property and your investment will be backed by a physical asset."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "10",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "In which US states does LitPoodle operate? ",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Currently, we are able to service investors from and also find properties in all 50 states and D.C."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "11",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "What is remote buying? Can you participate in remote buying?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Remote buying refers to investors investing in properties outside the areas they reside or frequent. Remote buying is becoming more and more popular as investors try to take advantage of the better returns on investment offered by fast growing markets that might be outside their sphere of influence.\n\nYes, you can and we encourage you to participate in remote buying. At LitPoodle one of our objectives is to make remote buying as easy, simple and secure as possible."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "12",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Can you join the agent during the property visits?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Once you have identified an area to invest in and we have matched you with a local licensed agent, you are more than welcome to join the agent to visit the shortlisted properties."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "13",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Who owns and manages the property after purchase?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "You will be owning the property. You will be holding the title to your property. After purchase, you can either decide to manage the property by yourself or to hand it over to a property manager for management. If you decide on the latter, we will help you find a property manager."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "14",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Why invest in real estate? How to get started in real estate investing?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "Real estate investing has a plethora of benefits. And depending on your preference, you can invest in real estate to build your wealth through capital appreciation, supplement your income with rental returns, diversify your asset portfolio and/or protect your wealth by investing in stable markets.\n\nFor more information on benefits and how to get started, refer to our Blog and Home page."),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                shadowColor: shadowColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ExpansionTile(
                                  //onExpansionChanged: ,
                                  textColor: secondarycolor,
                                  iconColor: secondarycolor,
                                  title: Row(
                                    children: [
                                      Text(
                                        "15",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "How to contact Litpoodle?",
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "You can reach LitPoodle by emailing support@litpoodle.com"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
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
                                  Text(
                                    "How to use LitPoodle:",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "16",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to start using LitPoodle? What are the steps in the property buying process?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "1) Sign Up: It’s Free. Signing up gives access to our specialized investment metrics and unique insights.\n2) Search: Search for listed properties in your preferred area. You can also browse through our recommendations for top-pick cities.\n3) Review: Review the property details and financial metrics. For many, buying a property is a big financial decision. So make sure you understand the ROI.\n4) Tweak and Play: Tweak assumptions (like home price) and estimations (example: rent) under the ‘Set Parameters’ and play with our calculators. You can also compare with the property with stocks, bonds, etc.\n5) Add to Wish List: Add any property you like to your wish list by clicking on the ‘❤’ button. Access your wish list by logging into your ‘User Profile’.\n6) Visit Feedback: For a small fee, we will match you with a realtor who will visit homes and provide feedback. You are welcome to join the realtor during property visits.\n7) Buy Property: Bid on any property you like and track the buying process with our status tracker.\n8) Manage Property: You can self manage or request for a property manager who can help with finding renters, tracking expenses and monitoring investment performance."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "17",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to interpret the financial metrics provided for each property ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "By default, our calculators try to incorporate real world scenarios (for example, the model assumes that the property will be mortgaged with 20% downpayment). You can change these assumptions by clicking on ‘Set Parameters’, if you wish. Following are brief explanations provided for some of the metrics.\n\n1) Cap rate: Cap rate is the ratio of the net operating income (annual) to the market value of the home expressed as a percentage.\n2) Net operating income: It is arrived by deducting the operating expenses (repairs, property taxes, insurance, etc.) from the expected revenue from the property.\n3) Net cash flow: It is the net cash remaining after paying for all expenses. You can also arrive at net cash flow by deducting the mortgage payments (principal + interest) and replacement fund contributions, if any, from net operating income.\n4) Annualized Growth Rate (AGR): Also known by several other terms like return on investment (ROI) or growth%, AGR shows the net annual return on your investment from all sources including property’s capital appreciation, monthly rental income & loan principal repayment.\n5) Annualized Growth Rate with Net Cash Flow reinvested: Often in real life, investors tend to reinvest periodically the net proceeds from an investment, like for example, the reinvesting of stock dividends. So LitPoodle pioneered this metric to provide an understanding of how the reinvesting of net cash flow would affect the AGR.\n6) Rental Yield: It is the ratio of rental income to the value of the home expressed as a percentage. When compared to the cap ratio, this metric has a slight disadvantage due to not considering operating expenses, which in some cases can be significant.\n\nFor more information, please refer to our Blog."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "18",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Are the rental estimates and other calculations accurate ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "Rental Estimates for a property that you see on the property details are system generated. We have undertaken best efforts to give the closest estimates of rental values. However, we cannot guarantee 100% accuracy due to a myriad of factors. After you pay the fee and are matched with a licensed agent, the agent will be able to verify or update the estimate if necessary.\n\nWith respect to other calculations, there are several assumptions underlying the model. We have tried to estimate those assumptions conservatively. For example, the annual home price increase is conservatively assumed to match the inflation rate, although it can be much higher.\n\nYou are also more than welcome to edit the rental estimates and the assumptions under ‘Set Parameters’ tab."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "19",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to use the Set Parameters tab? How to change assumptions behind the calculations ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "‘Set Parameters’ tab is available in the property details. All the estimates and assumptions that underlie the mathematical models are listed in this tab. In this section, you can vary estimates such as rental estimates or assumptions such as annual home price increase or annual rent increase or closing costs.\n\nYou can also set your investment comparables here. If you want to compare the selected property to other investment opportunities such as stocks, bonds or ETFs, you can enter the name of the opportunity and its expected growth rate. The system will then provide you with a comparison on the property details page."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "20",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to edit the calculator if you are considering buying it all-cash ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "The model, by default, assumes that the property will be mortgaged with 20% down payment. If you are planning to purchase it all in cash, enter ‘100’ under Downpayment in the ‘Set Parameters’ tab."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "21",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to manage the property after purchase ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "After purchase, you can either choose to manage the property by yourself or by hiring a property manager. If you decide the latter, we will help you find one. You will need to click on the ‘Request a PM’ in the ‘Purchased Homes’ dashboard section of ‘User Profile’."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "22",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "How to use LitPoodle’s property management dashboard ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "Regardless of whether you request for a property manager or not, you will get access to our property management dashboard under ‘Purchased Homes’. Here you can\n\nEnter and categorize expenses by month.\nEnter rent and other incomes by month.\nEnter loan/mortgage details.\nEnter home value every month.\n\nDoing so, you can track your investment’s performance using metrics like net cash flow (for any selected period), growth rate, etc. and see how the metrics are trending over time too."),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
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
                                  Text(
                                    "Miscellaneous:",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "23",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "What is the LitPoodle service fee for ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "The service fee is for matching you with a licensed agent in a particular region that you are looking to invest. Each distinct region will entail a separate fee payment."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "24",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Are my payment details secure ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "We don't store any of your credit card or debit card information on our site. The payment is handled through a secure external vendor such as Stripe."),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              shadowColor: shadowColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ExpansionTile(
                                //onExpansionChanged: ,
                                textColor: secondarycolor,
                                iconColor: secondarycolor,
                                title: Row(
                                  children: [
                                    Text(
                                      "25",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(
                                        " Why don't addresses appear on the details page ?",
                                      ),
                                    ),
                                  ],
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                        "You can request your assigned agent for the address once you have paid the service fee and been matched with a licensed agent."),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
