import 'package:client/style.dart';
import 'package:client/widgets/gap.dart';
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
      const Gap(height: 8.0),
      widget
    ]);
  }
}
