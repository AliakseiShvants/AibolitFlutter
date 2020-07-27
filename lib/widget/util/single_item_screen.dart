import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'search/online_bunner.dart';

class SingleItemScreen extends StatelessWidget {
//  Clinic _clinic;
  final String appBarTitle;
  final IconData iconData;
  final Function iconCallback;

  const SingleItemScreen({
    Key key,
    this.appBarTitle,
    this.iconData, this.iconCallback,
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
            onPressed: null,
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
//              OnlineBunner(
//                isOnline: _clinic.isOnline,
//              ),
//              ClinicHeader(
//                clinic: _clinic,
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
