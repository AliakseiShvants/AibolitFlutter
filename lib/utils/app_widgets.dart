import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/clinics/clinics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/home/home_screen.dart';
import '../widget/pills/pills_screen.dart';
import '../widget/settings/settings_screen.dart';
import '../widget/visitcard/visit_card_screen.dart';
import 'app_colors.dart';
import 'borders.dart';
import 'dimens.dart';

class AppWidgets {
  static final stubImg = AssetImage('assets/img/user_avatar.png');
  static final programLogo = AssetImage('assets/img/epam_logo.png');

  static final List<Widget> bottomNavWidgets = [
    HomeScreen(),
    ClinicsScreen(),
    PillsScreen(),
    VisitCardScreen(),
    SettingsScreen()
  ];

  static getAppBar(BuildContext context, String title,
          {List<Widget> actions}) =>
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
        actions: actions,
      );

  static final Widget aibolitImg = SizedBox(
    width: 100,
    height: 100,
    child: Image(
      image: AssetImage('assets/img/logofull.png'),
    ),
  );

  static getHeaderWithLogo(String title, String msg, double flex) => SizedBox(
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: (5 * (1 - flex)).toInt(),
                      child: Container(),
                    ),
                    Expanded(
                      flex: (10 * flex).toInt(),
                      child: Text(
                        msg,
                        style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_11,
                          color: AppColors.primaryGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: (5 * (1 - flex)).toInt(),
                      child: Container(),
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

  static Widget bookmarkLogo(Clinic clinic) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AppWidgets.getCircleAvatar(
                28,
                clinic.logo,
              ),
            ),
            Opacity(
              opacity: Util.getLogoOpacityByClinic(clinic),
              child: Image(
                image: AppWidgets.programLogo,
              ),
            ),
          ],
        ),
      );

  static Widget getText(
    String title, {
    double left = 16,
    double top = 16,
    double bottom = 8,
    double right = 0,
    fontSize: Dimens.TEXT_SIZE_12,
    fontWeight: FontWeight.normal,
    fontColor: Colors.black87,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.fade,
    bool isUpperCase = false,
    bool isExpanded = false,
  }) {
    final child = Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        bottom: bottom,
        right: right,
      ),
      child: Text(
        isUpperCase ? title.toUpperCase() : title,
        maxLines: maxLines,
        overflow: overflow,
        style: Themes.getTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    );

    return child;
  }

  static BoxDecoration getColorBorder({
    Color color = Colors.white,
    bool isRight = false,
    Color borderColor = AppColors.PRIMARY_COLOR,
  }) {
    Border border;
    BorderSide borderSide;

    if (borderColor != null) {
      borderSide = BorderSide(color: AppColors.grey300);
      border = isRight
          ? Border(
              right: BorderSide(
                color: borderColor,
                width: 4,
              ),
              left: borderSide,
              bottom: borderSide,
              top: borderSide,
            )
          : Border(
              left: BorderSide(
                color: borderColor,
                width: 4,
              ),
              right: borderSide,
              bottom: borderSide,
              top: borderSide,
            );
    } else {
      border = Border.all(color: AppColors.grey300);
    }

    return BoxDecoration(
      border: border,
      color: color,
    );
  }

  static InputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey300),
  );

  static Widget getModalBody(
    BuildContext context,
    String title,
    List<dynamic> actions, {
    bool isClear = false,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Themes.getTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isClear)
                  GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () => Navigator.pop(context),
                  ),
              ],
            ),
          ),
          ...actions,
        ],
      );

  static Widget getModalItem(String title) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: Borders.primaryGreyBorderSide,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            title,
          ),
        ),
      );

  static Widget getModalRadioItem(String title, bool isSelected) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: Borders.primaryGreyBorderSide,
          ),
        ),
        child: RadioListTile(
          selected: true,
          value: title,
          title: Text(title),
        ),
      );
}
