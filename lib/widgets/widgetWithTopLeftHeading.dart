import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';

class WidgetWithTopLeftHeading extends StatelessWidget {
  final String heading;
  final Widget widget;

  const WidgetWithTopLeftHeading(
      {super.key, required this.heading, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(heading, style: TextStyles.MainAccent),
      const SizedBox(height: 10.0),
      widget
    ]);
  }
}
