import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/widget/visitcard/bookmarkItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_widgets.dart';

class VisitCardBookmarks extends StatelessWidget {
  final List<Clinic> _clinics;

  const VisitCardBookmarks(this._clinics);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppWidgets.getTextHeader('Закладки'),
        if (_clinics.length > 0)
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...List.generate(
                    _clinics.length,
                    (index) => BookmarkItem(_clinics[index]),
                  ),
                ],
              ),
            ),
          ),
        if (_clinics.length == 0)
          AppWidgets.getText(
            'Здесь будут отображаться добавленные в закладки доктора и медцентры.',
          ),
      ],
    );
  }
}
