import 'package:flutter/material.dart';
import 'package:litpoodle/components/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Setparameter extends StatelessWidget {
  const Setparameter(BuildContext context, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _value = 2600.0;
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
                  'Set Parameters',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mortgage Interest rate (%)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SfSlider(
                          activeColor: secondarycolor,
                          min: 0.0,
                          max: 15000.0,
                          value: _value,
                          interval: 20,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            _value = value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Project (\$)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SfSlider(
                          activeColor: secondarycolor,
                          min: 0.0,
                          max: 15000.0,
                          value: _value,
                          interval: 20,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            _value = value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Closing cost (%)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SfSlider(
                          activeColor: secondarycolor,
                          min: 0.0,
                          max: 15000.0,
                          value: _value,
                          interval: 20,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            _value = value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Annual Average rent increase (%)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SfSlider(
                          activeColor: secondarycolor,
                          min: 0.0,
                          max: 15000.0,
                          value: _value,
                          interval: 20,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            _value = value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anual property (%)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SfSlider(
                          activeColor: secondarycolor,
                          min: 0.0,
                          max: 15000.0,
                          value: _value,
                          interval: 20,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            _value = value;
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Annual Property Tax (%)',
                              style: TextStyle(fontSize: 12),
                            ),
                            SfSlider(
                              activeColor: secondarycolor,
                              min: 0.0,
                              max: 15000.0,
                              value: _value,
                              interval: 20,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                _value = value;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Monthly rent (\$)',
                              style: TextStyle(fontSize: 12),
                            ),
                            SfSlider(
                              activeColor: secondarycolor,
                              min: 0.0,
                              max: 15000.0,
                              value: _value,
                              interval: 20,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                _value = value;
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Downpayment (%)',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SfSlider(
                                  activeColor: secondarycolor,
                                  min: 0.0,
                                  max: 15000.0,
                                  value: _value,
                                  interval: 20,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    _value = value;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Annual average price increase (%)',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SfSlider(
                                  activeColor: secondarycolor,
                                  min: 0.0,
                                  max: 15000.0,
                                  value: _value,
                                  interval: 20,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    _value = value;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Annual Vacancy rate (%)',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SfSlider(
                                  activeColor: secondarycolor,
                                  min: 0.0,
                                  max: 15000.0,
                                  value: _value,
                                  interval: 20,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    _value = value;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Annual Maintenance (%)',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SfSlider(
                                  activeColor: secondarycolor,
                                  min: 0.0,
                                  max: 15000.0,
                                  value: _value,
                                  interval: 20,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    _value = value;
                                  },
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PM Commision (%)',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SfSlider(
                                      activeColor: secondarycolor,
                                      min: 0.0,
                                      max: 15000.0,
                                      value: _value,
                                      interval: 20,
                                      showTicks: false,
                                      showLabels: false,
                                      enableTooltip: true,
                                      minorTicksPerInterval: 1,
                                      onChanged: (dynamic value) {
                                        _value = value;
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Text(
                                        "Compare this home to other investment opportunities,See below,your investment today could be worth",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Growth rate (%)',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SfSlider(
                                          activeColor: secondarycolor,
                                          min: 0.0,
                                          max: 15000.0,
                                          value: _value,
                                          interval: 20,
                                          showTicks: false,
                                          showLabels: false,
                                          enableTooltip: true,
                                          minorTicksPerInterval: 1,
                                          onChanged: (dynamic value) {
                                            _value = value;
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Growth rate (%)',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SfSlider(
                                          activeColor: secondarycolor,
                                          min: 0.0,
                                          max: 15000.0,
                                          value: _value,
                                          interval: 20,
                                          showTicks: false,
                                          showLabels: false,
                                          enableTooltip: true,
                                          minorTicksPerInterval: 1,
                                          onChanged: (dynamic value) {
                                            _value = value;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Container(
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child:
                                                  Center(child: Text("Reset")),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                "Submit",
                                                style: TextStyle(color: white),
                                              )),
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
                  ],
                ),

                // child: Text("Hello"),
              )
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
