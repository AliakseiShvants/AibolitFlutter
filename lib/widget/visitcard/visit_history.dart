import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VisitHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AppWidgets.getTextHeader('История посещений'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 16, bottom: 8),
              child: Transform.rotate(
                  angle: 3.14 / 2,
                  child: Icon(
                    SimpleLineIcons.equalizer,
                    color: Colors.black54,
                  )),
            ),
          ],
        ),
        ..._getAllVisits(),
      ],
    );
  }

  List<VisitCard> _getAllVisits() => List.generate(Data.visits.length, (index) {
        return VisitCard(Data.visits[index]);
      });
}
