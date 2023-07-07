import 'package:client/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: subColor,
        elevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Fluttertoast.showToast(
            msg: "미구현 기능입니다.",
          ),
        ),
        title: Text(DateFormat("M.d").format(DateTime.now())),
        centerTitle: true,
      ),
    );
  }
}
