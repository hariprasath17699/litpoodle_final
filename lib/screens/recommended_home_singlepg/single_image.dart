import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';

class SingleImage extends StatefulWidget {
  const SingleImage({Key key}) : super(key: key);

  @override
  State<SingleImage> createState() => _SingleImageState();
}

class _SingleImageState extends State<SingleImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //       builder: (context) => DetailPage()),
            // );
          },
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox.fromSize(
                size: Size.fromRadius(150), // Image radius
                child: Image.asset(
                  'assets/images/american.png',
                  height: 60,
                  width: 60,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
