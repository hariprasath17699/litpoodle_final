// import 'package:flutter/material.dart';
// import 'package:flutter_session/flutter_session.dart';
// import 'package:get/get.dart';

// import 'package:litpoodle/controller/recom_controller.dart';
// import 'package:litpoodle/models/recommended_model.dart';

// class Recommended extends StatelessWidget {
//   final RecommentationsList recommentationsList;
//   Recommended({Key key, this.recommentationsList}) : super(key: key);
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             //child: Text(),
//             ),
//         // FutureBuilder(
//         //     future: FlutterSession().get("token"),
//         //     builder: (context, snapshot) {
//         //       return Text(snapshot.hasData ? snapshot.data : "Loading...");
//         //     })
//       ],
//     );
//   }
// }
////////////////////////////////////////////////////////
///////////////////////////////////////////////
///

import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/recommended_singlepage.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RecommendedSinglePage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      // height: 180,
                      // width: 160,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/american.png",
                                // fit: BoxFit.fitWidth,
                                // width: 130,
                                height: 95,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 11,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "American Fork",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$586,344",
                                  style: TextStyle(
                                      fontSize: 12, color: secondarycolor),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.bed_rounded,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.bathroom_rounded,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "4",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Icon(
                                      Icons.person_outline,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    // Text(
                                    //   "3",
                                    //   style: TextStyle(fontSize: 10, color: Colors.grey),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.view_array_outlined,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "1803",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(10),
                    // height: 180,
                    // width: 160,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/build2.png",
                              fit: BoxFit.fitWidth,
                              height: 95,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 11,
                                color: Colors.grey,
                              ),
                              Text(
                                " Location",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$399,900",
                                style: TextStyle(
                                    fontSize: 12, color: secondarycolor),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.bed_rounded,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.bathroom_rounded,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.person_outline,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  // Text(
                                  //   "3",
                                  //   style: TextStyle(fontSize: 10, color: Colors.grey),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.view_array_rounded,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "1399",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
