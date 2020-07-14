import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_widgets.dart';

class VisitCardBookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppWidgets.getTextHeader('Закладки'),
          FutureBuilder<List<Visit>>(
            future: _getVisits(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.length.toString());
              } else {
                return AppWidgets.getText(
                    'Здесь будут отображаться добавленные в закладки доктора и медцентры.');
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<Visit>> _getVisits() async {
    bool isLoggedIn =
        await Preferences.readBoolPref(Strings.IS_LOGGED_IN, false);

    var list = [];

    if (isLoggedIn) {
      list = Data.visits;
      list.retainWhere((element) =>
          element.owner == Data.owner && element.date.isAfter(DateTime.now()));
    }

    return list;
  }
}
