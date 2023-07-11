import 'package:client/pages/timer/timer.dart';
import 'package:client/style.dart';
import 'package:client/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmallTimer extends StatefulWidget {
  @override
  State<SmallTimer> createState() => _SmallTimerState();
}

class _SmallTimerState extends State<SmallTimer> {
  int _previousElapsedTime = 0;

  @override
  void initState() {
    super.initState();
    _loadElapsedTime();
  }

  void _loadElapsedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    int prefValue = prefs.getInt('elapsedTime') ?? 0;

    debugPrint('loaded _previousElapsedTime: $prefValue');
    setState(() {
      _previousElapsedTime = prefValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Timer
    return Container(
        height: 150,
        color: mainColor,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  Text("Today's Flow Time", style: TextStyles.Hint)
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    formatMilliseconds(_previousElapsedTime),
                    style: const TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16.0),
                SizedBox(
                    width: 44,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () async {
                          dynamic result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Timer(
                                      accumulatedTime:
                                          _previousElapsedTime))).then((value) {
                            setState(() {
                              _previousElapsedTime = value ?? 0;
                            });
                          });
                          debugPrint("result is... ${result}");
                          // await _loadElapsedTime();
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
