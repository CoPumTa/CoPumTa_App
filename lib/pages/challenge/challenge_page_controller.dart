import 'dart:convert';
import 'package:client/data/constant.dart';
import "package:client/data/models/challenge_list_item_model.dart";
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class ChallengePageController {
  late List<ChallengeListItemModel> challengeList;

  ChallengePageController() {
    challengeList = [];
  }

  Future<void> getChallengeList(String session) async {
    final request = Uri.parse("${BASE_URL}challenge/participating");
    try {
      final response = await http.get(request,
        headers: {"Content-Type": "application/json", "Cookie": session},);
      if (response.statusCode == 401) {
        debugPrint("failed to get Challenges");
      } else {
        // LoginModel.cookie = response.headers["set-cookie"]!;
        // Provider.of<AuthProvider>(context, listen: false).login();
        final List<dynamic> data = json.decode(json.decode(response.body));
        data.forEach((c) {
          challengeList.add(ChallengeListItemModel(
            c["challengeId"],
            c["title"],
            c["subTitle"],
            DateTime.parse(c["startDay"]),
            DateTime.parse(c["endDay"]),
            c["prize"],
            c["userId"]));
        });
        debugPrint("response body is ${data.toString()}");
      }
    } catch (error) {
      debugPrint("/challenge/participating 에러: $error");
    }
  }
}

