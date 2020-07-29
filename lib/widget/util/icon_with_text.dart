import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/widgets.dart';

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;
  final double size;

  const IconWithText({
    Key key,
    this.iconData,
    this.color,
    this.text,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          size: size,
          color: color,
        ),
        AppWidgets.getText(
          title: text,
          left: 8,
          fontSize: Dimens.TEXT_SIZE_11,
        ),
      ],
    );
  }
}
