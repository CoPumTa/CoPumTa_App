import 'package:client/style.dart';
import 'package:client/widgets/widgetWithTopLeftHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: mainColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
          child:
              // WidgetWithTopLeftHeading(
              // heading: "Start Flow",
              // widget:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("00:00:00",
                style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            SizedBox(width: 16.0),
            Container(
                width: 44,
                height: 44,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: darkColor,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Icon(CupertinoIcons.play,
                        size: 24, color: Colors.white)))
          ]),
          // )
        ));
  }
}
