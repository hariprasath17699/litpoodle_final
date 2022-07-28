import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/followsteps_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/recommended_cities.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';
import 'package:litpoodle/screens/otp_screen.dart';
import 'package:litpoodle/screens/paymentscreen.dart';
import 'package:litpoodle/screens/property_details.dart';
import 'package:litpoodle/screens/scroll_widget_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

class ScrollableContainer extends StatefulWidget {
  const ScrollableContainer({Key key}) : super(key: key);

  @override
  _ScrollableContainerState createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {
  @override
  void initState() {
    data = apicall();
    super.initState();
  }

  Future<Map<String, dynamic>> apicall() async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request('GET', Uri.parse('$domain_url/api/search/home'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      print(result["result"]["banner"].length);
      print(result["result"]["banner"][0]);
      for (int i = 0; i < result["result"]["banner"].length; i++) {
        imgList.add(result["result"]["banner"][i]["images"]);
      }
      print(imgList);
      print(result["result"]["recommentations-list"].length);
      print(result["result"]["recommentations-list"]);
      for (int i = 0;
          i < result["result"]["recommentations-list"].length;
          i++) {
        // result['data']['property_list'].forEach((key, value) => propertyList.add(value));
        // propertyList.addAll(result["data"]["property_list"][i]);
      }
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

  final List<String> imgList = [];
  ScrollController _mycontroller1 = new ScrollController();
  int activeIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Future<Map<String, dynamic>> data;

  String selected = "first";
  // Determines whether the stepper's orientation is vertical or horizontal
  // This variable can be changed by using the switch below
  bool _isVerticalStepper = true;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Image.network(
                item,
              ),
            ))
        .toList();
    return SingleChildScrollView(
      controller: _mycontroller1,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          FutureBuilder(
            future: data,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CarouselSlider.builder(
                            itemCount: imgList.length,
                            carouselController: _controller,
                            itemBuilder: (context, index, realindex) {
                              final urlImage = imgList[index];

                              return buildImage(urlImage, index);
                            },
                            options: CarouselOptions(
                                height: 115,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 8.0,
                                  height: 4.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Follow these steps",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return FollowSteps();
                                            },
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 0, 0),
                                          child: Text(
                                            "View all",
                                            style: TextStyle(
                                                color: secondarycolor,
                                                fontSize: 12),
                                          ),
                                        ),
                                        // child: Icon(
                                        //   Icons.arrow_forward_ios_rounded,
                                        //   color: secondarycolor,
                                        //   size: 18,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          // onTap: () {
                                          //   Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             PaymentScreen()),
                                          //   );
                                          // },
                                          child: Container(
                                            height: 100,
                                            width: 75,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 20, 10, 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          new BoxShadow(
                                                            color: shadowColor,
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: box),
                                                    child: Icon(
                                                      Icons
                                                          .person_outline_outlined,
                                                      color: secondarycolor,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    "Sign up",
                                                    style: TextStyle(
                                                        color: secondarybgcolor,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        GestureDetector(
                                          // onTap: () {
                                          //   Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Searchpage()),
                                          //   );
                                          // },
                                          child: Container(
                                            height: 100,
                                            width: 75,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 20, 10, 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          new BoxShadow(
                                                            color: shadowColor,
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: box),
                                                    child: Icon(
                                                      Icons.search_outlined,
                                                      color: secondarycolor,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    "Search",
                                                    style: TextStyle(
                                                        color: secondarybgcolor,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.reviews_outlined,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Review",
                                                  style: TextStyle(
                                                      color: secondarybgcolor,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.sort,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Tweaks \n & Play",
                                                  style: TextStyle(
                                                      color: secondarybgcolor,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.favorite_outline,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Add to Wishlist",
                                                  style: TextStyle(
                                                      color: secondarybgcolor,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 20, 8, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.feedback_outlined,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Get Visit\nFeedback",
                                                  style: TextStyle(
                                                      color: secondarybgcolor,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.home_outlined,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                                  child: Text(
                                                    "  Buy Home",
                                                    style: TextStyle(
                                                        color: secondarybgcolor,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 75,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 20, 10, 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: shadowColor,
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: box),
                                                  child: Icon(
                                                    Icons.manage_accounts,
                                                    color: secondarycolor,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Manage Property",
                                                  style: TextStyle(
                                                      color: secondarybgcolor,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Recommended",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return RecommendedCities();
                                            },
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 0, 0),
                                          child: Text(
                                            "View all",
                                            style: TextStyle(
                                                color: secondarycolor,
                                                fontSize: 12),
                                          ),
                                        ),
                                        // child: Icon(
                                        //   Icons.arrow_forward_ios_rounded,
                                        //   color: secondarycolor,
                                        //   size: 18,
                                        // ),
                                      ),
                                      // SizedBox(
                                      //   height: 200,
                                      // )
                                    ],
                                  ),
                                ), /////////////////////
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 0, 0),
                                  child: Container(
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 8.0, vertical: 10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.32,
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        // shrinkWrap: true,
                                        itemCount: snapshot
                                            .data["recommentations-list"]
                                            .length,
                                        // gridDelegate:
                                        //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                        //         maxCrossAxisExtent: 200,
                                        //         childAspectRatio: 0.8,
                                        //         crossAxisSpacing: 10,
                                        //         mainAxisSpacing: 10),
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  // return PropertyDetails();
                                                  return SinglePostProperty(
                                                    value: Property(
                                                        propid: snapshot.data[
                                                                "recommentations-list"]
                                                            [
                                                            index]["property_id"]),
                                                  );
                                                },
                                              ),
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.42,
                                                // alignment: Alignment.center,
                                                // height: 80,
                                                // width: 100,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(4, 4, 4, 4),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Container(
                                                          // width:
                                                          //     MediaQuery.of(context)
                                                          //         .size
                                                          //         .width,
                                                          height: 100,
                                                          width: 200,
                                                          child: Image.network(
                                                            snapshot.data[
                                                                    "recommentations-list"]
                                                                [
                                                                index]["images"],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 4, 0),
                                                          child: Text(
                                                            snapshot.data[
                                                                    "recommentations-list"]
                                                                    [index]
                                                                    ["status"]
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   snapshot.data[
                                                    //           "recommentations-list"]
                                                    //           [index]["property_id"]
                                                    //       .toString(),
                                                    //   style: TextStyle(
                                                    //     fontSize: 10,
                                                    //     color: Colors.green,
                                                    //   ),
                                                    // ),

                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_rounded,
                                                            size: 20,
                                                            color:
                                                                iconcolorgrey,
                                                          ),
                                                          Text(
                                                            snapshot.data[
                                                                    "recommentations-list"]
                                                                    [index]
                                                                    ["city"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            "\$",
                                                            style: TextStyle(
                                                                color:
                                                                    secondarycolor),
                                                          ),
                                                          Text(
                                                            '${oCcy.format(int.parse(snapshot.data["recommentations-list"][index]["price"]))}',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    secondarycolor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 5, 10, 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .bed_rounded,
                                                                size: 20,
                                                                color:
                                                                    iconcolorgrey,
                                                              ),
                                                              Text(
                                                                snapshot.data[
                                                                        "recommentations-list"]
                                                                        [index]
                                                                        ["beds"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .bathroom_rounded,
                                                                size: 20,
                                                                color:
                                                                    iconcolorgrey,
                                                              ),
                                                              Text(
                                                                snapshot.data[
                                                                        "recommentations-list"]
                                                                        [index][
                                                                        "baths"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .view_array_outlined,
                                                                size: 20,
                                                                color:
                                                                    iconcolorgrey,
                                                              ),
                                                              Text(
                                                                snapshot.data[
                                                                        "recommentations-list"]
                                                                        [index]
                                                                        ["sqft"]
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      new BoxShadow(
                                                        color: shadowColor,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: box),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //////////////// WHAT MAKES LITPOODLE UNIQUE? //////////////////
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "WHAT MAKES LITPOODLE UNIQUE?",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      "LitPoodle's technology is a key differentiator. Here are few ways where our technology stands out"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: secondarycolor,
                                          width: 4.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.map,
                                        // color: secondarycolor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Card(
                                      shadowColor: shadowColor,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: Container(
                                          width: 250,
                                          child: ExpansionTile(
                                            // trailing: const SizedBox(),

                                            // initiallyExpanded: true,
                                            //onExpansionChanged: ,
                                            textColor: secondarycolor,
                                            iconColor: secondarycolor,
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "OUR ALGORITHMS",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  'Our algorithms and calculators provide unique insights and proprietary metrics for every investment opportunity (insights such as how does the home stack up against stock market opportunities)',
                                                  style: TextStyle(
                                                      color: Colors.grey[500]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ///////////////
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: secondarycolor,
                                          width: 4.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.map,
                                        // color: secondarycolor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Card(
                                      shadowColor: shadowColor,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: Container(
                                          width: 250,
                                          child: ExpansionTile(
                                            // trailing: const SizedBox(),

                                            // initiallyExpanded: true,
                                            //onExpansionChanged: ,
                                            textColor: secondarycolor,
                                            iconColor: secondarycolor,
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "PURCHASE TRACKER",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  'Our home purchase tracker provides as much transparency as possible to the purchasing process. Check out our tracker under the Buying Process tab of the User Profile page, after signing up.',
                                                  style: TextStyle(
                                                      color: Colors.grey[500]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /////////////////
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: secondarycolor,
                                          width: 4.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.map,
                                        // color: secondarycolor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Card(
                                      shadowColor: shadowColor,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: Container(
                                          width: 250,
                                          child: ExpansionTile(
                                            // trailing: const SizedBox(),

                                            // initiallyExpanded: true,
                                            //onExpansionChanged: ,
                                            textColor: secondarycolor,
                                            iconColor: secondarycolor,
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "PROPERTY MANAGEMENT",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  'Our revolutionary property management dashboard can make tracking your investment\'s performance as intuitive and efficient as possible)',
                                                  style: TextStyle(
                                                      color: Colors.grey[500]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ///////////////////////////////
                          Text(
                            "TESTIMONIALS",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /////////////////
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 340,
                                      width: 280,
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
                                        child: Column(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: secondarycolor,
                                                    width: 4.0,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.network(
                                                    'https://www.litpoodle.com/assets/search/images/testimonials1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 0, 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Raya Zion"
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      "“It is my pleasure to highly recommend LitPoodle for investment property search. I utilized LitPoodle when I was searching for investment property to expand my family trust. Through LitPoodle I was able to research regions and properties throughout the United States that would prove most lucrative.”",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_rounded,
                                                          color: iconcolorgrey,
                                                          size: 16,
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "San Francisco Bay Area",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 340,
                                      width: 280,
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
                                        child: Column(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: secondarycolor,
                                                    width: 4.0,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.network(
                                                    'https://www.litpoodle.com/assets/search/images/testimonials2.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 0, 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Joseph Chacko"
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      "“as a first-time homebuyer, this home was the biggest purchase of my life till date. Litpoodle helped me with the right numbers to evaluate my decision and make the right investment”",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_rounded,
                                                          color: iconcolorgrey,
                                                          size: 16,
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "New Jersey",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ///////////////////
                        ],
                      ),

                      /////////////

                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "Recommended Homes in Every City",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       Spacer(),

                      //     ],
                      //   ),
                      // ),
                      // //////////////////////
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height * 0.30,
                      //     child: ListView.builder(
                      //         physics: BouncingScrollPhysics(),
                      //         scrollDirection: Axis.horizontal,
                      //         shrinkWrap: true,
                      //         itemCount: snapshot
                      //             .data["recommended-homes-city"].length,
                      //         // ignore: missing_return
                      //         itemBuilder: (BuildContext ctx, index) {
                      //           if (snapshot.hasData) {
                      //             return Card(
                      //               elevation: 3,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: Container(
                      //                   width: 180,
                      //                   //width: MediaQuery.of(context).size.width,
                      //                   height: 80,
                      //                   child: ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(80),
                      //                     child: Image.network(
                      //                       snapshot.data[
                      //                               "recommended-homes-city"]
                      //                           [index]["images"],
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             );
                      //           } else {}
                      //         }),
                      //   ),
                      // )
                    ],
                  ),
                );
              } else {
                Center(
                  child: Text("Some Thing Went Wrong"),
                );
              }
              return SizedBox(
                height: 100,
                child: Center(
                    child: CircularProgressIndicator(
                  color: secondarycolor,
                )),
              );
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.all(5.0),
          //   child: buildIndicator(),
          // ),
          ///////////////

          // FutureBuilder(
          //   future: data,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       return
          //     } else {
          //       const Center(
          //         child: Text("Some Thing Went Wrong"),
          //       );
          //     }
          //     return const Center(child: CircularProgressIndicator());
          //   },
          // ),
        ],
      ),
    );
  }

  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //       activeIndex: activeIndex,
  //       count: 3,
  //       effect:
  //           ExpandingDotsEffect(dotHeight: 6, dotWidth: 5, activeDotColor: dot),
  //     );
}

Widget buildImage(String urlImage, int index) => Container(
      child: Image.network(
        urlImage,
        fit: BoxFit.contain,
      ),
    );
