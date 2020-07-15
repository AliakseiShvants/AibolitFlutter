import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
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
        AppWidgets.getTextHeader('Ближайшие визиты'),
//        AppWidgets.getText('Просмотр ближайших визитов будет доступен сразу после авторизации'),
        ..._getNearestVisits(_visits),
      ],
    );
  }

  List<NearestVisit> _getNearestVisits(List<Visit> list) =>
      List.generate(list.length, (index) => NearestVisit(list[index]));
}
