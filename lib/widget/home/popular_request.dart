import 'package:AibolitFlutter/entity/request_item.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
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
              fontSize: Dimens.TEXT_SIZE_10,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
//        Row(
//          children: <Widget>[
//            PopularRequestItem(
//              title: 'Терапевт',
//              isHuman: true,
//            ),
//            PopularRequestItem(
//              title: 'Терапевт',
//              isHuman: true,
//            ),
//            PopularRequestItem(
//              title: 'Терапевт',
//              isHuman: true,
//            ),
//          ],
//        ),
      ..._getRows(context, Data.popularRequests),
      ],
    );
  }

  List<Row> _getRows(BuildContext context, List<RequestItem> list) {
//    final double width = MediaQuery.of(context).size.width - 24;
    List<Row> result = [];
    List<PopularRequestItem> items = [];
//    List<double> itemsWidth = [];

//    double overallLength = 0.0;

    for(int i = 0; i < list.length; i++) {
      var element = list[i];
      var request = PopularRequestItem(
//        key: GlobalKey(),
        title: element.title,
        isHuman: element.isHuman,
      );
      items.add(request);

//      RenderBox renderBox = request.key.currentContext.findRenderObject();
//      itemsWidth.add(renderBox.size.width);
    }

//    itemsWidth.forEach((element) => overallLength += element);

//    int rowsCount = (overallLength / width).floor();

    for (int i = 0; i < /*rowsCount*/(list.length / 2).floor(); i++) {
//      double rowWidth = 0;
      List<PopularRequestItem> children = [];

      //temp
      var trigger = 0;

      while (/*rowWidth < width*/trigger < 2) {
        if (items.length != 0) {
          children.add(items.first);
          items.removeAt(0);
        }

//        rowWidth += itemsWidth.first;



        //temp
        trigger++;
//        itemsWidth.removeAt(0);
      }

      result.add(Row(children: children,));
    }

    return result;
  }
}
