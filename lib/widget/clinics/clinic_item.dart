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
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/clinic',
        arguments: <String, Clinic>{
          'clinic': _clinic,
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          child: Container(
            decoration: AppWidgets.getColorBorder(
              borderColor: _isColoredBorder(_clinic)
                  ? AppColors.green
                  : AppColors.grey400,
              isRight: true,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppWidgets.getCircleAvatarWithLogo(
                  clinic: _clinic,
                  avatarRadius: 28,
                  padding: 12,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppWidgets.getText(
                          title: _clinic.title,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.TEXT_SIZE_13,
                          maxLines: 2,
                          isExpanded: true,
                          isUpperCase: false,
                        ),
                        AppWidgets.getText(
                          title: '${_clinic.town} ${_clinic.address}',
                          fontSize: Dimens.TEXT_SIZE_11,
                          top: 8,
                          bottom: 8,
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
                  ),
                ),
              ],
            ),
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
            title: text,
            left: 8,
            fontSize: Dimens.TEXT_SIZE_11,
          ),
        ],
      );
}
