import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/doctor.dart';
import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/util/icon_with_text.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;
  final Program program;

  const DoctorItem({
    Key key,
    this.doctor,
    this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: AppColors.grey300,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 12,
                    bottom: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextOneLine(
                        '${doctor.lastName} ${doctor.firstName} ${doctor.middleName}',
                        style: TextStyle(
                          fontSize: Dimens.TEXT_SIZE_13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppWidgets.getText(
                        title: '${doctor.speciality}',
                        top: 8,
                        bottom: 4,
                        fontSize: Dimens.TEXT_SIZE_11,
                      ),
                      ..._getCenters(doctor.centers),
                      if (Data.programToDoctors[Data.program2].contains(doctor))
                        AppWidgets.getText(
                          title: 'Дети',
                          top: 4,
                          fontColor: AppColors.PRIMARY_COLOR,
                          fontSize: Dimens.TEXT_SIZE_11,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            IconWithText(
                              iconData: MaterialCommunityIcons.calendar_month,
                              color: AppColors.PRIMARY_COLOR,
                              text: 'завтра',
                              size: 20,
                            ),
                            SizedBox(width: 16,),
                            IconWithText(
                              iconData: MaterialIcons.chat,
                              color: AppColors.green,
                              text: 'Нет отзывов',
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppWidgets.getCircleAvatarWithLogo(
                padding: 12,
                avatar: doctor.avatar,
                avatarRadius: 32,
                programOpacity:
                    Data.programToDoctors[program].contains(doctor) ? 0 : 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCenters(
    List<Clinic> list,
  ) =>
      List.generate(
        list.length,
        (index) => AppWidgets.getText(
          title: list[index].title,
          fontSize: Dimens.TEXT_SIZE_11,
        ),
      );
}
