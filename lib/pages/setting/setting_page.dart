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
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: lightColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.storefront, size: 100,color: darkColor,),
                              Text("Point Store", style: TextStyle(color: darkColor, fontSize: 20),),
                            ],
                          )
                        ),
                      )
                    ),
                    Flexible(
                      child: Container(
                        color: subColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.settings, size: 100,color: darkColor,),
                              Text("Settings", style: TextStyle(color: darkColor, fontSize: 20),),
                            ],
                          )
                        ),
                      )
                    ),
                  ]
                ),
              )
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: mainColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.help, size: 100,color: lightColor,),
                              Text("Help", style: TextStyle(color: lightColor, fontSize: 20),),
                            ],
                          )
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: darkColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.coffee, size: 100,color: lightColor,),
                              Text("Buy me a coffee!", style: TextStyle(color: lightColor, fontSize: 20),),
                            ],
                          )
                        ),
                      ),
                    ),
                  ]
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
