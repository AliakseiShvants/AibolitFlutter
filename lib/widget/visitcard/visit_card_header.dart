import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VisitCardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Закладки'.toUpperCase(),
            style: TextStyle(
              fontSize: Dimens.TEXT_SIZE_10,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 16,
              right: 12,
              bottom: 16,
            ),
            child: Text(
              'Здесь будут отображаться добавленные в закладки доктора и медцентры.',
              style: TextStyle(
                fontSize: Dimens.TEXT_SIZE_12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
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
                Icon(
                  AntDesign.filter,
                  color: Colors.black54,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
