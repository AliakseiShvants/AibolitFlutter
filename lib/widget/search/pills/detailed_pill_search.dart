import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/widget/appbar/location.dart';
import 'package:AibolitFlutter/widget/appbar/login_action.dart';
import 'package:AibolitFlutter/widget/util/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailedPillSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<MainContainerInherited>();

    return Scaffold(
      appBar: AppWidgets.getAppBar(
        automaticallyImplyLeading: true,
        title: Location(
          locationIndex: widget.locationIndex,
          cities: Data.cities,
          locationCallback: widget.locationCallback,
        ),
        actions: <Widget>[
          LoginAction(
            user: widget.user,
            isLoggedIn: widget.isLoggedIn,
            isNeedToRefresh: widget.isNeedToRefresh,
            loginCallback: widget.loginCallback,
            logoutCallback: widget.logoutCallback,
          ),
        ],
      ),
    );
  }
}
