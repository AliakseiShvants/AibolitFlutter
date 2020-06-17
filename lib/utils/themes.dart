import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'dimens.dart';
import 'strings.dart';

class Themes {
  static final SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: AppColors.PRIMARY_COLOR);

  static final ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      textTheme: appBarTextTheme,
    ),
    fontFamily: Strings.RALEWAY,
    primaryColor: AppColors.PRIMARY_COLOR,
    textTheme: mainTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final TextTheme mainTextTheme = ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: Dimens.TEXT_SIZE_L,
          color: Colors.white,
        ),
      );

  static final TextTheme appBarTextTheme = ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: Dimens.TEXT_SIZE_APP_BAR,
          color: Colors.white,
        ),
      );
}
