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
    final request = Uri.parse("${BASE_URL}challenge/participating/");
    try {
      final response = await http.post(request,
        headers: {"Content-Type": "application/json", "set-cookie": session},);
      if (response.statusCode == 401 || response.headers["set-cookie"] == null) {
        debugPrint("failed to get Challenges");
      } else {
        // LoginModel.cookie = response.headers["set-cookie"]!;
        // Provider.of<AuthProvider>(context, listen: false).login();
        final data = json.decode(response.body);
        debugPrint("response body is ${data.toString()}");
      }
    } catch (error) {
      debugPrint("/challenge/participating 에러: $error");
    }
  }
}

