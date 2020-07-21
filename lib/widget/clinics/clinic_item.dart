import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ClinicItem extends StatelessWidget {
  final Clinic _clinic;

  const ClinicItem(this._clinic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
        bottom: 8,
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        child: Container(
          decoration: AppWidgets.getColorBorder(
            borderColor:
                _isColoredBorder(_clinic) ? AppColors.green : AppColors.grey400,
            isRight: true,
          ),
          child:
//          ListTile(
//            leading: AppWidgets.bookmarkLogo(_clinic, padding: 0,),
//            title: AppWidgets.getText(
//              _clinic.title,
//              left: 8,
//              top: 8,
//              right: 8,
//              fontSize: Dimens.TEXT_SIZE_12,
//              fontWeight: FontWeight.bold,
//              maxLines: 2,
//              isExpanded: true,
//              isUpperCase: false,
//            ),
//            subtitle: AppWidgets.getText(
//              '${_clinic.town} ${_clinic.address}',
//              left: 8,
//              top: 0,
//              fontSize: Dimens.TEXT_SIZE_11,
//              isUpperCase: false,
//            ),
//            isThreeLine: true,
//
//          ),
              Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppWidgets.bookmarkLogo(_clinic),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppWidgets.getText(
                    _clinic.title,
                    left: 8,
                    top: 8,
                    right: 8,
                    fontSize: Dimens.TEXT_SIZE_12,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    isExpanded: true,
                    isUpperCase: false,
                  ),
                  AppWidgets.getText(
                    '${_clinic.town} ${_clinic.address}',
                    left: 8,
                    top: 0,
                    fontSize: Dimens.TEXT_SIZE_11,
                    isUpperCase: false,
                  ),
                  Row(
                    children: <Widget>[
                      _getIconText(
                        Icons.access_time,
                        AppColors.PRIMARY_COLOR,
                        '8:00 - 20:00',
                        size: 20,
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      _getIconText(
                        MaterialIcons.chat,
                        AppColors.green,
                        'Нет отзывов',
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isColoredBorder(Clinic clinic) => Data.epamClinics.contains(clinic);

  Widget _getIconText(IconData iconData, Color color, String text,
          {double size = 24}) =>
      Row(
        children: <Widget>[
          Icon(
            iconData,
            size: size,
            color: color,
          ),
          AppWidgets.getText(
            text,
            left: 8,
            top: 8,
            fontSize: Dimens.TEXT_SIZE_11,
          ),
        ],
      );
}
