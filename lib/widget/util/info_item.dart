import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoItem extends StatelessWidget {
  final Widget logo;
  final String title;
  final String hint;
  final Color textColor;
  final Color color;
  final double fontSize;
  final bool isCapitalize;
  final FontWeight fontWeight;
  final bool isTrailing;
  final Color trailingColor;
  final Function callback;
  final String url;
  final bool isBottomBorder;

  InfoItem({
    this.title,
    this.color = Colors.white,
    this.logo,
    this.hint,
    this.textColor = Colors.black,
    this.fontSize = Dimens.TEXT_SIZE_16,
    this.isCapitalize = false,
    this.fontWeight = FontWeight.normal,
    this.isTrailing = true,
    this.callback,
    this.url,
    this.trailingColor,
    this.isBottomBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = isBottomBorder
        ? Border(
            bottom: BorderSide(
              color: AppColors.grey400,
              width: .5,
            ),
          )
        : Border(
            top: BorderSide(
              color: AppColors.grey400,
              width: .5,
            ),
          );

    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: border,
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              if (logo != null)
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: logo,
                ),
              if (hint != null)
                Expanded(
                  flex: 4,
                  child: Text(
                    hint,
                    style: TextStyle(
                      fontSize: Dimens.TEXT_SIZE_12,
                      color: AppColors.grey400,
                    ),
                  ),
                ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: AppWidgets.getText(
                    title: title,
                    isUpperCase: isCapitalize,
                    fontColor: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
              if (isTrailing)
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: trailingColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
