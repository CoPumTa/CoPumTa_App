import 'dart:math';

import 'package:client/data/constant.dart';
import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Timer extends StatefulWidget {
  final int accumulatedTime;

  const Timer({super.key, required this.accumulatedTime});
  @override
  TimerState createState() => TimerState();
}

class TimerState extends StateMVC<Timer> {
  final currentStopWatch = StopWatchTimer();
  final todayStopWatch = StopWatchTimer();
  int _previousElapsedTime = 0;
  int quoteIdx = Random().nextInt(QUOTES.length);

  @override
  void initState() {
    todayStopWatch.setPresetTime(mSec: widget.accumulatedTime, add: false);
    todayStopWatch.onStartTimer();
    currentStopWatch.onStartTimer();
    super.initState();
  }

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
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: darkColor,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const SizedBox(height: 72),
                  const Text(
                    "Current Flow Time",
                    style: KorTextStyles.lightMain,
                  ),
                  StreamBuilder<int>(
                      stream: currentStopWatch.rawTime,
                      initialData: currentStopWatch.rawTime.value,
                      builder: (context, snap) {
                        final value = snap.data!;
                        final displayTime = StopWatchTimer.getDisplayTime(value,
                            milliSecond: false);
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            displayTime,
                            style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w700,
                                color: lightColor,
                                fontFamily: 'D2Coding'),
                          ),
                        );
                      }),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Today",
                        style: KorTextStyles.lightTertiary,
                      ),
                      const SizedBox(width: 8.0),
                      StreamBuilder<int>(
                          stream: todayStopWatch.rawTime,
                          initialData: todayStopWatch.rawTime.value,
                          builder: (context, snap) {
                            final value = snap.data!;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                milliSecond: false);
                            _previousElapsedTime = value;
                            return Text(
                              displayTime,
                              style: KorTextStyles.lightTertiary,
                            );
                          })
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Text(QUOTES[quoteIdx],
                                style: KorTextStyles.Hint,
                                textAlign: TextAlign.center),
                          ])),
                  const SizedBox(
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
                ]))));
  }
}
