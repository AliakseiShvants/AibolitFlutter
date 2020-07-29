import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchControlPanel extends StatelessWidget {
  final String title;
  final bool isBookmarkEnabled;
  final Function bookmarkCallback;
  final Function filterCallback;
  final Function sortCallback;

  SearchControlPanel({
    Key key,
    this.title,
    this.bookmarkCallback,
    this.sortCallback,
    this.filterCallback,
    this.isBookmarkEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AppWidgets.getText(
              title: title,
              left: 8,
              isUpperCase: true,
              fontSize: Dimens.TEXT_SIZE_11,
            ),
          ),
          AppWidgets.getClickableIcon(
            data: isBookmarkEnabled ? Icons.bookmark : Icons.bookmark_border,
            iconColor:
                isBookmarkEnabled ? AppColors.PRIMARY_COLOR : Colors.black54,
            callback: bookmarkCallback,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: GestureDetector(
              onTap: filterCallback,
              child: Transform.rotate(
                angle: 3.14 / 2,
                child: Icon(
                  SimpleLineIcons.equalizer,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          AppWidgets.getClickableIcon(
            data: Icons.sort,
            callback: sortCallback,
          ),
        ],
      ),
    );
  }
}
