import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/visitcard/bookmark_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_widgets.dart';

class VisitCardBookmarks extends StatelessWidget {
  final List<Clinic> _clinics;

  const VisitCardBookmarks(this._clinics);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppWidgets.getText(
            title: 'Закладки',
            left: 12,
            fontWeight: FontWeight.bold,
            fontSize: Dimens.TEXT_SIZE_11,
            fontColor: Colors.black54,
            isUpperCase: true,
          ),
          if (_clinics.length > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Scrollbar(
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
            ),
          if (_clinics.length == 0)
            AppWidgets.getText(
              title:
                  'Здесь будут отображаться добавленные в закладки доктора и медцентры.',
              maxLines: 3,
              top: 16,
              left: 24,
              right: 48,
              fontColor: AppColors.primaryGrey,
            ),
        ],
      ),
    );
  }
}
