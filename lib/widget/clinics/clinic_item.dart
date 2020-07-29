import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/util/icon_with_text.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ClinicItem extends StatelessWidget {
  final Clinic clinic;

  const ClinicItem({this.clinic});

  @override
  Widget build(BuildContext context) {
    final widget = MainContainerInherited.of(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/clinic',
        arguments: <String, dynamic>{
          'clinic': clinic,
          'title': 'Медцентр',
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
              borderColor: _isColoredBorder(clinic)
                  ? AppColors.green
                  : AppColors.grey400,
              isRight: true,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppWidgets.getCircleAvatarWithLogo(
                    avatar: clinic.logo,
                    avatarRadius: 32,
                    padding: 12,
                    programOpacity: Util.getLogoOpacityByClinic(clinic)),
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
                          title: clinic.title,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.TEXT_SIZE_13,
                          maxLines: 2,
                          softWrap: false,
                          isExpanded: true,
                          isUpperCase: false,
                        ),
                        AppWidgets.getText(
                          title: '${clinic.town} ${clinic.address}',
                          top: 8,
                          bottom: 8,
                          fontSize: Dimens.TEXT_SIZE_11,
                          isUpperCase: false,
                        ),
                        Row(
                          children: <Widget>[
                            IconWithText(
                              iconData: Icons.access_time,
                              color: AppColors.PRIMARY_COLOR,
                              text: '8:00 - 20:00',
                              size: 20,
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            IconWithText(
                              iconData: MaterialIcons.chat,
                              color: AppColors.green,
                              text: 'Нет отзывов',
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
}
