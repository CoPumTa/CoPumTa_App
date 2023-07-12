import 'package:client/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonDatePicker extends StatefulWidget {
  final String prefix;
  DateTime date;
  final IconData prefixIcon;
  final TextEditingController controller;
  bool? hideInput = false;

  CommonDatePicker(
      {super.key,
      required this.prefix,
      required this.date,
      required this.prefixIcon,
      required this.controller,
      this.hideInput});

  @override
  State<CommonDatePicker> createState() => _CommonDatePickerState();
}

class _CommonDatePickerState extends State<CommonDatePicker> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
      decoration: kDefaultRoundedBorderDecoration,
      child: InkWell( 
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: widget.date,
            firstDate: DateTime(2000),
            lastDate: DateTime(2024),
          );
          if (selectedDate != null) {
            setState(() {
              widget.date = selectedDate;
              widget.controller.text = dateFormat.format(widget.date).toString();
              debugPrint("submiited ${widget.controller.text}");
            });
          }
        },
        child: Row(
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: Icon(widget.prefixIcon, color: subColor, size: 18)),
            Text(
              "${widget.prefix}${widget.controller.text}",
              style: TextStyles.Main,
              //TextStyle(backgroundColor: lightColor),
            )
          ],
        )
      )
    );
  }
}