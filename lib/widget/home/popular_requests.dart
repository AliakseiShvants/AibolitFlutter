import 'package:AibolitFlutter/entity/request_item.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/widget/container/popular_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppWidgets.getText(
            'Популярные запросы',
            left: 16,
            top: 24,
            bottom: 8,
            isUpperCase: true,
            fontSize: Dimens.TEXT_SIZE_10,
            fontWeight: FontWeight.bold,
            fontColor: Colors.black87,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              children: <Widget>[
                ..._getPopularRequests(Data.popularRequests),
              ],
            ),
          ),
        ],
      ),
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
