import 'dart:convert';

import 'package:AibolitFlutter/entity/drug.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillsSearchScreen extends StatefulWidget {
  @override
  _PillsSearchScreenState createState() => _PillsSearchScreenState();
}

class _PillsSearchScreenState extends State<PillsSearchScreen> {
  String text = 'find';
  List<Drug> drugs = [];

  var drugController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    drugController.addListener(() {});

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey100,
            border: Border(
              bottom: BorderSide(
                color: AppColors.grey300,
              ),
            ),
          ),
          child: AppWidgets.getInputField(
            context: context,
            borderColor: AppColors.grey400,
            top: 12,
            right: 12,
            bottom: 12,
            left: 12,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey500,
              size: 28,
            ),
            hint: 'Поиск (по полному названию)...',
            controller: null,
          ),
        ),
      ],
    );
  }

  void getDrugs() async {
//    final response = await Network.getDrugs('уголь');
//
//    List<Drug> result = (json.decode(utf8.decode(response.bodyBytes)) as List)
//        .map((data) => Drug.fromJson(data))
//        .toList();
//
//    setState(() {
//      drugs = result;
//    });
  }

  List<Card> widgets(List<Drug> list) => List.generate(
        list.length,
        (index) {
          var drug = drugs[index];

          return Card(
            child: Column(
              children: <Widget>[
                Text(drug.title),
                Text(drug.form),
                Text(drug.country),
                Text(drug.name),
              ],
            ),
          );
        },
      );
}
