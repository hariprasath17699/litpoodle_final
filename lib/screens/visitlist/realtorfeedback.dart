import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:flutter_html/style.dart';
import 'package:http/http.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:like_button/like_button.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/screens/bottom/visitlist_screen.dart';
import 'package:litpoodle/screens/home_screen_widgets/home_filters.dart';
import 'package:litpoodle/screens/home_screen_widgets/notification_icon.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:litpoodle/screens/scroll_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:readmore/readmore.dart';

class RealtorFeedback extends StatefulWidget {
  final bool showAppBar;
  Visitlistproperty value;
  RealtorFeedback({
    this.showAppBar = true,
    this.value,
  });

  @override
  _RealtorFeedbackState createState() => _RealtorFeedbackState();
}

class _RealtorFeedbackState extends State<RealtorFeedback> {
  bool isLoading = true;

  @override
  void initState() {
    data = propertycall();
    super.initState();

    /// load posts
    //  _loadData();
  }

  Future<Map<String, dynamic>> data;
  final List<String> imgList = [];
  int activeIndex = 0;
  int touchedIndex = -1;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      backgroundColor: Colors.transparent,
      //backgroundColor: Colors.black.withOpacity(0.15),
      //elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
              future: propertycall(),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 300,
                    width: 400,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        itemCount:
                            snapshot.data["property-details"]["gallery"].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                snapshot.data["property-details"]["gallery"]
                                        [index]["photo"]
                                    .toString(),
                                fit: BoxFit.contain,
                                height: 200,
                                width: 250,
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  const Center(
                    child: Text("Some Thing Went Wrong"),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: secondarycolor,
                ));
              })
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close',
              style: TextStyle(
                  color: secondarycolor, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

/////////////////////////////
  Future<Map<String, dynamic>> feedbackphotoscall() async {
    String propid = widget.value.propid;
    String cityname = widget.value.city;
    print(propid);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '$domain_url/api/user/auth/visitlist_feedback/$cityname/$propid'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      print("Realtor feedback city $cityname");
      print("Realtor feedback city propid $propid");
      //print("propid:$propertyid");
      for (int i = 0; i < result["result"]["feedback"].length; i++);
      print(result["result"]["feedback"]);
      print(["result"]);
      print(result);
    } else {
      print("called error");
      print(response.reasonPhrase);
    }
    return result["result"];
  }

