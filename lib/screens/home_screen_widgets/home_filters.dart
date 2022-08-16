import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:litpoodle/screens/home_screen_widgets/Home_screen_filter.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_single_page.dart';
import 'package:litpoodle/screens/home_screen_widgets/search_widget.dart';
import 'package:localstorage/localstorage.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../blogfc/screens/home_screen.dart';

class Filter extends StatefulWidget {
  final Search value;
   Filter(BuildContext context, {Key key,this.value}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState(value);
}

class _FilterState extends State<Filter> {
  Color lowhighpricecolor = Colors.grey;
  Color highlowpricecolor = Colors.grey;
  Color sqftcolor = Colors.grey;
  Color bathcolor = Colors.grey;
  Color bedcolor = Colors.grey;
  Color yearscolor = Colors.grey;
  Color siglefamilycolor = Colors.grey;
  Color multifamilycolor = Colors.grey;
  Color mobilecolor = Colors.grey;
  Color landcolor = Colors.grey;
  Color otherscolor = Colors.grey;
  Color Condocolor = Colors.grey;
  Color newconstructioncolor = Colors.grey;
  Color foreclosure = Colors.grey;
  Color pool = Colors.grey;
  Color waterfront = Colors.grey;
  Color fireplace = Colors.grey;
  Color energyefficient = Colors.grey;
  Color washerdryer = Colors.grey;
  Color garage = Colors.grey;
  Color yes = Colors.grey;
  Color No = Colors.grey;
  Color pending = Colors.grey;
  bool lowhighpricecolorfilter = false;
  bool highlowpricecolorfilter = false;
  bool sqftcolorfilter = false;
  bool bathcolorfilter = false;
  bool bedcolorfilter = false;
  bool yearscolorfilter = false;
  bool siglefamilycolorfilter = false;
  bool multifamilycolorfilter = false;
  bool mobilecolorfilter = false;
  bool landcolorfilter = false;
  bool otherscolorfilter = false;
  bool Condocolorfilter = false;
  bool newconstructioncolorfilter = false;
  bool foreclosurefilter = false;
  bool poolfilter = false;
  bool waterfrontfilter = false;
  bool fireplacefilter = false;
  bool energyefficientfilter = false;
  bool washerdryerfilter = false;
  bool garagefilter = false;
  bool yesfilter = false;
  bool Nofilter = false;
  final TextEditingController beds = TextEditingController();
  final TextEditingController baths = TextEditingController();
  final TextEditingController pricemin = TextEditingController();
  final TextEditingController pricemax = TextEditingController();
  final TextEditingController agemin = TextEditingController();
  final TextEditingController agemax = TextEditingController();
  final TextEditingController sqftmin = TextEditingController();
  final TextEditingController sqftmax = TextEditingController();
  final TextEditingController plotsizemin = TextEditingController();
  final TextEditingController plotsizemax = TextEditingController();
  final LocalStorage storage = new LocalStorage('litpoodle');
  Search value;
  _FilterState(this.value);
  SfRangeValues price = SfRangeValues(0, 100);
  SfRangeValues age = SfRangeValues(0, 100);
  SfRangeValues sqft = SfRangeValues(0, 100);
  SfRangeValues plotsize = SfRangeValues(0, 100);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    storage.getItem('highlowpricecolorfilter') == true ? highlowpricecolor = Colors.red : Colors.grey;
    storage.getItem('sqftcolorfilter')  == true ? sqftcolor = Colors.red: Colors.grey;
    storage.getItem('bathcolorfilter') == true ? bathcolor = Colors.red: Colors.grey;
    storage.getItem('bedcolorfilter') == true ? bedcolor = Colors.red: Colors.grey;
    storage.getItem('yearscolorfilter') == true ? yearscolor = Colors.red: Colors.grey;
    storage.getItem('siglefamilycolorfilter') == true ? siglefamilycolor = Colors.red: Colors.grey;
    storage.getItem('multifamilycolorfilter') == true ? multifamilycolor = Colors.red: Colors.grey;
    storage.getItem('mobilecolorfilter') == true ? mobilecolor = Colors.red: Colors.grey;
    storage.getItem('landcolorfilter') == true ? landcolor = Colors.red: Colors.grey;
    storage.getItem('otherscolorfilter') == true ? otherscolor = Colors.red: Colors.grey;
    storage.getItem('Condocolorfilter') == true ? Condocolor = Colors.red: Colors.grey;
    storage.getItem('newconstructioncolorfilter') == true ? newconstructioncolor = Colors.red: Colors.grey;
    storage.getItem('foreclosurefilter') == true ? foreclosure = Colors.red: Colors.grey;
    storage.getItem('poolfilter') == true ? pool = Colors.red: Colors.grey;
    storage.getItem('waterfrontfilter') == true ? waterfront = Colors.red: Colors.grey;
    storage.getItem('fireplacefilter') == true ? fireplace = Colors.red: Colors.grey;
    storage.getItem('energyefficientfilter') == true ? energyefficient = Colors.red: Colors.grey;
    storage.getItem('washerdryerfilter') == true ? washerdryer = Colors.red: Colors.grey;
    storage.getItem('garagefilter') == true ? garage = Colors.red: Colors.grey;
    storage.getItem('pending') == true ? pending = Colors.red: Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: bgColor,
        insetPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          //vertical: 100.0,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: (() {
                      Navigator.of(context).pop();
                    }),
                    child: Icon(Icons.close)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: new Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 500,
                // height: 500,
                child: Column(
                  children: [
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Arrange By',
                    //       style: TextStyle(
                    //           fontSize: 12, fontWeight: FontWeight.bold),
                    //     ),
                    //     Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Row(
                    //             children: [
                    //               GestureDetector(
                    //
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color: lowhighpricecolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: Text(
                    //                       "Low-High Price",
                    //                       style: TextStyle(
                    //                           fontSize: 12, color: lowhighpricecolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 onTap: (){
                    //                   if(lowhighpricecolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       lowhighpricecolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       lowhighpricecolor = Colors.red;
                    //                       lowhighpricecolorfilter = true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //               ),
                    //               SizedBox(
                    //                 width: 15,
                    //               ),
                    //               GestureDetector(
                    //                 onTap: (){
                    //                   if(highlowpricecolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       highlowpricecolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       highlowpricecolor = Colors.red;
                    //                       highlowpricecolorfilter = true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color : highlowpricecolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: Text(
                    //                       "High-Low Price",
                    //                       style: TextStyle(
                    //                           fontSize: 12, color: highlowpricecolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Row(
                    //             children: [
                    //               GestureDetector(
                    //                 onTap: (){
                    //                   if(sqftcolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       sqftcolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       sqftcolor = Colors.red;
                    //                       sqftcolorfilter =true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color: sqftcolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(4.0),
                    //                     child: Text(
                    //                       "Sqft",
                    //                       style: TextStyle(
                    //                           fontSize: 14, color: sqftcolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 15,
                    //               ),
                    //               GestureDetector(
                    //                 onTap: (){
                    //                   if(bathcolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       bathcolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       bathcolor = Colors.red;
                    //                       bathcolorfilter = true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color: bathcolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: Text(
                    //                       "Bath",
                    //                       style: TextStyle(
                    //                           fontSize: 12, color: bathcolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 15,
                    //               ),
                    //               GestureDetector(
                    //                 onTap: (){
                    //                   if(bedcolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       bedcolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       bedcolor = Colors.red;
                    //                       bedcolorfilter = true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color:bedcolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: Text(
                    //                       "Bed",
                    //                       style: TextStyle(
                    //                           fontSize: 12, color: bedcolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 15,
                    //               ),
                    //               GestureDetector(
                    //                 onTap: (){
                    //                   if(yearscolor == Colors.red){
                    //                     setState(() {
                    //
                    //                       yearscolor = Colors.grey;
                    //
                    //                     });
                    //
                    //                   }else{
                    //                     setState(() {
                    //
                    //                       yearscolor = Colors.red;
                    //                       yearscolorfilter = true;
                    //                     });
                    //
                    //                   }
                    //
                    //                 },
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(color: yearscolor),
                    //                     // color: white,
                    //                     borderRadius: BorderRadius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: Text(
                    //                       "Years",
                    //                       style: TextStyle(
                    //                           fontSize: 12, color: yearscolor),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: siglefamilycolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Single Family",
                                          style: TextStyle(
                                              fontSize: 14, color: siglefamilycolor),
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      if(siglefamilycolor == Colors.red){
                                        setState(() {

                                          siglefamilycolor = Colors.grey;
                                          siglefamilycolorfilter = false;
                                        });

                                      }else{
                                        setState(() {
                                          siglefamilycolor = Colors.red;
                                          siglefamilycolorfilter = true;
                                        });

                                      }

                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(multifamilycolor == Colors.red){
                                        setState(() {

                                          multifamilycolor = Colors.grey;
                                          multifamilycolorfilter = false;
                                        });
                                      }else{
                                        setState(() {

                                          multifamilycolor = Colors.red;
                                          multifamilycolorfilter = true;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color:multifamilycolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          "Multi Family",
                                          style: TextStyle(
                                              fontSize: 12, color: multifamilycolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      if(mobilecolor == Colors.red){
                                        setState(() {
                                          mobilecolor = Colors.grey;
                                          mobilecolorfilter = false;
                                        });
                                      }else{
                                        setState(() {
                                          mobilecolor = Colors.red;
                                          mobilecolorfilter = true;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: mobilecolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          "Mobile",
                                          style: TextStyle(
                                              fontSize: 12, color: mobilecolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(landcolor == Colors.red){
                                        setState(() {

                                          landcolor = Colors.grey;
                                          landcolorfilter = false;
                                        });

                                      }else{
                                        setState(() {

                                          landcolor = Colors.red;
                                          landcolorfilter = true;

                                        });

                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: landcolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          "Land",
                                          style: TextStyle(
                                              fontSize: 12, color: landcolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(otherscolor == Colors.red){
                                        setState(() {

                                          otherscolor = Colors.grey;
                                          otherscolorfilter = false;
                                        });

                                      }else{
                                        setState(() {

                                          otherscolor = Colors.red;
                                          otherscolorfilter = true;
                                        });

                                      }

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: otherscolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          "Others",
                                          style: TextStyle(
                                              fontSize: 12, color: otherscolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(Condocolor == Colors.red){
                                        setState(() {

                                          Condocolor = Colors.grey;
                                          Condocolorfilter = false;
                                        });

                                      }else{
                                        setState(() {

                                          Condocolor = Colors.red;
                                          Condocolorfilter = true;
                                        });

                                      }

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Condocolor),
                                        // color: white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          "Condo",
                                          style: TextStyle(
                                              fontSize: 12, color: Condocolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beds',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        NumberInputPrefabbed.roundedButtons(
                          incIcon: Icons.expand_less,
                          decIcon: Icons.expand_more,
                          scaleWidth: 0.50,
                          scaleHeight: 0.50,
                          incIconSize: 35,
                          decIconSize: 35,
                          controller: beds,
                          incDecBgColor: Colors.amber,
                          buttonArrangement: ButtonArrangement.incRightDecLeft,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baths',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        NumberInputPrefabbed.roundedButtons(
                          incIcon: Icons.expand_less,
                          decIcon: Icons.expand_more,
                          scaleWidth: 0.50,
                          scaleHeight: 0.50,
                          controller: baths,
                          incDecBgColor: Colors.amber,
                          decIconSize: 35,
                          incIconSize: 35,
                          buttonArrangement: ButtonArrangement.incRightDecLeft,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: pricemin,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: secondarycolor,

                            hintText: "Min",
                            // labelText: 'password',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(14)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: secondarycolor),
                                borderRadius: BorderRadius.circular(14)),


                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(

                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: pricemax,
                            decoration: InputDecoration(
                              focusColor: secondarycolor,
                              hintText: "Max",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondarycolor),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: agemin,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: secondarycolor,

                            hintText: "Min",
                            // labelText: 'password',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey[300]),
                                borderRadius: BorderRadius.circular(14)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: secondarycolor),
                                borderRadius: BorderRadius.circular(14)),


                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: agemax,
                            decoration: InputDecoration(
                              focusColor: secondarycolor,
                              hintText: "Max",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(14)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondarycolor),
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sqft',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: sqftmin,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusColor: secondarycolor,

                                hintText: "Min",
                                // labelText: 'password',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: secondarycolor),
                                    borderRadius: BorderRadius.circular(14)),


                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(

                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: sqftmax,
                                decoration: InputDecoration(
                                  focusColor: secondarycolor,
                                  hintText: "Max",
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 5),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(14)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: secondarycolor),
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plot Size',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: plotsizemin,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusColor: secondarycolor,

                                hintText: "Min",
                                // labelText: 'password',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(14)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: secondarycolor),
                                    borderRadius: BorderRadius.circular(14)),


                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(

                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: plotsizemax,
                                decoration: InputDecoration(
                                  focusColor: secondarycolor,
                                  hintText: "Max",
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 5),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(14)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: secondarycolor),
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Other Listings',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              if(newconstructioncolor == Colors.red){
                                                setState(() {

                                                  newconstructioncolor = Colors.grey;
                                                  newconstructioncolorfilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  newconstructioncolor = Colors.red;
                                                  newconstructioncolorfilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: newconstructioncolor),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "New Construction",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: newconstructioncolor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              if(foreclosure == Colors.red){
                                                setState(() {

                                                  foreclosure = Colors.grey;
                                                  foreclosurefilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  foreclosure = Colors.red;
                                                  foreclosurefilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: foreclosure),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Foreclosure",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: foreclosure),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Other Amenities',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: pool),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Pool",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: pool),
                                                ),
                                              ),
                                            ),
                                            onTap: (){
                                              if(pool == Colors.red){
                                                setState(() {

                                                  pool = Colors.grey;
                                                  poolfilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  pool = Colors.red;
                                                  poolfilter = true;
                                                });

                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              if(waterfront == Colors.red){
                                                setState(() {

                                                  waterfront = Colors.grey;
                                                  waterfrontfilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  waterfront = Colors.red;
                                                  waterfrontfilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: waterfront),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Waterfront",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: waterfront),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              if(fireplace == Colors.red){
                                                setState(() {

                                                  fireplace = Colors.grey;
                                                  fireplacefilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  fireplace = Colors.red;
                                                  fireplacefilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:fireplace),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Fire Place",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: fireplace),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              if(energyefficient == Colors.red){
                                                setState(() {

                                                  energyefficient = Colors.grey;
                                                 energyefficientfilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  energyefficient = Colors.red;
                                                  energyefficientfilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: energyefficient),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Energy Efficient",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: energyefficient),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              if(washerdryer == Colors.red){
                                                setState(() {

                                                  washerdryer = Colors.grey;
                                                  washerdryerfilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  washerdryer = Colors.red;
                                                  washerdryerfilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:washerdryer),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Washer Dryer",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: washerdryer),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              if(garage == Colors.red){
                                                setState(() {

                                                  garage = Colors.grey;
                                                  garagefilter = false;
                                                });

                                              }else{
                                                setState(() {

                                                  garage = Colors.red;
                                                  garagefilter = true;
                                                });

                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: garage),
                                                // color: white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  "Garage",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: garage),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pending',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: yes),
                                            // color: white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: yes),
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          if(yes == Colors.red){
                                            setState(() {

                                              yes = Colors.grey;
                                              yesfilter = false;
                                            });

                                          }else{
                                            setState(() {

                                              yes = Colors.red;
                                              yesfilter = true;
                                            });

                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          if(No == Colors.red){
                                            setState(() {

                                              No = Colors.grey;
                                              Nofilter = false;
                                            });

                                          }else{
                                            setState(() {

                                              No = Colors.red;
                                              Nofilter = true;
                                            });

                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: No),
                                            // color: white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: No),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            storage.setItem('highlowpricecolorfilter', false);
                                            storage.setItem('sqftcolorfilter', false);
                                            storage.setItem('bathcolorfilter', false);
                                            storage.setItem('bedcolorfilter', false);
                                            storage.setItem('yearscolorfilter', false);
                                            storage.setItem('siglefamilycolorfilter', false);
                                            storage.setItem('multifamilycolorfilter', false);
                                            storage.setItem('mobilecolorfilter', false);
                                            storage.setItem('landcolorfilter', false);
                                            storage.setItem('otherscolorfilter', false);
                                            storage.setItem('Condocolorfilter', false);
                                            storage.setItem('newconstructioncolorfilter', false);
                                            storage.setItem('foreclosurefilter', false);
                                            storage.setItem('poolfilter', false);
                                            storage.setItem('waterfrontfilter', false);
                                            storage.setItem('fireplacefilter', false);
                                            storage.setItem('energyefficientfilter', false);
                                            storage.setItem('washerdryerfilter', false);
                                            storage.setItem('garagefilter', false);
                                            storage.setItem('pending', false);
                                            storage.setItem('beds', beds.text);
                                            storage.setItem('baths', baths.text);
                                            storage.setItem('pricemin', "");
                                            storage.setItem('pricemax', "");
                                            storage.setItem('agemin', "");
                                            storage.setItem('agemax', "");
                                            storage.setItem('sqftmin', "");
                                            storage.setItem('sqftmax', "");
                                            storage.setItem('plotmin', "");
                                            storage.setItem('plotmax', "");

                                          },
                                          child: Container(
                                            height: 50,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(child: Text("Reset")),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            storage.setItem('highlowpricecolorfilter', highlowpricecolorfilter);
                                            storage.setItem('sqftcolorfilter', sqftcolorfilter);
                                            storage.setItem('bathcolorfilter', bathcolorfilter);
                                            storage.setItem('bedcolorfilter', bedcolorfilter);
                                            storage.setItem('yearscolorfilter', yearscolorfilter);
                                            storage.setItem('siglefamilycolorfilter', siglefamilycolorfilter);
                                            storage.setItem('multifamilycolorfilter', multifamilycolorfilter);
                                            storage.setItem('mobilecolorfilter', mobilecolorfilter);
                                            storage.setItem('landcolorfilter', landcolorfilter);
                                            storage.setItem('otherscolorfilter', otherscolorfilter);
                                            storage.setItem('Condocolorfilter', Condocolorfilter);
                                            storage.setItem('newconstructioncolorfilter', newconstructioncolorfilter);
                                            storage.setItem('foreclosurefilter', foreclosurefilter);
                                            storage.setItem('poolfilter', poolfilter);
                                            storage.setItem('waterfrontfilter', waterfrontfilter);
                                            storage.setItem('fireplacefilter', fireplacefilter);
                                            storage.setItem('energyefficientfilter', energyefficientfilter);
                                            storage.setItem('washerdryerfilter', washerdryerfilter);
                                            storage.setItem('garagefilter', garagefilter);
                                            storage.setItem('yesfilter', yesfilter);
                                            storage.setItem('Nofilter', Nofilter);
                                            storage.setItem('beds', beds.text);
                                            storage.setItem('baths', baths.text);
                                            storage.setItem('pricemin', pricemin.text);
                                            storage.setItem('pricemax', pricemax.text);
                                            storage.setItem('agemin', agemin.text);
                                            storage.setItem('agemax', agemax.text);
                                            storage.setItem('sqftmin', sqftmin.text);
                                            storage.setItem('sqftmax', sqftmax.text);
                                            storage.setItem('plotmin', plotsizemin.text);
                                            storage.setItem('plotmax', plotsizemax.text);
                                            storage.setItem('pending', true);
                                           Navigator.pop(context);


                                          },
                                          child: Container(
                                            height: 50,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: shadowColor,
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                color: secondarycolor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(
                                              "Apply",
                                              style: TextStyle(color: white),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // child: Text("Hello"),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
