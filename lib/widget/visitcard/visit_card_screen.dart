import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_card_bookmarks.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VisitCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey200,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              VisitCardBookmarks(Data.centers + Data.centers),
              VisitHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
