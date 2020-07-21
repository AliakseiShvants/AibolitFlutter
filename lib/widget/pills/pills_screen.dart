import 'dart:convert';

import 'package:AibolitFlutter/entity/drug.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillsScreen extends StatefulWidget {
  @override
  _PillsScreenState createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  String text = 'find';
  List<Drug> drugs = [];

  var drugController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    drugController.addListener(() { });

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: AppColors.grey500,
                ),
                child: TextField(
                  cursorColor: AppColors.green,
                  controller: drugController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.grey500,
                      size: 28,
                    ),
                    isDense: true,
                    focusedBorder: AppWidgets.textFieldBorder,
                    enabledBorder: AppWidgets.textFieldBorder,
                    hintText: 'Поиск (по полному названию)...',
                  ),
                  keyboardType: TextInputType.text,
                  onTap: null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void getDrugs() async {
    final response = await Network.getDrugs('уголь');

    List<Drug> result = (json.decode(utf8.decode(response.bodyBytes)) as List)
        .map((data) => Drug.fromJson(data))
        .toList();

    setState(() {
      drugs = result;
    });
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
