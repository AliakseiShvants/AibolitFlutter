import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSearchItem extends StatelessWidget {
  final String _title;
  final String _assetPath;

  HomeSearchItem(
    this._title,
    this._assetPath,
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: AppColors.grey300,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(_assetPath),
              AppWidgets.getText(
                title: _title,
                fontSize: Dimens.TEXT_SIZE_13,
                fontWeight: FontWeight.bold,
                top: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
