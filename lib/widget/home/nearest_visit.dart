import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

class NearestVisit extends StatelessWidget {
  final Visit _visit;
  final List<String> list = [
    'Показать на карте',
    'Добавить в календарь',
    'Перенести дату/время визита',
    'Переназначить посетителя',
    'Отменить визит',
  ];

  NearestVisit(this._visit);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Row(
        children: <Widget>[
          AppWidgets.getColoredContainer(
            color: AppColors.PRIMARY_COLOR,
//            height: 108,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: SizedBox(
              height: 72,
              width: 72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppWidgets.getCircleAvatar(
                    radius: 24,
                    asset: _visit.owner.avatar,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: AppWidgets.getText(
                      title: _getVisitOwnerName(_visit.owner),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AppWidgets.getText(
                          title: Util.getVisitTitle(
                            _visit.date,
                            _visit.doctor.speciality,
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.TEXT_SIZE_15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => AppWidgets.getModalBody(
                            context: context,
                            title: 'Визит: ${_visit.doctor.speciality}',
                            subtitles: [
                              _visit.center.title,
                              '${_visit.center.town} ${_visit.center.address}',
                              DateFormat('dd MMMM, HH:mm').format(_visit.date),
                            ],
                            isClear: true,
                            actions: List.generate(
                              list.length,
                              (index) => AppWidgets.getModalItem(list[index]),
                            ),
                          ),
                        ),
                        child: Icon(
                          Feather.more_vertical,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 12,
                    ),
                    child: TextOneLine(
                      '${_visit.doctor.lastName} ${_visit.doctor.firstName} ${_visit.doctor.middleName}',
                      style: TextStyle(fontSize: Dimens.TEXT_SIZE_11),
                    ),
                  ),
                  AppWidgets.getText(
                    title: '${_visit.doctor.speciality}',
                    fontSize: Dimens.TEXT_SIZE_11,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AppWidgets.getText(
                          title: '${_visit.center.title}',
                          fontSize: Dimens.TEXT_SIZE_11,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Opacity(
                          opacity: Util.getLogoOpacity(_visit),
                          child: Image(
                            image: AssetImage(_visit.owner.program.logo),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getVisitOwnerName(User user) {
    return user == Data.owner ? 'Мой' : user.firstName;
  }
}
