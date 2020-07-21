import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/home/nearest_visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NearestVisits extends StatelessWidget {
  final List<Visit> _visits;

  const NearestVisits(this._visits);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppWidgets.getText(
          'Ближайшие визиты',
          top: 24,
          left: 16,
          bottom: 8,
          isUpperCase: true,
          fontSize: Dimens.TEXT_SIZE_10,
          fontWeight: FontWeight.bold,
          fontColor: Colors.black87,
        ),
//        AppWidgets.getText('Просмотр ближайших визитов будет доступен сразу после авторизации'),
        ..._getNearestVisits(_visits),
      ],
    );
  }

  List<NearestVisit> _getNearestVisits(List<Visit> list) =>
      List.generate(list.length, (index) => NearestVisit(list[index]));
}
