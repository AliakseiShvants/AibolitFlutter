import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VisitHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AppWidgets.getText(
                  title: 'История посещений',
                  left: 12,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.TEXT_SIZE_11,
                  fontColor: Colors.black54,
                  isUpperCase: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
//                top: 8,
//                bottom: 8,
                ),
                child: Transform.rotate(
                  angle: 3.14 / 2,
                  child: Icon(
                    SimpleLineIcons.equalizer,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        ..._getAllVisits(Data.visits),
      ],
    );
  }

  List<VisitCard> _getAllVisits(List<Visit> list) =>
      List.generate(list.length, (index) => VisitCard(list[index]));
}
