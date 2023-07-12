import 'package:client/pages/new_challenge/new_challenge_page.dart';
import 'package:client/pages/challenge/challenge_page_controller.dart';
import 'package:client/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChallengePage extends StatefulWidget {
  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _challengePageController = ChallengePageController();
  final _prefs = SharedPreferences.getInstance();
  final _dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    // TODO: implement initState
    _prefs.then((prefs) {
      final String session = prefs.getString("session") ?? "";
      _challengePageController
          .getChallengeList(session)
          .then((value) => setState(() {}));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        itemCount: _challengePageController.challengeList.length+1,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(index);
        },
      )
    );
  }

  Card makeCard(index) {
    if(index != _challengePageController.challengeList.length){
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
    } else {
      return Card(
        color: subColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: lightColor,
          radius: Radius.circular(20),
          strokeWidth: 3,
          dashPattern: [10, 6],
          child: GestureDetector(
            onTap:() async {
              debugPrint("tap detected");
              dynamic result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => newChallengePage(),
                )
              );
              debugPrint("return to ChallengeList");
            },
            child: const SizedBox(
              height: 110,
              child: Center(
                child: Icon(Icons.control_point, color: lightColor, size: 50)
              ),
            ),
          )
        ),
      );
    }
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
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  )
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Column(
                        children: [
                        Text(
                          "from ${_dateFormat.format(_challengePageController.challengeList[index].startDay)}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "to      ${_dateFormat.format(_challengePageController.challengeList[index].endDay)}",
                          style: TextStyle(fontSize: 10),
                        )],
                      ),
                      Spacer(),
                      Text(
                        "Challenge and get\n ${_challengePageController.challengeList[index].prize} points!",
                        textAlign: TextAlign.right,
                      )
                    ]
                  )
                ),
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
                child: progressGraph(50)),
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
                  ))
            ])
      ],
    );
  }
}
