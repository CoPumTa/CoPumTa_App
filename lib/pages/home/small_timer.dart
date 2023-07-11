import 'package:client/pages/timer/timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/widgetWithTopLeftHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SmallTimer extends StatefulWidget {
  @override
  State<SmallTimer> createState() => _SmallTimerState();
}

class _SmallTimerState extends State<SmallTimer> {
  final StopWatchTimer stopWatch = StopWatchTimer();

  @override
  void dispose() async {
    super.dispose();
    await stopWatch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: mainColor,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  const Text("Today\'s", style: TextStyles.Hint)
                ],
              ),
              // WidgetWithTopLeftHeading(
              // heading: "Start Flow",
              // widget:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                StreamBuilder<int>(
                    stream: stopWatch.rawTime,
                    initialData: stopWatch.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data!;
                      final displayTime = StopWatchTimer.getDisplayTime(value,
                          milliSecond: false);
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime,
                          style: TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      );
                    }),
                SizedBox(width: 16.0),
                Container(
                    width: 44,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Timer(
                                        todayStopWatch: stopWatch,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkColor,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: const Icon(CupertinoIcons.play,
                            size: 24, color: Colors.white)))
              ]),
              // )
            ])));
  }
}
