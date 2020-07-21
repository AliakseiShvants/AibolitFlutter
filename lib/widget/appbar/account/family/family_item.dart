import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FamilyItem extends StatelessWidget {
  final User _user;

  const FamilyItem(this._user);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: AppColors.grey300,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: AppWidgets.getCircleAvatar(
          24,
          _user.avatar,
        ),
        title: Text(
          Util.getFullName(_user),
          style: Themes.getTextStyle(
            fontSize: Dimens.TEXT_SIZE_14,
            color: Colors.black87,
          ),
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
        subtitle: Text(
          'Ребёнок, ' + Util.getBirthDate(_user.birthDay),
          style: Themes.getTextStyle(
            fontSize: Dimens.TEXT_SIZE_11,
            color: Colors.black87,
          ),
        ),
        trailing: Image(
          image: AppWidgets.programLogo,
        ),
      ),
    );
  }
}
