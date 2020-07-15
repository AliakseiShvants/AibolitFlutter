import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/appbar/account/family_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
      appBar: AppWidgets.getAppBar(context, _appBarTitle),
      body: SafeArea(
        child: Container(
          color: AppColors.grey200,
          child: FutureBuilder<void>(
              future: forceReload ? _reload() : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppWidgets.getTextHeader(_appBarTitle),
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
            mini: true,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: AppColors.green,
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
}
