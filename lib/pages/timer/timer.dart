import 'package:client/data/models/home_model.dart';
import 'package:client/data/providers/timer_provider.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'dart:async';

class Timer extends StatefulWidget {
  final int accumulatedTime;

  const Timer({super.key, required this.accumulatedTime});
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends StateMVC<Timer> {
  final currentStopWatch = StopWatchTimer();
  final todayStopWatch = StopWatchTimer();
  int _previousElapsedTime = 0;

  @override
  void initState() {
    todayStopWatch.setPresetTime(mSec: widget.accumulatedTime, add: false);
    todayStopWatch.onStartTimer();
    currentStopWatch.onStartTimer();
    super.initState();
  }

  // @override
  // void deactivate() {
  //   super.deactivate();
  // }

  @override
  void dispose() {
    disposeTimers();
    super.dispose();
  }

  // void async

  void disposeTimers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("저장하기 직전의 _previousElapsedTime: $_previousElapsedTime");
    await prefs.setInt('elapsedTime', _previousElapsedTime);

    await todayStopWatch.dispose();
    await currentStopWatch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 72),
          Text(
            "Current Flow Time",
            style: TextStyles.lightMain,
          ),
          StreamBuilder<int>(
              stream: currentStopWatch.rawTime,
              initialData: currentStopWatch.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, milliSecond: false);
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    displayTime,
                    style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.w700,
                        color: lightColor),
                  ),
                );
              }),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today",
                style: TextStyles.lightTertiary,
              ),
              SizedBox(width: 8.0),
              StreamBuilder<int>(
                  stream: todayStopWatch.rawTime,
                  initialData: todayStopWatch.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data!;
                    final displayTime = StopWatchTimer.getDisplayTime(value,
                        milliSecond: false);
                    _previousElapsedTime = value;
                    return Text(
                      displayTime,
                      style: TextStyles.lightTertiary,
                    );
                  })
            ],
          ),
          SizedBox(height: 4.0),
          Text(
            "It\'s not a bug; it\'s an undocumented feature.",
            style: TextStyles.Hint,
          ),
          SizedBox(
            height: 152,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 56,
                    height: 56,
                    child: ElevatedButton(
                        onPressed: () {
                          currentStopWatch.onStopTimer();
                          todayStopWatch.onStopTimer();
                          Navigator.pop(context, _previousElapsedTime);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shadowColor: Colors.transparent,
                            shape: CircleBorder()),
                        child: const Icon(CupertinoIcons.pause_fill,
                            size: 32, color: darkColor)))
              ],
            ),
          ),
        ])));
  }
}
