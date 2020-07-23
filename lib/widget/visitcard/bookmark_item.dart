import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookmarkItem extends StatelessWidget {
  final Clinic _clinic;

  const BookmarkItem(this._clinic);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 124,
        width: 106,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppWidgets.getCircleAvatarWithLogo(
                clinic: _clinic,
                avatarRadius: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  _clinic.title,
                  style: Themes.getTextStyle(
                    color: AppColors.primaryGrey,
                    fontSize: Dimens.TEXT_SIZE_11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
