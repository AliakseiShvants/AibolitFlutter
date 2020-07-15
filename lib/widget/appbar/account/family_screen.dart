import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/appbar/account/family_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FamilyScreen extends StatelessWidget {
  final List<User> family = Data.owner.family;
  final String _appBarTitle = 'Моя семья';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(context, _appBarTitle),
      body: SafeArea(
        child: Container(
//          width: double.infinity,
          color: AppColors.grey200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppWidgets.getTextHeader(_appBarTitle),
                    ..._getFamily(family),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<FamilyItem> _getFamily(List<User> list) =>
      List.generate(list.length, (index) => FamilyItem(list[index]));
}