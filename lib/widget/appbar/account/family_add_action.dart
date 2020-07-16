import 'package:AibolitFlutter/utils/borders.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class FamilyAddAction extends StatelessWidget {
  final String _title;

  const FamilyAddAction(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: Borders.primaryGreyBorderSide,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          _title,
          style: Themes.getTextStyle(
          ),
        ),
      ),
    );
  }
}
