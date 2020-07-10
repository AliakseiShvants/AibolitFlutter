import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_card_bookmark.dart';
import 'package:AibolitFlutter/widget/visitcard/visit_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'file:///C:/Users/Aliaksei_Shvants/projects/AibolitFlutter/lib/widget/visitcard/visit_card.dart';

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
              VisitCardBookmark(),
              VisitList(),
            ],
          ),
        ),
      ),
    );
  }
}
