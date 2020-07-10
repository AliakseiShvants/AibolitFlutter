import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VisitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'История посещений'.toUpperCase(),
                  style: TextStyle(
                    fontSize: Dimens.TEXT_SIZE_10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Transform.rotate(
                  angle: 3.14 / 2,
                  child: Icon(
                    SimpleLineIcons.equalizer,
                    color: Colors.black54,
                  )),
            ],
          ),
        ),
        ..._getVisits(),
      ],
    );
  }

  List<VisitCard> _getVisits() => List.generate(Data.visits.length, (index) {
        return VisitCard(Data.visits[index]);
      });
}
