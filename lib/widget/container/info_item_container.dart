import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoItemContainer extends StatelessWidget {
  final String logo;
  final String text;
  final String hint;
  final Color textColor;
  final Color color;
  final double fontSize;
  final bool isCapitalize;
  final FontWeight fontWeight;
  final bool isTrailing;
  final Function callback;

  InfoItemContainer(this.text,
      {this.color = Colors.white,
      this.logo,
      this.hint,
      this.textColor = Colors.black,
      this.fontSize = Dimens.TEXT_SIZE_16,
      this.isCapitalize = false,
      this.fontWeight = FontWeight.normal,
      this.isTrailing = true,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border(
            top: BorderSide(color: AppColors.grey400),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              if (logo != null)
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Image.asset(logo),
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
                  child: Text(
                    isCapitalize ? text.toUpperCase() : text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ),
              if (isTrailing)
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.grey400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
