import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'family_item.dart';

class FamilyScreen extends StatefulWidget {
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final List<User> family = Data.owner.family;

  final String _appBarTitle = 'Моя семья';

  var forceReload = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(
        context: context,
        title: _appBarTitle,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.grey200,
          child: FutureBuilder<void>(
              future: forceReload ? _reload() : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppWidgets.getText(
                          title: _appBarTitle,
                          top: 8,
                          left: 16,
                          bottom: 12,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.TEXT_SIZE_11,
                          fontColor: Colors.black54,
                          isUpperCase: true,
                        ),
                        ..._getFamily(family),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btn1',
            mini: true,
            child: Icon(
              MaterialCommunityIcons.reload,
              color: Colors.white,
            ),
            backgroundColor: AppColors.green,
            onPressed: () => setState(() {
              forceReload = true;
            }),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            mini: true,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: AppColors.green,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => AppWidgets.getModalBody(
                context: context,
                title: 'Добавление родственника',
                actions: _getActions(Data.addFamilyActions),
                isClear: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FamilyItem> _getFamily(List<User> list) =>
      List.generate(list.length, (index) => FamilyItem(list[index]));

  Future<void> _reload() async {
    await Future.delayed(Duration(seconds: 3));
  }

  List<Widget> _getActions(List<String> list) => List.generate(
        list.length,
        (index) => AppWidgets.getModalItem(list[index]),
      );
}
