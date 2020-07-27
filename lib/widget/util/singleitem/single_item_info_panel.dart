import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleItemInfoPanel extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final String info;

  SingleItemInfoPanel({
    this.title,
    this.info,
    this.iconData,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          vertical: BorderSide(
            color: AppColors.grey400,
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.getText(
                    title: title,
                    fontColor: AppColors.primaryGrey,
                    isUpperCase: true,
                  ),
                  AppWidgets.getText(
                    title: info,
                    top: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