///////////////////////////////////////
  Future<Map<String, dynamic>> propertycall() async {
    String propid = widget.value.propid;
    print(propid);
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
      'Cookie': 'ci_session=3ipum7e3oe9m3ob2atlh2vbno7mkbrc5'
    };

    var request = http.Request(
        'GET', Uri.parse('$domain_url/api/home/property_details/$propid/'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("result");
      //print("propid:$propertyid");
      for (int i = 0;
          i < result["result"]["property-details"]["general"].length;
          i++);
      print(result["result"]["property-details"]["general"]);

      print(result["result"]["property-details"]["gallery"].length);
      print(result["result"]["property-details"]["gallery"][0]);

      for (int i = 0;
          i < result["result"]["property-details"]["gallery"].length;
          i++) {
        imgList
            .add(result["result"]["property-details"]["gallery"][i]["photo"]);
      }
      print(imgList);
      print(
          result["result"]["property-details"]["property-tax-details"].length);
      print(result["result"]["property-details"]["property-tax-details"]);
      for (int i = 0;
          i <
              result["result"]["property-details"]["property-tax-details"]
                  .length;
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

  @override
  Widget build(BuildContext context) {
    String propid = widget.value.propid;

    print(propid);
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              height: 100,
              width: 100,
              child: Image.network(
                item,
              ),
            ))
        .toList();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double deviceWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    int divider = 1;

    if (orientation == Orientation.landscape) {
      divider = 2;
    }

    double size = deviceWidth / divider;
///////////////////////////////////////////////////
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      String likepropid = widget.value.propid;
      print(likepropid);

      /// send your request here
      // final bool success= await sendRequest();
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
        'Cookie': 'ci_session=hgdudq36phec2bb55pnkcovgdn21vci5'
      };
      var request = http.Request('GET',
          Uri.parse('$domain_url/api/user/user/insert_wistlist/$likepropid/'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      /// if failed, you can do nothing
      // return success? !isLiked:isLiked;

      return !isLiked;
    }

    //////////////////////////
////////////////////////////////
    Future<bool> NotLikeButtonTapped(bool isnotLiked) async {
      String likepropid = widget.value.propid;
      print(likepropid);

      /// send your request here
      // final bool success= await sendRequest();
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MTkxNDMzMCwibmJmIjoxNjUxOTE0MzYwLCJleHAiOjE2NTE5MTQzOTAsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIifX0.OLoVbvpUjgbG_txFM7sVsLeAcaTT9c92m-TNZ07nW6A',
        'Cookie': 'ci_session=hgdudq36phec2bb55pnkcovgdn21vci5'
      };
      var request = http.Request('GET',
          Uri.parse('$domain_url/api/user/user/insert_wistlist/$likepropid/'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      /// if failed, you can do nothing
      // return success? !isLiked:isLiked;

      return !isnotLiked;
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          //backgroundColor: const Color(0xFF1B1E28).withOpacity(0.25),
          backgroundColor: Colors.black.withOpacity(0.15),
          title: Padding(
              padding: const EdgeInsets.only(bottom: 0.0, top: 10.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  LikeButton(
                    onTap: onLikeButtonTapped,
                    likeBuilder: (isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.white,
                        size: 30,
                      );
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: shadowColor,
                          blurRadius: 5,
                        ),
                      ],
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Filter(context),
                        );
                      },
                      child: Container(
                        child: Icon(
                          Icons.filter_list_rounded,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  NotificationIcon(),
                ],
              )),
          flexibleSpace: FlexibleSpaceBar(
            // title:

            background: FutureBuilder(
                future: propertycall(),
                // ignore: missing_return
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        // physics: BouncingScrollPhysics(),
                        //  shrinkWrap: true,
                        itemCount: snapshot
                            .data["property-details"]["general"]
                                ["default-image"]
                            .length,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0)),
                            child: Image.network(
                              snapshot.data["property-details"]["general"]
                                  ["default-image"],
                              fit: BoxFit.cover,
                            ),
                          );
                        });
                  } else {
                    const Center(
                      child: Text("Some Thing Went Wrong"),
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                    color: secondarycolor,
                  ));
                }),
          ),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.32,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                _content(context),
              ],
            )
          ]),
        )
      ]),
      // body: SingleChildScrollView(
      //     child: Stack(
      //   children: [
      //     Column(
      //       children: [
      //         Container(
      //           // height: (this.widget.height - offset).clamp(0.0, this.widget.height),
      //           child: Hero(
      //             tag: "image",
      //             //tag: 'news-image-' + this.widget.id.toString(),
      //             // tag: null,
      //             child: FutureBuilder(
      //                 future: propertycall(),
      //                 // ignore: missing_return
      //                 builder: (BuildContext context, AsyncSnapshot snapshot) {
      //                   if (snapshot.hasData) {
      //                     return Image.network(snapshot.data["property-details"]
      //                         ["general"]["default-image"]);
      //                   } else
      //                     return CircularProgressIndicator();
      //                 }),
      //             // child: Image(
      //             //   //image:AssetImage(""),
      //             //   image: AssetImage("assets/images/poodle1.PNG") ??
      //             //       NetworkImage(""),
      //             //   fit: BoxFit.cover,
      //             //   width: MediaQuery.of(context).size.width,
      //             // ),
      //           ),
      //         ),
      //         _content(context),
      //       ],
      //     )
      //   ],
      // )),
      // body: Scroll(
      //   1,
      //   //AssetImage(assetName)
      //   NetworkImage(""),
      //   // AssetImage(""),
      //   size,
      //   [_content(context)],
      //   appBar: AppBar(
      //     backgroundColor: const Color(0xFF1B1E28).withOpacity(0.25),
      //     elevation: 0.0,
      //     iconTheme: IconThemeData(color: Colors.white),

      //     /// share button
      //     actions: <Widget>[
      //       // TextButton(
      //       //   onPressed: () {
      //       //     // Share.share(
      //       //     //     this.widget.post.title + ' ' + this.widget.post.link);
      //       //   },
      //       //   child: Icon(Icons.share, color: Colors.white),
      //       // )
      //     ],
      //   ),
      //   padding: 10.0,
      //   contentOffset: 30.0,
      // ),
      // bottomNavigationBar: SafeArea(
      // child: Container(
      //   width: double.infinity,
      //   height: 55.0,
      //   margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
      //   child: ElevatedButton(
      //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => CommentsScreen(this.widget.post.id),
      //     )),
      //     style: ElevatedButton.styleFrom(
      //       shadowColor: secondarybgcolor,
      //       primary: secondarycolor,
      //       padding: EdgeInsets.all(0),
      //       textStyle: TextStyle(
      //         color: isDark ? Colors.white : Color(0xFF1B1E28),
      //         // color: isDark ? Colors.black : Color(0xFF1B1E28),
      //       ),
      //       //  primary: isDark ? Colors.white : Color(0xFF1B1E28), // background
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(3.0)),
      //     ),
      //     child: Text(DecoLocalizations.of(context)
      //         .localizedString("single_post_view_all_comments")),
      //   ),
      // ),
      // ),
    );
  }

  _content(context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: isDark ? Color(0xFF1B1E28) : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //////////////
                FutureBuilder(
                    future: data,
                    // ignore: missing_return
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        double cashflowper = (snapshot.data["poodle-o-meter"]
                                ["home_ranking"]["cash_flow"] /
                            100);
                        double regiongrowthdouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["region_growth"] /
                                100);
                        double neighbourdouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["neighborhood"] /
                                100);
                        double totalscooredouble =
                            (snapshot.data["poodle-o-meter"]["home_ranking"]
                                    ["total_score"] /
                                100);
                        double marketdouble = (snapshot.data["poodle-o-meter"]
                                ["home_ranking"]["better_home"]["value"] /
                            100);
                        print(cashflowper);

                        ////////////////////  Like buutton api /////////////////////

                        return Center(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                          ["general"]["type"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  snapshot.data[
                                                          "property-details"]
                                                      ["general"]["status"],
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),

                                        ////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                                  "property-details"]
                                                              ["general"][
                                                          "region-and-state-code"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                    Text(
                                                      '${oCcy.format(int.parse(snapshot.data["property-details"]["general"]["price"]))}',
                                                      style: TextStyle(
                                                          color:
                                                              secondarycolor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        /////////////////////////

                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["year-built"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["per-sqft"]
                                                          .toString(),
                                                      style: TextStyle(),
                                                    ),
                                                    Text(
                                                      " /per sqft",
                                                      style: TextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        ///////////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bed_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["bedroom"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bathroom_rounded,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["bathroom"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.view_array_outlined,
                                                      color: iconcolorgrey,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                          ["general"]["area"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        //////////////////////////
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "HOA Frequency",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                              "property-details"]
                                                              ["general"]
                                                              ["hoa-frequency"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "HOA",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data[
                                                                  "property-details"]
                                                              ["general"]
                                                          ["month-hoa-fee"],
                                                      style: TextStyle(
                                                          fontSize: 12),
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

                                  // Text(snapshot.data["property-details"]["general"]
                                  //     ["region"]),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 4.0, vertical: 6.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          // shrinkWrap: true,
                                          itemCount: snapshot
                                              .data["property-details"]
                                                  ["gallery"]
                                              .length,
                                          // gridDelegate:
                                          //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                          //         maxCrossAxisExtent: 200,
                                          //         childAspectRatio: 0.8,
                                          //         crossAxisSpacing: 10,
                                          //         mainAxisSpacing: 10),
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return InkWell(
                                              // onTap: () => Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) {
                                              //       return PropertyDetails();
                                              //     },
                                              //   ),
                                              // ),

                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,

                                                  alignment: Alignment.center,
                                                  // height: 80,
                                                  // width: 100,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  _buildPopupDialog(
                                                                      context),
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child:
                                                                Image.network(
                                                              snapshot.data[
                                                                      "property-details"]
                                                                      [
                                                                      "gallery"]
                                                                      [index]
                                                                      ["photo"]
                                                                  .toString(),
                                                              fit: BoxFit.cover,
                                                              height: 80,
                                                              width: 100,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // decoration: BoxDecoration(
                                                  //     boxShadow: [
                                                  //       new BoxShadow(
                                                  //         color: shadowColor,
                                                  //         blurRadius: 3,
                                                  //       ),
                                                  //     ],
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(10),
                                                  //     color: box),
                                                ),
                                              ),
                                              // ),
                                            );

                                            //   decoration: BoxDecoration(
                                            //       border: Border.all(),
                                            //       // color: Colors.amber,
                                            //       borderRadius: BorderRadius.circular(15)),
                                            // );
                                          }),
                                    ),
                                  ),
                                  /////////////////////////////////////////////
                                  ///
                                  Column(
                                    children: [
                                      Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              SizedBox(height: 20.0),
                                              FutureBuilder(
                                                  future: feedbackphotoscall(),
                                                  // ignore: missing_return
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return DefaultTabController(
                                                        length:
                                                            2, // length of tabs
                                                        initialIndex: 0,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: <Widget>[
                                                            Container(
                                                              child: TabBar(
                                                                indicatorColor:
                                                                    secondarycolor,
                                                                isScrollable:
                                                                    false,
                                                                labelColor:
                                                                    secondarycolor,
                                                                unselectedLabelColor:
                                                                    Colors
                                                                        .black,
                                                                tabs: [
                                                                  Tab(
                                                                      text:
                                                                          'Feedback'),
                                                                  Tab(
                                                                      text:
                                                                          'photos'),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                                height:
                                                                    400, //height of TabBarView
                                                                decoration: BoxDecoration(
                                                                    border: Border(
                                                                        top: BorderSide(
                                                                            color: Colors
                                                                                .grey,
                                                                            width:
                                                                                0.5))),
                                                                child: TabBarView(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                          child: ListView.builder(
                                                                              physics: BouncingScrollPhysics(),
                                                                              scrollDirection: Axis.vertical,
                                                                              shrinkWrap: true,
                                                                              itemCount: snapshot.data["feedback"].length,
                                                                              itemBuilder: (BuildContext ctx, index) {
                                                                                return Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "General Command",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["comments"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Other Comments",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["others-comments"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Home Value Estimate",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(snapshot.data["feedback"][index]["estimate-from"]),
                                                                                        Text(" to "),
                                                                                        Text(snapshot.data["feedback"][index]["estimate-to"]),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Rent Estimate",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(snapshot.data["feedback"][index]["rent-estimate-from"]),
                                                                                        Text(" to "),
                                                                                        Text(snapshot.data["feedback"][index]["rent-estimate-to"]),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Maintenance issue",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["maintenance-issue"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Repair Needed",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["repair-needed"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Schools",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["schools-rate"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Crime",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["crime-rate"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Infrastructure",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["infrastructure-rate"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                    Text(
                                                                                      "Community",
                                                                                      style: TextStyle(fontWeight: FontWeight.w700),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 15,
                                                                                    ),
                                                                                    Text(snapshot.data["feedback"][index]["community-rate"]),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              })),
                                                                      Container(
                                                                          child: ListView.builder(
                                                                              physics: BouncingScrollPhysics(),
                                                                              scrollDirection: Axis.vertical,
                                                                              // shrinkWrap: true,
                                                                              itemCount: snapshot.data["feedback"].length,
                                                                              itemBuilder: (BuildContext ctx, index) {
                                                                                return Text(snapshot.data["feedback"][index]["property-id"]);
                                                                              })),
                                                                    ]))
                                                          ],
                                                        ),
                                                      );
                                                    } else {
                                                      Center(
                                                        child: Text(
                                                            "Some Thing Went Wrong"),
                                                      );
                                                    }
                                                    return SizedBox(
                                                      height: 100,
                                                      child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                        color: secondarycolor,
                                                      )),
                                                    );
                                                  })
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  /////////////Tab Bar///////////////////////////////////////////////////////////
                                  // DefaultTabController(
                                  //   length: 6, // length of tabs
                                  //   initialIndex: 0,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.stretch,
                                  //     children: <Widget>[
                                  //       Container(
                                  //         child: TabBar(
                                  //           physics: BouncingScrollPhysics(),
                                  //           labelPadding: EdgeInsets.all(6),
                                  //           padding: EdgeInsets.all(8),
                                  //           isScrollable: true,
                                  //           labelColor: secondarycolor,
                                  //           indicatorColor: secondarycolor,
                                  //           // indicator: UnderlineTabIndicator(
                                  //           //   insets: EdgeInsets.all(5),
                                  //           // ),
                                  //           unselectedLabelColor: Colors.black,
                                  //           tabs: [
                                  //             //// Details tab////
                                  //             Padding(
                                  //               padding:
                                  //                   const EdgeInsets.all(8.0),
                                  //               child: Container(
                                  //                 height: 40,
                                  //                 width: 100,
                                  //                 decoration: BoxDecoration(
                                  //                     boxShadow: [
                                  //                       new BoxShadow(
                                  //                         color: shadowColor,
                                  //                         blurRadius: 3,
                                  //                       ),
                                  //                     ],
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             10),
                                  //                     color: box),
                                  //                 child: Tab(text: 'Details'),
                                  //               ),
                                  //             ),
                                  //             ///////// Poodle-O-Meter  ///////////////////
                                  //             Container(
                                  //               height: 40,
                                  //               width: 140,
                                  //               decoration: BoxDecoration(
                                  //                   boxShadow: [
                                  //                     new BoxShadow(
                                  //                       color: shadowColor,
                                  //                       blurRadius: 3,
                                  //                     ),
                                  //                   ],
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10),
                                  //                   color: box),
                                  //               child: Center(
                                  //                   child: Tab(
                                  //                       text:
                                  //                           'Poodle-O-Meter')),
                                  //             ),
                                  //             /////////// Investor Metrics tab  ///////////////
                                  //             Container(
                                  //               height: 40,
                                  //               width: 140,
                                  //               decoration: BoxDecoration(
                                  //                   boxShadow: [
                                  //                     new BoxShadow(
                                  //                       color: shadowColor,
                                  //                       blurRadius: 3,
                                  //                     ),
                                  //                   ],
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10),
                                  //                   color: box),
                                  //               child: Tab(
                                  //                   text: 'Investor Metrics'),
                                  //             ),
                                  //             ///////////// Cash Flow tab //////////////
                                  //             Container(
                                  //               height: 40,
                                  //               width: 100,
                                  //               decoration: BoxDecoration(
                                  //                   boxShadow: [
                                  //                     new BoxShadow(
                                  //                       color: shadowColor,
                                  //                       blurRadius: 3,
                                  //                     ),
                                  //                   ],
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10),
                                  //                   color: box),
                                  //               child: Tab(text: 'Cash Flow'),
                                  //             ),
                                  //             ////////////Neighborhood tab ////////////
                                  //             Container(
                                  //               height: 40,
                                  //               width: 120,
                                  //               decoration: BoxDecoration(
                                  //                   boxShadow: [
                                  //                     new BoxShadow(
                                  //                       color: shadowColor,
                                  //                       blurRadius: 3,
                                  //                     ),
                                  //                   ],
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10),
                                  //                   color: box),
                                  //               child:
                                  //                   Tab(text: 'Neighborhood'),
                                  //             ),
                                  //             /////////////////  Recommendations tab ///////
                                  //             Container(
                                  //                 height: 40,
                                  //                 width: 150,
                                  //                 decoration: BoxDecoration(
                                  //                     boxShadow: [
                                  //                       new BoxShadow(
                                  //                         color: shadowColor,
                                  //                         blurRadius: 3,
                                  //                       ),
                                  //                     ],
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             10),
                                  //                     color: box),
                                  //                 child: Tab(
                                  //                     text: 'Recommendations')),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //           height: MediaQuery.of(context)
                                  //               .size
                                  //               .height, //height of TabBarView
                                  //           decoration: BoxDecoration(
                                  //               border: Border(
                                  //                   top: BorderSide(
                                  //                       color: Colors.grey,
                                  //                       width: 0.5))),
                                  //           child: TabBarView(
                                  //               physics:
                                  //                   const NeverScrollableScrollPhysics(),
                                  //               children: <Widget>[
                                  //                 ///////////////////////////////  DETAILS    /////////////////////////////
                                  //                 Container(
                                  //                   child: Padding(
                                  //                     padding:
                                  //                         const EdgeInsets.all(
                                  //                             8.0),
                                  //                     child: ReadMoreText(
                                  //                       snapshot.data[
                                  //                                   "property-details"]
                                  //                               ["general"]
                                  //                           ["description"],
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Colors.black),
                                  //                       trimLines: 6,
                                  //                       colorClickableText:
                                  //                           secondarycolor,
                                  //                       trimMode: TrimMode.Line,
                                  //                       trimCollapsedText:
                                  //                           'Read more',
                                  //                       trimExpandedText:
                                  //                           ' Read less',
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 ///////////////////////// Poodle-o-meter/////////////////////////////////////
                                  //                 Container(
                                  //                   child: Padding(
                                  //                     padding:
                                  //                         const EdgeInsets.all(
                                  //                             8.0),
                                  //                     child: Column(
                                  //                       children: [
                                  //                         Text(
                                  //                           "Poodle-o-meter",
                                  //                           style: TextStyle(
                                  //                               fontSize: 16,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold),
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 10,
                                  //                         ),
                                  //                         Text(
                                  //                           snapshot.data[
                                  //                                       "poodle-o-meter"]
                                  //                                   [
                                  //                                   "investment_performance"]
                                  //                               [
                                  //                               "your-investment-of"],
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 10,
                                  //                         ),
                                  //                         Text(
                                  //                           snapshot.data["poodle-o-meter"]
                                  //                                       [
                                  //                                       "investment_performance"]
                                  //                                   [
                                  //                                   "investment-growth"]
                                  //                               ["no-of-years"],
                                  //                           style: TextStyle(
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold),
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 10,
                                  //                         ),
                                  //                         Column(
                                  //                           children: [
                                  //                             Row(
                                  //                               mainAxisAlignment:
                                  //                                   MainAxisAlignment
                                  //                                       .spaceBetween,
                                  //                               children: [
                                  //                                 Row(
                                  //                                   children: [
                                  //                                     new CircularPercentIndicator(
                                  //                                       radius:
                                  //                                           80.0,
                                  //                                       lineWidth:
                                  //                                           10.0,
                                  //                                       animation:
                                  //                                           true,
                                  //                                       percent:
                                  //                                           cashflowper,
                                  //                                       center:
                                  //                                           new Text(
                                  //                                         snapshot
                                  //                                             .data["poodle-o-meter"]["home_ranking"]["cash_flow"]
                                  //                                             .toString(),
                                  //                                         style: new TextStyle(
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             fontSize: 20.0),
                                  //                                       ),
                                  //                                       footer:
                                  //                                           Padding(
                                  //                                         padding:
                                  //                                             const EdgeInsets.all(6.0),
                                  //                                         child:
                                  //                                             new Text(
                                  //                                           "Cash Flow",
                                  //                                           style:
                                  //                                               new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                  //                                         ),
                                  //                                       ),
                                  //                                       circularStrokeCap:
                                  //                                           CircularStrokeCap.round,
                                  //                                       progressColor:
                                  //                                           secondarycolor,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 Row(
                                  //                                   children: [
                                  //                                     new CircularPercentIndicator(
                                  //                                       radius:
                                  //                                           80.0,
                                  //                                       lineWidth:
                                  //                                           10.0,
                                  //                                       animation:
                                  //                                           true,
                                  //                                       percent:
                                  //                                           regiongrowthdouble,
                                  //                                       center:
                                  //                                           new Text(
                                  //                                         snapshot
                                  //                                             .data["poodle-o-meter"]["home_ranking"]["region_growth"]
                                  //                                             .toString(),
                                  //                                         style: new TextStyle(
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             fontSize: 20.0),
                                  //                                       ),
                                  //                                       footer:
                                  //                                           Padding(
                                  //                                         padding:
                                  //                                             const EdgeInsets.all(6.0),
                                  //                                         child:
                                  //                                             new Text(
                                  //                                           "Region Growth",
                                  //                                           style:
                                  //                                               new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                  //                                         ),
                                  //                                       ),
                                  //                                       circularStrokeCap:
                                  //                                           CircularStrokeCap.round,
                                  //                                       progressColor:
                                  //                                           secondarycolor,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 Row(
                                  //                                   children: [
                                  //                                     new CircularPercentIndicator(
                                  //                                       radius:
                                  //                                           80.0,
                                  //                                       lineWidth:
                                  //                                           10.0,
                                  //                                       animation:
                                  //                                           true,
                                  //                                       percent:
                                  //                                           neighbourdouble,
                                  //                                       center:
                                  //                                           new Text(
                                  //                                         snapshot
                                  //                                             .data["poodle-o-meter"]["home_ranking"]["neighborhood"]
                                  //                                             .toString(),
                                  //                                         style: new TextStyle(
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             fontSize: 20.0),
                                  //                                       ),
                                  //                                       footer:
                                  //                                           Padding(
                                  //                                         padding:
                                  //                                             const EdgeInsets.all(6.0),
                                  //                                         child:
                                  //                                             new Text(
                                  //                                           "Neighborhood",
                                  //                                           style:
                                  //                                               new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                  //                                         ),
                                  //                                       ),
                                  //                                       circularStrokeCap:
                                  //                                           CircularStrokeCap.round,
                                  //                                       progressColor:
                                  //                                           secondarycolor,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ],
                                  //                             )
                                  //                           ],
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 10,
                                  //                         ),
                                  //                         // Text(
                                  //                         //   "=",
                                  //                         //   style: TextStyle(
                                  //                         //       color: secondarycolor,
                                  //                         //       fontSize: 30,
                                  //                         //       fontWeight: FontWeight.bold),
                                  //                         // ),
                                  //                         new CircularPercentIndicator(
                                  //                           radius: 80.0,
                                  //                           lineWidth: 10.0,
                                  //                           animation: true,
                                  //                           percent:
                                  //                               totalscooredouble,
                                  //                           center: new Text(
                                  //                             snapshot.data[
                                  //                                     "poodle-o-meter"]
                                  //                                     [
                                  //                                     "home_ranking"]
                                  //                                     [
                                  //                                     "total_score"]
                                  //                                 .toString(),
                                  //                             style: new TextStyle(
                                  //                                 fontWeight:
                                  //                                     FontWeight
                                  //                                         .bold,
                                  //                                 fontSize:
                                  //                                     20.0),
                                  //                           ),
                                  //                           footer: Padding(
                                  //                             padding:
                                  //                                 const EdgeInsets
                                  //                                     .all(6.0),
                                  //                             child: new Text(
                                  //                               "Total Score",
                                  //                               style: new TextStyle(
                                  //                                   fontWeight:
                                  //                                       FontWeight
                                  //                                           .bold,
                                  //                                   fontSize:
                                  //                                       10.0),
                                  //                             ),
                                  //                           ),
                                  //                           circularStrokeCap:
                                  //                               CircularStrokeCap
                                  //                                   .round,
                                  //                           progressColor:
                                  //                               secondarycolor,
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 5,
                                  //                         ),
                                  //                         Row(
                                  //                           crossAxisAlignment:
                                  //                               CrossAxisAlignment
                                  //                                   .center,
                                  //                           // mainAxisAlignment:
                                  //                           //     MainAxisAlignment.spaceEvenly,
                                  //                           children: [
                                  //                             new CircularPercentIndicator(
                                  //                               radius: 80.0,
                                  //                               lineWidth: 10.0,
                                  //                               animation: true,
                                  //                               percent:
                                  //                                   marketdouble,
                                  //                               center:
                                  //                                   new Text(
                                  //                                 snapshot.data[
                                  //                                         "poodle-o-meter"]
                                  //                                         [
                                  //                                         "home_ranking"]
                                  //                                         [
                                  //                                         "better_home"]
                                  //                                         [
                                  //                                         "value"]
                                  //                                     .toString(),
                                  //                                 style: new TextStyle(
                                  //                                     fontWeight:
                                  //                                         FontWeight
                                  //                                             .bold,
                                  //                                     fontSize:
                                  //                                         20.0),
                                  //                               ),
                                  //                               footer:
                                  //                                   new Text(
                                  //                                 "",
                                  //                                 style: new TextStyle(
                                  //                                     fontWeight:
                                  //                                         FontWeight
                                  //                                             .bold,
                                  //                                     fontSize:
                                  //                                         17.0),
                                  //                               ),
                                  //                               circularStrokeCap:
                                  //                                   CircularStrokeCap
                                  //                                       .round,
                                  //                               progressColor:
                                  //                                   secondarycolor,
                                  //                             ),
                                  //                             SizedBox(
                                  //                               width: 5,
                                  //                             ),
                                  //                             Flexible(
                                  //                               child: Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                             .fromLTRB(
                                  //                                         6,
                                  //                                         0,
                                  //                                         0,
                                  //                                         30),
                                  //                                 child: Text(
                                  //                                   snapshot.data["poodle-o-meter"]["home_ranking"]
                                  //                                           [
                                  //                                           "better_home"]
                                  //                                       [
                                  //                                       "text"],
                                  //                                   style: TextStyle(
                                  //                                       fontSize:
                                  //                                           12),
                                  //                                 ),
                                  //                               ),
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                         SizedBox(
                                  //                           height: 5,
                                  //                         ),
                                  //                         Container(
                                  //                           decoration: BoxDecoration(
                                  //                               boxShadow: [
                                  //                                 new BoxShadow(
                                  //                                   color:
                                  //                                       shadowColor,
                                  //                                   blurRadius:
                                  //                                       3,
                                  //                                 ),
                                  //                               ],
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           10),
                                  //                               color: box),
                                  //                           child: Center(
                                  //                             child: Row(
                                  //                               crossAxisAlignment:
                                  //                                   CrossAxisAlignment
                                  //                                       .center,
                                  //                               // mainAxisAlignment:
                                  //                               //     MainAxisAlignment.spaceEvenly,
                                  //                               children: [
                                  //                                 Padding(
                                  //                                   padding:
                                  //                                       const EdgeInsets.fromLTRB(
                                  //                                           0,
                                  //                                           0,
                                  //                                           0,
                                  //                                           0),
                                  //                                   child:
                                  //                                       SizedBox(
                                  //                                     height:
                                  //                                         80,
                                  //                                     width: 80,
                                  //                                     child: SvgPicture
                                  //                                         .network(
                                  //                                       'https://www.litpoodle.com/styles/img/home-svg/poodle.svg',
                                  //                                       semanticsLabel:
                                  //                                           'poodle',
                                  //                                       placeholderBuilder: (BuildContext context) => Container(
                                  //                                           padding:
                                  //                                               const EdgeInsets.all(30.0),
                                  //                                           child: const CircularProgressIndicator()),
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                                 SizedBox(
                                  //                                   width: 5,
                                  //                                 ),
                                  //                                 Flexible(
                                  //                                   child:
                                  //                                       Padding(
                                  //                                     padding: const EdgeInsets
                                  //                                             .fromLTRB(
                                  //                                         10,
                                  //                                         12,
                                  //                                         0,
                                  //                                         20),
                                  //                                     child:
                                  //                                         Column(
                                  //                                       crossAxisAlignment:
                                  //                                           CrossAxisAlignment.start,
                                  //                                       children: [
                                  //                                         Text(
                                  //                                           snapshot.data["poodle-o-meter"]["home_ranking"]["better_home"]["litpoodle-verdict"]["title"].toString().toUpperCase(),
                                  //                                           style:
                                  //                                               TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               5,
                                  //                                         ),
                                  //                                         Text(
                                  //                                           snapshot.data["poodle-o-meter"]["home_ranking"]["better_home"]["litpoodle-verdict"]["body"],
                                  //                                           style:
                                  //                                               TextStyle(fontSize: 12),
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                               ],
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 //////////////////////  Investor Metrics ///////////////////////////////////////////////
                                  //                 Container(
                                  //                   child: Column(
                                  //                     children: [
                                  //                       Text(
                                  //                         "Investor Metrics",
                                  //                         style: TextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 20,
                                  //                       ),
                                  //                       //////////////////////
                                  //                       Container(
                                  //                         height: 110,
                                  //                         width: 300,
                                  //                         decoration: BoxDecoration(
                                  //                             boxShadow: [
                                  //                               new BoxShadow(
                                  //                                 color:
                                  //                                     shadowColor,
                                  //                                 blurRadius: 3,
                                  //                               ),
                                  //                             ],
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         10),
                                  //                             color: box),
                                  //                         child: Column(
                                  //                           mainAxisAlignment:
                                  //                               MainAxisAlignment
                                  //                                   .spaceEvenly,
                                  //                           children: [
                                  //                             Row(
                                  //                               mainAxisAlignment:
                                  //                                   MainAxisAlignment
                                  //                                       .spaceEvenly,
                                  //                               children: [
                                  //                                 Column(
                                  //                                   children: [
                                  //                                     Text(
                                  //                                       snapshot
                                  //                                           .data["investor-metrics"]["monthly-estimated-rent"]
                                  //                                           .toString(),
                                  //                                       style: TextStyle(
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                     Text(
                                  //                                       "Estimated Rent",
                                  //                                       style: TextStyle(
                                  //                                           fontSize:
                                  //                                               8,
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 Text(
                                  //                                   "/",
                                  //                                   style: TextStyle(
                                  //                                       color:
                                  //                                           secondarycolor,
                                  //                                       fontWeight:
                                  //                                           FontWeight.w700),
                                  //                                 ),
                                  //                                 Column(
                                  //                                   children: [
                                  //                                     Text(
                                  //                                       snapshot
                                  //                                           .data["investor-metrics"]["price-of-home"]
                                  //                                           .toString(),
                                  //                                       style: TextStyle(
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                     Text(
                                  //                                       "Purchase Price",
                                  //                                       style: TextStyle(
                                  //                                           fontSize:
                                  //                                               8,
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 Text(
                                  //                                   "=",
                                  //                                   style: TextStyle(
                                  //                                       color:
                                  //                                           secondarycolor,
                                  //                                       fontWeight:
                                  //                                           FontWeight.w700),
                                  //                                 ),
                                  //                                 Column(
                                  //                                   children: [
                                  //                                     Text(
                                  //                                       snapshot
                                  //                                           .data["investor-metrics"]["gross-rent-yiels"]
                                  //                                           .toString(),
                                  //                                       style: TextStyle(
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                     Text(
                                  //                                       " Annual Rental",
                                  //                                       style: TextStyle(
                                  //                                           fontSize:
                                  //                                               8,
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ],
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 20,
                                  //                       ),
                                  //                       ///////////////////////
                                  //                       SingleChildScrollView(
                                  //                         physics:
                                  //                             BouncingScrollPhysics(),
                                  //                         scrollDirection:
                                  //                             Axis.horizontal,
                                  //                         child: Container(
                                  //                           height: 110,
                                  //                           width: 300,
                                  //                           decoration: BoxDecoration(
                                  //                               boxShadow: [
                                  //                                 new BoxShadow(
                                  //                                   color:
                                  //                                       shadowColor,
                                  //                                   blurRadius:
                                  //                                       3,
                                  //                                 ),
                                  //                               ],
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           10),
                                  //                               color: box),
                                  //                           child: Column(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .spaceEvenly,
                                  //                             children: [
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                             .all(
                                  //                                         8.0),
                                  //                                 child: Row(
                                  //                                   mainAxisAlignment:
                                  //                                       MainAxisAlignment
                                  //                                           .spaceEvenly,
                                  //                                   children: [
                                  //                                     Column(
                                  //                                       children: [
                                  //                                         SvgPicture
                                  //                                             .network(
                                  //                                           "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                  //                                           height:
                                  //                                               50,
                                  //                                           width:
                                  //                                               50,
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               10,
                                  //                                         ),
                                  //                                         Row(
                                  //                                           children: [
                                  //                                             Text(
                                  //                                               "\$",
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                             Text(
                                  //                                               snapshot.data["investor-metrics"]["your-investment"].toString(),
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                           ],
                                  //                                         ),
                                  //                                         Text(
                                  //                                           "Your investment",
                                  //                                           style:
                                  //                                               TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                     Text(
                                  //                                       "=",
                                  //                                       style: TextStyle(
                                  //                                           color:
                                  //                                               secondarycolor,
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                     /////////////////
                                  //                                     Column(
                                  //                                       children: [
                                  //                                         SvgPicture
                                  //                                             .network(
                                  //                                           "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/dog-house.svg",
                                  //                                           height:
                                  //                                               50,
                                  //                                           width:
                                  //                                               50,
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               10,
                                  //                                         ),
                                  //                                         Row(
                                  //                                           children: [
                                  //                                             Text(
                                  //                                               "\$",
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                             Text(
                                  //                                               snapshot.data["investor-metrics"]["downpayment"].toString(),
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                           ],
                                  //                                         ),
                                  //                                         Text(
                                  //                                           "Downpayment ",
                                  //                                           style:
                                  //                                               TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                     Text(
                                  //                                       "+",
                                  //                                       style: TextStyle(
                                  //                                           color:
                                  //                                               secondarycolor,
                                  //                                           fontWeight:
                                  //                                               FontWeight.w700),
                                  //                                     ),
                                  //                                     /////////////
                                  //                                     Column(
                                  //                                       children: [
                                  //                                         SvgPicture
                                  //                                             .network(
                                  //                                           "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/file.svg",
                                  //                                           height:
                                  //                                               50,
                                  //                                           width:
                                  //                                               50,
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               10,
                                  //                                         ),
                                  //                                         Row(
                                  //                                           children: [
                                  //                                             Text(
                                  //                                               "\$",
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                             Text(
                                  //                                               snapshot.data["investor-metrics"]["closing-and-leasing-cost"].toString(),
                                  //                                               style: TextStyle(color: secondarycolor, fontSize: 12, fontWeight: FontWeight.w700),
                                  //                                             ),
                                  //                                           ],
                                  //                                         ),
                                  //                                         Text(
                                  //                                           "Closing & Leasing Costs",
                                  //                                           style:
                                  //                                               TextStyle(fontSize: 8, fontWeight: FontWeight.w700),
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       ),

                                  //                       SizedBox(
                                  //                         height: 20,
                                  //                       ),
                                  //                       /////////////////////////////////   /////////////////
                                  //                       Padding(
                                  //                         padding:
                                  //                             const EdgeInsets
                                  //                                 .all(12.0),
                                  //                         child: Text(
                                  //                           "Monthly Net Cash Flow before taxes will be",
                                  //                           style: TextStyle(
                                  //                               fontSize: 12,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .w700),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height: 110,
                                  //                         width: 300,
                                  //                         decoration: BoxDecoration(
                                  //                             boxShadow: [
                                  //                               new BoxShadow(
                                  //                                 color:
                                  //                                     shadowColor,
                                  //                                 blurRadius: 3,
                                  //                               ),
                                  //                             ],
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         10),
                                  //                             color: box),
                                  //                         child: Padding(
                                  //                           padding:
                                  //                               const EdgeInsets
                                  //                                   .all(8.0),
                                  //                           child: Row(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .spaceEvenly,
                                  //                             children: [
                                  //                               Column(
                                  //                                 children: [
                                  //                                   SvgPicture
                                  //                                       .network(
                                  //                                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                  //                                     height:
                                  //                                         50,
                                  //                                     width: 50,
                                  //                                   ),
                                  //                                   SizedBox(
                                  //                                     height:
                                  //                                         10,
                                  //                                   ),
                                  //                                   Row(
                                  //                                     children: [
                                  //                                       Text(
                                  //                                         "\$",
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                       Text(
                                  //                                         snapshot
                                  //                                             .data["investor-metrics"]["monthly-net-cash"]["1st-year"]
                                  //                                             .toString(),
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                     ],
                                  //                                   ),
                                  //                                   Text(
                                  //                                     "1st Year",
                                  //                                     style: TextStyle(
                                  //                                         fontSize:
                                  //                                             10,
                                  //                                         fontWeight:
                                  //                                             FontWeight.w700),
                                  //                                   ),
                                  //                                 ],
                                  //                               ),
                                  //                               /////////////////
                                  //                               Column(
                                  //                                 children: [
                                  //                                   SvgPicture
                                  //                                       .network(
                                  //                                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                  //                                     height:
                                  //                                         50,
                                  //                                     width: 50,
                                  //                                   ),
                                  //                                   SizedBox(
                                  //                                     height:
                                  //                                         10,
                                  //                                   ),
                                  //                                   Row(
                                  //                                     children: [
                                  //                                       Text(
                                  //                                         "\$",
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                       Text(
                                  //                                         snapshot
                                  //                                             .data["investor-metrics"]["monthly-net-cash"]["10th-year"]
                                  //                                             .toString(),
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                     ],
                                  //                                   ),
                                  //                                   Text(
                                  //                                     "10th Year",
                                  //                                     style: TextStyle(
                                  //                                         fontSize:
                                  //                                             10,
                                  //                                         fontWeight:
                                  //                                             FontWeight.w700),
                                  //                                   ),
                                  //                                 ],
                                  //                               ),
                                  //                               /////////////
                                  //                               Column(
                                  //                                 children: [
                                  //                                   SvgPicture
                                  //                                       .network(
                                  //                                     "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/elephant-coin.svg",
                                  //                                     height:
                                  //                                         50,
                                  //                                     width: 50,
                                  //                                   ),
                                  //                                   SizedBox(
                                  //                                     height:
                                  //                                         10,
                                  //                                   ),
                                  //                                   Row(
                                  //                                     children: [
                                  //                                       Text(
                                  //                                         "\$",
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                       Text(
                                  //                                         snapshot
                                  //                                             .data["investor-metrics"]["monthly-net-cash"]["30th-year"]
                                  //                                             .toString(),
                                  //                                         style: TextStyle(
                                  //                                             color: secondarycolor,
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.w700),
                                  //                                       ),
                                  //                                     ],
                                  //                                   ),
                                  //                                   Text(
                                  //                                     "30th Year",
                                  //                                     style: TextStyle(
                                  //                                         fontSize:
                                  //                                             10,
                                  //                                         fontWeight:
                                  //                                             FontWeight.w700),
                                  //                                   ),
                                  //                                 ],
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 //////////////////////////////////  Cash flow /////////////////////////
                                  //                 Container(
                                  //                   child: Column(
                                  //                     children: [
                                  //                       Text(
                                  //                         "Cash Flow",
                                  //                         style: TextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 10,
                                  //                       ),
                                  //                       Text(
                                  //                         "Estimated Monthly Expenses",
                                  //                         style: TextStyle(
                                  //                             fontSize: 14,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold),
                                  //                       ),
                                  //                       AspectRatio(
                                  //                         aspectRatio: 1.3,
                                  //                         child: Card(
                                  //                           color: Colors.white,
                                  //                           child: Row(
                                  //                             children: <
                                  //                                 Widget>[
                                  //                               const SizedBox(
                                  //                                 height: 18,
                                  //                               ),
                                  //                               Expanded(
                                  //                                 child:
                                  //                                     AspectRatio(
                                  //                                   aspectRatio:
                                  //                                       1,
                                  //                                   child:
                                  //                                       PieChart(
                                  //                                     PieChartData(
                                  //                                         pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event,
                                  //                                             pieTouchResponse) {
                                  //                                           setState(() {
                                  //                                             if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                  //                                               touchedIndex = -1;
                                  //                                               return;
                                  //                                             }
                                  //                                             touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                                  //                                           });
                                  //                                         }),
                                  //                                         borderData:
                                  //                                             FlBorderData(
                                  //                                           show:
                                  //                                               false,
                                  //                                         ),
                                  //                                         sectionsSpace:
                                  //                                             0,
                                  //                                         centerSpaceRadius:
                                  //                                             40,
                                  //                                         sections:
                                  //                                             showingSections()),
                                  //                                   ),
                                  //                                 ),
                                  //                               ),
                                  //                               Column(
                                  //                                 mainAxisSize:
                                  //                                     MainAxisSize
                                  //                                         .max,
                                  //                                 mainAxisAlignment:
                                  //                                     MainAxisAlignment
                                  //                                         .end,
                                  //                                 crossAxisAlignment:
                                  //                                     CrossAxisAlignment
                                  //                                         .start,
                                  //                                 children: const <
                                  //                                     Widget>[
                                  //                                   // Indicator(
                                  //                                   //   color: Color(0xff0293ee),
                                  //                                   //   text: 'First',
                                  //                                   //   isSquare: true,
                                  //                                   // ),
                                  //                                   // SizedBox(
                                  //                                   //   height: 4,
                                  //                                   // ),
                                  //                                   // Indicator(
                                  //                                   //   color: Color(0xfff8b250),
                                  //                                   //   text: 'Second',
                                  //                                   //   isSquare: true,
                                  //                                   // ),
                                  //                                   // SizedBox(
                                  //                                   //   height: 4,
                                  //                                   // ),
                                  //                                   // Indicator(
                                  //                                   //   color: Color(0xff845bef),
                                  //                                   //   text: 'Third',
                                  //                                   //   isSquare: true,
                                  //                                   // ),
                                  //                                   // SizedBox(
                                  //                                   //   height: 4,
                                  //                                   // ),
                                  //                                   // Indicator(
                                  //                                   //   color: Color(0xff13d38e),
                                  //                                   //   text: 'Fourth',
                                  //                                   //   isSquare: true,
                                  //                                   // ),
                                  //                                   SizedBox(
                                  //                                     height:
                                  //                                         18,
                                  //                                   ),
                                  //                                 ],
                                  //                               ),
                                  //                               const SizedBox(
                                  //                                 width: 28,
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 ///////////////////////////// Neighborhood //////////////////////////////////
                                  //                 Container(
                                  //                   child: Column(
                                  //                     children: [
                                  //                       Text(
                                  //                         "Neighborhood",
                                  //                         style: TextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold),
                                  //                       ),
                                  //                       Padding(
                                  //                         padding:
                                  //                             const EdgeInsets
                                  //                                 .all(0.0),
                                  //                         child:
                                  //                             SingleChildScrollView(
                                  //                           physics:
                                  //                               BouncingScrollPhysics(),
                                  //                           scrollDirection:
                                  //                               Axis.horizontal,
                                  //                           child: Row(
                                  //                             children: [
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                             .all(
                                  //                                         8.0),
                                  //                                 child:
                                  //                                     Container(
                                  //                                   height: 140,
                                  //                                   width: 150,
                                  //                                   decoration: BoxDecoration(
                                  //                                       boxShadow: [
                                  //                                         new BoxShadow(
                                  //                                           color:
                                  //                                               shadowColor,
                                  //                                           blurRadius:
                                  //                                               3,
                                  //                                         ),
                                  //                                       ],
                                  //                                       borderRadius:
                                  //                                           BorderRadius.circular(
                                  //                                               20),
                                  //                                       color:
                                  //                                           box),
                                  //                                   child:
                                  //                                       Padding(
                                  //                                     padding:
                                  //                                         const EdgeInsets.all(
                                  //                                             8.0),
                                  //                                     child:
                                  //                                         Column(
                                  //                                       children: [
                                  //                                         SvgPicture
                                  //                                             .network(
                                  //                                           "https://www.litpoodle.com/assets/new/assets/img/home-details-svg/shiba.svg",
                                  //                                           height:
                                  //                                               80,
                                  //                                           width:
                                  //                                               80,
                                  //                                           fit:
                                  //                                               BoxFit.contain,
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               8,
                                  //                                         ),
                                  //                                         Column(
                                  //                                           children: [
                                  //                                             Text(
                                  //                                               "Median Household Income",
                                  //                                               style: TextStyle(fontSize: 10),
                                  //                                             ),
                                  //                                             Row(
                                  //                                               mainAxisAlignment: MainAxisAlignment.center,
                                  //                                               children: [
                                  //                                                 Text(
                                  //                                                   "\$",
                                  //                                                   style: TextStyle(color: secondarycolor),
                                  //                                                 ),
                                  //                                                 Text(
                                  //                                                   snapshot.data["neighborhood"]["median-household-income"].toString(),
                                  //                                                   style: TextStyle(color: secondarycolor, fontSize: 12),
                                  //                                                 ),
                                  //                                               ],
                                  //                                             ),
                                  //                                           ],
                                  //                                         )
                                  //                                       ],
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                               ),
                                  //                               // SizedBox(
                                  //                               //   width: 5,
                                  //                               // ),
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                             .all(
                                  //                                         6.0),
                                  //                                 child:
                                  //                                     Container(
                                  //                                   height: 145,
                                  //                                   width: 145,
                                  //                                   decoration: BoxDecoration(
                                  //                                       boxShadow: [
                                  //                                         new BoxShadow(
                                  //                                           color:
                                  //                                               shadowColor,
                                  //                                           blurRadius:
                                  //                                               3,
                                  //                                         ),
                                  //                                       ],
                                  //                                       borderRadius:
                                  //                                           BorderRadius.circular(
                                  //                                               20),
                                  //                                       color:
                                  //                                           box),
                                  //                                   child:
                                  //                                       Padding(
                                  //                                     padding:
                                  //                                         const EdgeInsets.all(
                                  //                                             8.0),
                                  //                                     child:
                                  //                                         Column(
                                  //                                       children: [
                                  //                                         SvgPicture
                                  //                                             .network(
                                  //                                           "https://www.litpoodle.com/assets/new/assets/img/school.svg",
                                  //                                           height:
                                  //                                               90,
                                  //                                           width:
                                  //                                               90,
                                  //                                           fit:
                                  //                                               BoxFit.contain,
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               5,
                                  //                                         ),
                                  //                                         Row(
                                  //                                           mainAxisAlignment:
                                  //                                               MainAxisAlignment.spaceBetween,
                                  //                                           children: [
                                  //                                             Column(
                                  //                                               children: [
                                  //                                                 Text(
                                  //                                                   "Elementary",
                                  //                                                   style: TextStyle(fontSize: 8),
                                  //                                                 ),
                                  //                                                 Text(
                                  //                                                   snapshot.data["neighborhood"]["school"]["elementary"].toString(),
                                  //                                                   style: TextStyle(),
                                  //                                                 ),
                                  //                                               ],
                                  //                                             ),
                                  //                                             Column(
                                  //                                               children: [
                                  //                                                 Text(
                                  //                                                   "Middle",
                                  //                                                   style: TextStyle(fontSize: 8),
                                  //                                                 ),
                                  //                                                 Text(
                                  //                                                   snapshot.data["neighborhood"]["school"]["middle"].toString(),
                                  //                                                   style: TextStyle(),
                                  //                                                 ),
                                  //                                               ],
                                  //                                             ),
                                  //                                             Column(
                                  //                                               children: [
                                  //                                                 Text(
                                  //                                                   "High",
                                  //                                                   style: TextStyle(fontSize: 8),
                                  //                                                 ),
                                  //                                                 Text(
                                  //                                                   snapshot.data["neighborhood"]["school"]["high"].toString(),
                                  //                                                   style: TextStyle(),
                                  //                                                 ),
                                  //                                               ],
                                  //                                             ),
                                  //                                           ],
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),

                                  //                 /////////////////////////// Recommendations //////////////////////////
                                  //                 Container(
                                  //                   child: Center(
                                  //                       child: Column(
                                  //                     children: [
                                  //                       Text(
                                  //                         "Other Recommendations",
                                  //                         style: TextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold),
                                  //                       ),
                                  //                       Padding(
                                  //                         padding:
                                  //                             const EdgeInsets
                                  //                                 .all(8.0),
                                  //                         child: Column(
                                  //                           children: [
                                  //                             Text(
                                  //                               "You could split your investment and buy multiple smaller homes instead of buying one big home.",
                                  //                               style: TextStyle(
                                  //                                   fontSize:
                                  //                                       12,
                                  //                                   fontWeight:
                                  //                                       FontWeight
                                  //                                           .w700),
                                  //                             ),
                                  //                             SizedBox(
                                  //                               height: 20,
                                  //                             ),
                                  //                             Row(
                                  //                               mainAxisAlignment:
                                  //                                   MainAxisAlignment
                                  //                                       .spaceEvenly,
                                  //                               children: [
                                  //                                 Container(
                                  //                                   width: 150,
                                  //                                   decoration: BoxDecoration(
                                  //                                       boxShadow: [
                                  //                                         new BoxShadow(
                                  //                                           color:
                                  //                                               shadowColor,
                                  //                                           blurRadius:
                                  //                                               3,
                                  //                                         ),
                                  //                                       ],
                                  //                                       borderRadius:
                                  //                                           BorderRadius.circular(
                                  //                                               10),
                                  //                                       color:
                                  //                                           box),
                                  //                                   child:
                                  //                                       Container(
                                  //                                     child: Image
                                  //                                         .network(
                                  //                                       "https://www.litpoodle.com/assets/new/assets/img/split.png",
                                  //                                       height:
                                  //                                           100,
                                  //                                       width:
                                  //                                           100,
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                                 Text(
                                  //                                   ">",
                                  //                                   style: TextStyle(
                                  //                                       color:
                                  //                                           secondarycolor,
                                  //                                       fontSize:
                                  //                                           20),
                                  //                                 ),
                                  //                                 Container(
                                  //                                   decoration: BoxDecoration(
                                  //                                       boxShadow: [
                                  //                                         new BoxShadow(
                                  //                                           color:
                                  //                                               shadowColor,
                                  //                                           blurRadius:
                                  //                                               3,
                                  //                                         ),
                                  //                                       ],
                                  //                                       borderRadius:
                                  //                                           BorderRadius.circular(
                                  //                                               10),
                                  //                                       color:
                                  //                                           box),
                                  //                                   child: Image
                                  //                                       .network(
                                  //                                     "https://www.litpoodle.com/assets/new/assets/img/big-home-lit.png",
                                  //                                     height:
                                  //                                         100,
                                  //                                     width:
                                  //                                         100,
                                  //                                   ),
                                  //                                 )
                                  //                               ],
                                  //                             ),
                                  //                             SizedBox(
                                  //                               height: 20,
                                  //                             ),
                                  //                             Column(
                                  //                               children: [
                                  //                                 Padding(
                                  //                                   padding:
                                  //                                       const EdgeInsets.all(
                                  //                                           8.0),
                                  //                                   child: Text(
                                  //                                     "The reason is, most often the smaller homes have higher returns than bigger properties. Also you get to diversify your portfolio and reduce risk.",
                                  //                                     style: TextStyle(
                                  //                                         fontSize:
                                  //                                             12,
                                  //                                         fontWeight: FontWeight
                                  //                                             .w700,
                                  //                                         color: Colors
                                  //                                             .grey
                                  //                                             .shade500),
                                  //                                   ),
                                  //                                 ),
                                  //                                 SizedBox(
                                  //                                   height: 25,
                                  //                                 ),
                                  //                                 Text(
                                  //                                   "Litpoodle Idea",
                                  //                                   style: TextStyle(
                                  //                                       fontSize:
                                  //                                           20,
                                  //                                       fontWeight:
                                  //                                           FontWeight.bold),
                                  //                                 ),
                                  //                                 SizedBox(
                                  //                                   height: 15,
                                  //                                 ),
                                  //                                 Padding(
                                  //                                   padding:
                                  //                                       const EdgeInsets.all(
                                  //                                           8.0),
                                  //                                   child:
                                  //                                       Container(
                                  //                                     height:
                                  //                                         150,
                                  //                                     width:
                                  //                                         150,
                                  //                                     decoration: BoxDecoration(
                                  //                                         boxShadow: [
                                  //                                           new BoxShadow(
                                  //                                             color: shadowColor,
                                  //                                             blurRadius: 3,
                                  //                                           ),
                                  //                                         ],
                                  //                                         borderRadius: BorderRadius.circular(
                                  //                                             20),
                                  //                                         color:
                                  //                                             box),
                                  //                                     child:
                                  //                                         Padding(
                                  //                                       padding:
                                  //                                           const EdgeInsets.all(8.0),
                                  //                                       child: Image
                                  //                                           .network(
                                  //                                         "https://www.litpoodle.com/assets/new/assets/img/increase.png",
                                  //                                         height:
                                  //                                             80,
                                  //                                         width:
                                  //                                             80,
                                  //                                       ),
                                  //                                     ),
                                  //                                   ),
                                  //                                 ),
                                  //                                 SizedBox(
                                  //                                   height: 20,
                                  //                                 ),
                                  //                                 Text(
                                  //                                   "Increase your investment amount !!!",
                                  //                                   style: TextStyle(
                                  //                                       fontSize:
                                  //                                           16),
                                  //                                 ),
                                  //                                 //////////////////
                                  //                               ],
                                  //                             )
                                  //                           ],
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )),
                                  //                 )
                                  //               ]))
                                  //     ],
                                  //   ),
                                  // ),

//////////////////////////////////////////////////////////////////////////////////////////////////////

                                  // Image.network(snapshot.data["property-details"]
                                  //     ["general"]["default-image"])
                                ],
                              ),
                            )
                          ],
                        ));
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        color: secondarycolor,
                      ));
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///////////////////////////////
  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 8,
            title: '8%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.pink,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 11,
            title: '11%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: 6,
            title: '6%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.lightBlueAccent,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.amber,
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
