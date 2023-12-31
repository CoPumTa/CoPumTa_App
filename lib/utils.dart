import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String strToday = formatter.format(now);
  return strToday;
}

int timeToMilliseconds(String time) {
  List<String> parts = time.split(':');

  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);

  int totalMilliseconds = hours * 3600000 + minutes * 60000 + seconds * 1000;

  return totalMilliseconds;
}

class FriendInfo {
  final int userId;
  final String userName;
  final String todaysTime;
  final bool isFlowing;

  FriendInfo(this.userId, this.userName, this.todaysTime, this.isFlowing);

  @override
  String toString() {
    // TODO: implement toString

    return "${userId}, ${userName}, ${todaysTime}, ${isFlowing}";
  }
}

Future<List<FriendInfo>> getFriends(String session) async {
  final request = Uri.parse("${BASE_URL}user/getFriends");
  final List<FriendInfo> ans = [];

  try {
    final response = await http.get(
      request,
      headers: {"Content-Type": "application/json", "Cookie": session},
    );
    if (response.statusCode == 401) {
      debugPrint("failed to get Challenges");
    } else {
      // LoginModel.cookie = response.headers["set-cookie"]!;
      // Provider.of<AuthProvider>(context, listen: false).login();
      final List<dynamic> data = json.decode(json.decode(response.body));
      debugPrint(data.toString());
      data.forEach((userData) {
        ans.add(FriendInfo(userData["userId"], userData["userName"],
            userData["todaysTime"], userData["isFlowing"]));
      });
      debugPrint("friends list looks");
      ans.forEach((e) => debugPrint(e.toString()));
      debugPrint("response body is ${data.toString()}");
    }
  } catch (error) {
    debugPrint("/challenge/participating 에러: $error");
  }

  return ans;
}
