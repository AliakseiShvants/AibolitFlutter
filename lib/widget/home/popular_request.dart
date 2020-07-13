import 'package:AibolitFlutter/entity/request_item.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:AibolitFlutter/widget/container/popular_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Популярные запросы'.toUpperCase(),
            style: Themes.getTextStyle(
              fontSize: Dimens.TEXT_SIZE_11,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        Wrap(
          children: <Widget>[
            ..._getPopularRequests(Data.popularRequests),
          ],
        ),
      ],
    );
  }

  List<PopularRequestItem> _getPopularRequests(List<RequestItem> list) {
    return List.generate(
      list.length,
      (index) => PopularRequestItem(
        title: list[index].title,
        isHuman: list[index].isHuman,
      ),
    );
  }
}
