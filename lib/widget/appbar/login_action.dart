import 'dart:async';

import 'package:flutter/material.dart';

import '../../entity/user.dart';
import '../../utils/app_widgets.dart';
import '../../utils/data.dart';
import '../../utils/strings.dart';

class LoginAction extends StatefulWidget {
  final User _user;
  final bool _isLoggedIn;
  final bool _isNeedToRefresh;
  final Function _loginCallback;
  final Function _logoutCallback;

  LoginAction(
      this._user,
      this._isLoggedIn,
      this._isNeedToRefresh,
      this._loginCallback,
      this._logoutCallback,
  );

  @override
  _LoginActionState createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  @override
  Widget build(BuildContext context) {
    if (widget._isLoggedIn) {
      return MaterialButton(
        child: AppWidgets.getCircleAvatar(16, Data.owner.avatar),
        onPressed: widget._logoutCallback,
      );
    } else {
      return widget._user == Data.guest
          ? MaterialButton(
        child: Text(
          Strings.LOGIN,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: widget._loginCallback,
      )
          : FutureBuilder<bool>(
        future: widget._isNeedToRefresh ? _needToRefresh() : null,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          var child;
          var callback;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              {
                child = AppWidgets.getCircleAvatar(16, Data.stubAsset);
                callback = null;

                break;
              }
            case ConnectionState.waiting:
              {
                child = Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AppWidgets.getCircleAvatar(16, Data.stubAsset),
                    CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                );
                callback = null;

                break;
              }
            case ConnectionState.done:
              {
                child = AppWidgets.getCircleAvatar(16, Data.owner.avatar);
                callback = widget._logoutCallback;

                break;
              }
          }

          return MaterialButton(
            child: child,
            onPressed: callback,
          );
        },
      );
    }
  }

  Future<bool> _needToRefresh() async {
    await Future.delayed(Duration(seconds: 5));

    return true;
  }
}
