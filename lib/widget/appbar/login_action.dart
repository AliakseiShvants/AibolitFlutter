import 'dart:async';

import 'package:flutter/material.dart';

import '../../entity/user.dart';
import '../../utils/app_widgets.dart';
import '../../utils/data.dart';
import '../../utils/strings.dart';

class LoginAction extends StatefulWidget {
  final User user;
  final bool isLoggedIn;
  final bool isNeedToRefresh;
  final Function loginCallback;
  final Function logoutCallback;

  LoginAction({
    this.user,
    this.isLoggedIn,
    this.isNeedToRefresh,
    this.loginCallback,
    this.logoutCallback,
  });

  @override
  _LoginActionState createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoggedIn) {
      return MaterialButton(
        child: AppWidgets.getCircleAvatar(
          radius: 16,
          asset: Data.owner.avatar,
        ),
        onPressed: widget.logoutCallback,
      );
    } else {
      return widget.user == Data.guest
          ? MaterialButton(
              child: Text(
                Strings.LOGIN,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: widget.loginCallback,
            )
          : FutureBuilder<bool>(
              future: widget.isNeedToRefresh ? _needToRefresh() : null,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                var child;
                var callback;

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    {
                      child = AppWidgets.getCircleAvatar(
                        radius: 16,
                        asset: Data.stubAsset,
                      );
                      callback = null;

                      break;
                    }
                  case ConnectionState.waiting:
                    {
                      child = Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          AppWidgets.getCircleAvatar(
                            radius: 16,
                            asset: Data.stubAsset,
                          ),
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
                      child = AppWidgets.getCircleAvatar(
                        radius: 16,
                        asset: Data.owner.avatar,
                      );
                      callback = widget.logoutCallback;

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
