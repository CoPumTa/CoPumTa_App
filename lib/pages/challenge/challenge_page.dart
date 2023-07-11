import 'package:client/data/providers/auth_provider.dart';
import 'package:client/data/models/challenge_list_item_model.dart';
import 'package:client/pages/challenge/challenge_page_controller.dart';
import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl_browser.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChallengePage extends StatefulWidget {

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _challengePageController = ChallengePageController();
  final _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    _prefs.then((prefs) {
      final String session = prefs.getString("session") ?? "";
      _challengePageController.getChallengeList(session)
        .then((value) => setState(() {}));
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        itemCount: _challengePageController.challengeList.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(index);
        },
      )
    );
  }

  Card makeCard(index) {
    return Card(
      color: lightColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: SizedBox(
        height: 120,
        child: makeListTile(index)
      ),
    );
  }
  Row makeListTile(index) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 8, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        _challengePageController.challengeList[index].title,
                        style: TextStyle(fontSize: 40),
                      ),
                      Spacer(),
                      Text(
                        "Challenge and get\n ${_challengePageController.challengeList[index].prize} points!",
                        textAlign: TextAlign.right,
                      )
                    ],
                  )
                ),
                Text(
                  _challengePageController.challengeList[index].startDay.toString() ?? "no subTitle",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 10, 15),
            child: Container(
              height: double.infinity,
              width: 90,
              // decoration: const BoxDecoration(
              //   border: Border(
              //   left: BorderSide(width: 2.0, color: darkColor),
              //   right: BorderSide(width: 2.0, color: darkColor))),
              child: progressGraph(50)
            ),
          ),
        )
      ],
    );
  }

  SfRadialGauge progressGraph(value) {
      return SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            axisLineStyle: AxisLineStyle(
              thickness: 1,
              color: mainColor,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: 50,
                width: 0.15,
                pointerOffset: 0.1,
                color: lightColor,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                verticalAlignment: GaugeAlignment.center,
                positionFactor: 0.5,
                angle: 90,
                widget: Text(
                  50.toStringAsFixed(0) + '%',
                  style: TextStyle(fontSize: 11),
                )
              )
            ]
          )
        ],
      );
    }
}
