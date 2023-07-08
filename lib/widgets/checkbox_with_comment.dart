import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';

class CheckboxWithComment extends StatelessWidget {
  final dynamic checkboxController;
  final String comment;
  const CheckboxWithComment(
      {super.key, required this.checkboxController, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoCheckbox(
            value: checkboxController.checked,
            onChanged: (checked) {
              checkboxController.setChecked(checked);
            }),
        Expanded(
          child: Wrap(
              spacing: 0,
              runSpacing: 0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Text(
                    'By continuing you accept our Privacy Policy and Term of Use.',
                    style: TextStyles.Comment),
              ]),
        ),
      ],
    );
  }
}
