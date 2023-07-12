import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:client/utils.dart';
import 'package:client/style.dart';
import 'package:client/widgets/common_date_picker.dart';
import 'package:client/widgets/common_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class newChallengePage extends StatefulWidget {
  @override
  State<newChallengePage> createState() => _newChallengePageState();
}

class _newChallengePageState extends State<newChallengePage> {
  final double gap = 8.0;
  final _dateFormat = DateFormat("yyyy-MM-dd");
  List<MultiSelectItem<UserInfo>> _items = [];
  List<dynamic> _selectedItems = [];
  final _prefs = SharedPreferences.getInstance();
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _startDayController = TextEditingController();
  final _endDayController = TextEditingController();
  final _pointController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _prefs.then((prefs) {
      final session = prefs.getString("session") ?? "";
      getFriends(session).then((userInfos) {
        setState(() {
          _items.clear();
          _items.addAll(userInfos.map((userInfo) =>
            MultiSelectItem<UserInfo>(userInfo, userInfo.userName)
          ).toList());
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: subColor,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Make Flow,", style: TextStyles.Secondary),
              Text("Make Challenge", style: TextStyles.Primary),
              SizedBox(height: gap * 2),
              CommonTextInput(
                hintText: "Title",
                prefixIcon: Icons.title,
                controller: _titleController),
              SizedBox(height: gap),
              CommonTextInput(
                hintText: "SubTitle",
                prefixIcon: Icons.subtitles,
                controller: _subTitleController),
              SizedBox(height: gap),
              CommonDatePicker(
                prefix: "Starts from ",
                date: DateTime.now(),
                prefixIcon: Icons.last_page,
                controller: _startDayController),
              SizedBox(height: gap),
              CommonDatePicker(
                prefix: "Ends at ",
                date: DateTime.now(),
                prefixIcon: Icons.last_page,
                controller: _endDayController),
              SizedBox(height: gap),
              CommonTextInput(
                hintText: "Point from each challengers",
                prefixIcon: Icons.money,
                controller: _pointController),
              SizedBox(height: gap),
              MultiSelectBottomSheetField(
                items: _items,
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _selectedItems = values;
                },
                decoration: kDefaultRoundedBorderDecoration,
                selectedColor: subColor,
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (value) {
                    setState(() {
                      _selectedItems.remove(value);
                    });
                  },
                ),
              ),
              SizedBox(height: gap),
              CupertinoButton(
                  color: mainColor,
                  child: Text('Submit'),
                  onPressed: () {
                    newChallengeRequest();
                  }),
              SizedBox(height: gap * 2),
            ],
          )
        )
      )
    );
  }

  void newChallengeRequest() async {
    final prefs = await _prefs;
    final session = prefs.getString("session") ?? "";
    final request = Uri.parse("${BASE_URL}challenge/newChallenge");
    debugPrint(_startDayController.text);
    debugPrint(_endDayController.text);
    final requestBody = json.encode({
            "title": _titleController.text,
            "subTitle": _subTitleController.text,
            "startDay": _startDayController.text,
            "endDay": _endDayController.text,
            "prize": int.parse(_pointController.text) * _selectedItems.length,
            "participantsId": _selectedItems.map((e) => e.userId).toList()
          });
    debugPrint(requestBody);
    final response = await http.post(request,
          headers: {"Content-Type": "application/json", "Cookie": session},
          body: requestBody);
    
    
  }
}
