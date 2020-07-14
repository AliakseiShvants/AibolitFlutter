import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/visitcard/visit_card_screen.dart';
import '../widget/home/home_screen.dart';
import '../widget/medcenters/medical_center_screen.dart';
import '../widget/pills/medicament_screen.dart';
import '../widget/settings/settings_screen.dart';
import 'app_colors.dart';
import 'data.dart';
import 'dimens.dart';

class AppWidgets {
  static final List<Widget> bottomNavWidgets = [
    HomeScreen(),
    MedicalCenterScreen(),
    MedicamentScreen(),
    VisitCardScreen(),
    SettingsScreen()
  ];

  static getAppBar(BuildContext context, String title) => AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
      );

  static final Widget aibolitImg = SizedBox(
    width: 100,
    height: 100,
    child: Image(
      image: AssetImage('assets/img/logofull.png'),
    ),
  );

  static getHeaderWithLogo(String title, String msg) => SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          color: AppColors.grey200,
          child: Column(
            children: <Widget>[
              AppWidgets.aibolitImg,
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.TEXT_SIZE_14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                    Text(
                      msg,
                      style: TextStyle(
                        fontSize: Dimens.TEXT_SIZE_11,
                        color: AppColors.primaryGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  static Widget getCircleAvatar(double radius, String asset) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(asset),
    );
  }

  static Widget getTextHeader(String title) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title.toUpperCase(),
          style: Themes.getTextStyle(
            fontSize: Dimens.TEXT_SIZE_11,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      );

  static Widget getText(String title) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          title,
          style: TextStyle(
            fontSize: Dimens.TEXT_SIZE_12,
            color: Colors.grey.shade600,
          ),
        ),
      );

  static BoxDecoration getTodayBorder(DateTime date) {
    return Util.isFuture(date)
        ? BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.PRIMARY_COLOR,
                width: 4,
              ),
            ),
          )
        : null;
  }
}
