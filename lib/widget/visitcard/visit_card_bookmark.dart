import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VisitCardBookmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Закладки'.toUpperCase(),
              style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_10,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Здесь будут отображаться добавленные в закладки доктора и медцентры.',
              style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
