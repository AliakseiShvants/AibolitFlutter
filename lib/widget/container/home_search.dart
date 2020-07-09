import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSearch extends StatelessWidget {
  final double _width;
  final String _title;
  final String _assetPath;

  HomeSearch(
    this._width,
    this._title,
    this._assetPath,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _width * 0.75,
      child: Container(
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _title,
                style: Themes.getTextStyle(
                  fontSize: Dimens.TEXT_SIZE_13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
