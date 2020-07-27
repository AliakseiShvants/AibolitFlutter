import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/util/search/online_bunner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:map_launcher/map_launcher.dart';

import 'single_item_header.dart';
import 'single_item_info.dart';

class SingleItemScreen extends StatelessWidget {
  final String appBarTitle;
  final bool isClinic;
  final bool isClinicOnline;
  final String avatar;
  final String itemTitle;
  final String buttonTitle;
  final IconData iconData;
  final Function iconCallback;
  final double programOpacity;
  final String location;
  final String link;
  final Function buttonCallback;
  final Coords coords;
  final String timeTitle;
  final String timeInfo;
  final String feedbackTitle;
  final String feedbackInfo;

  const SingleItemScreen({
    Key key,
    this.appBarTitle,
    this.iconData,
    this.iconCallback,
    this.isClinic = false,
    this.isClinicOnline = false,
    this.avatar,
    this.programOpacity,
    this.itemTitle,
    this.location,
    this.link,
    this.buttonTitle,
    this.buttonCallback,
    this.coords,
    this.timeTitle,
    this.timeInfo,
    this.feedbackTitle,
    this.feedbackInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: appBarTitle,
        actions: [
          AppWidgets.getClickableIcon(
            data: iconData,
            iconColor: Colors.white,
            callback: iconCallback,
          ),
          MaterialButton(
            onPressed: () => Navigator.pushNamed(context, '/account'),
            child: AppWidgets.getCircleAvatar(
              radius: 16,
              asset: Data.owner.avatar,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.grey200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (isClinic)
                OnlineBunner(
                  isOnline: isClinicOnline,
                ),
              SingleItemHeader(
                avatar: avatar,
                programOpacity: programOpacity,
                itemTitle: itemTitle,
                location: location,
                link: link,
                buttonTitle: buttonTitle,
                buttonCallback: buttonCallback,
                coords: coords,
              ),
              SingleItemInfo(
                timeTitle: timeTitle,
                timeInfo: timeInfo,
                feedbackInfo: feedbackInfo,
                feedbackTitle: feedbackTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
