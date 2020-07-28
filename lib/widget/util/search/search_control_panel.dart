import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchControlPanel extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color bookmarkIconColor;
  final Function bookmarkCallback;
  final Function filterCallback;
  final String sortTitle;
  int sortIndex;
  final List<String> sortOptions;
  final Function sortCallback;

  SearchControlPanel({
    Key key,
    this.title,
    this.iconData,
    this.bookmarkCallback,
    this.bookmarkIconColor,
    this.sortCallback,
    this.filterCallback,
    this.sortIndex,
    this.sortOptions,
    this.sortTitle,
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
            data: iconData,
            callback: bookmarkCallback,
            iconColor: bookmarkIconColor,
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
