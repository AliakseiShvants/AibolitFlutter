import 'dart:async';

import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:flutter/material.dart';

import '../../utils/strings.dart';

class LoginAction extends StatefulWidget {
  @override
  _LoginActionState createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  bool _isLoggedIn = false;
  bool _isLoginEnabled = false;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    final _loggedInAvatar = CircleAvatar(
      radius: 16.0,
      backgroundColor: Colors.green,
      backgroundImage: AssetImage(Data.user1.avatar),
    );

    void _loggedInCallback() {
      Navigator.pushNamed(
        context,
        '/account',
      ).then((value) {
        if (value) {
          _logout();
        }
      });
    }

    return _isLoggedIn
        ? MaterialButton(
            child: _loggedInAvatar,
            onPressed: _loggedInCallback,
          )
        : FutureBuilder<bool>(
            future: _isLoginEnabled ? _login() : null,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              var child;
              var callback;

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  {
                    child = Text(
                      Strings.LOGIN,
                      style: const TextStyle(color: Colors.white),
                    );
                    callback = _enableLogin;

                    break;
                  }
                case ConnectionState.waiting:
                  {
                    child = Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 16.0,
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage(Data.user1.avatar),
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
                    child = _loggedInAvatar;
                    callback = _loggedInCallback;

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

  init() {
    Preferences.readBoolPrefs().then((value) {
      _isLoggedIn = value[0];
      _isLoginEnabled = value[1];
    });
  }

  void _enableLogin() {
    Preferences.writeBoolPref(Strings.IS_LOGIN_ENABLED, true);

    setState(() {
      _isLoginEnabled = true;
    });
  }

  Future<bool> _login() async {
    await Future.delayed(Duration(seconds: 3));
    await Preferences.writeBoolPrefs(
        {Strings.IS_LOGGED_IN: true, Strings.IS_LOGIN_ENABLED: true});

    return true;
  }

  void _logout() async {
    await Preferences.writeBoolPrefs(
        {Strings.IS_LOGGED_IN: false, Strings.IS_LOGIN_ENABLED: false});

    setState(() {
      _isLoginEnabled = false;
      _isLoggedIn = false;
    });
  }
}
