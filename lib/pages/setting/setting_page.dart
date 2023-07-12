import 'dart:math';
import 'package:client/data/constant.dart';
import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final int quoteIdx = Random().nextInt(QUOTES.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 126,
        elevation: 0,
        backgroundColor: mainColor,
        title: Container(
          height: 126,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 10),),
              Text(
                "300",
                style: TextStyle(fontSize: 50,),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                      child: Text("pts"),),
                    Expanded(
                      child: SizedBox(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              children: [
                                Text(
                                  QUOTES[quoteIdx],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.right
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
      body: Container(
        color: subColor,
        height: double.infinity,
      ),
    );
  }
}
