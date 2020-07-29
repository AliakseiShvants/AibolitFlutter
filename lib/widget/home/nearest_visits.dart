import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/util.dart';
import 'package:AibolitFlutter/widget/home/nearest_visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NearestVisits extends StatelessWidget {
  final List<Visit> visits;

  const NearestVisits({this.visits});

  @override
  Widget build(BuildContext context) {
    final nearestVisits =
        visits.where((element) => Util.isFuture(element.date)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            AppWidgets.getText(
              title: 'Ближайшие визиты',
              top: 24,
              left: 16,
              bottom: 8,
              isUpperCase: true,
              fontSize: Dimens.TEXT_SIZE_11,
              fontWeight: FontWeight.bold,
              fontColor: Colors.black87,
            ),
          ],
        ),
        if (nearestVisits.isEmpty)
          AppWidgets.getText(
              title:
                  'Просмотр ближайших визитов будет доступен сразу после авторизации'),
        ..._getNearestVisits(nearestVisits),
      ],
    );
  }

  List<Widget> _getNearestVisits(List<Visit> list) => List.generate(
        list.length,
        (index) => NearestVisit(list[index]),
      );
}
