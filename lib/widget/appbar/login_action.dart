import 'dart:async';

import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class LoginAction extends StatefulWidget {
//  const LoginAction({@required this.onPress, Key key}) : super(key: key);

  @override
  _LoginActionState createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoggedIn = false;
  bool _loginFlag = false;

  void _enableFlag() {
    setState(() {
      _loginFlag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stubImg = AssetImage('assets/img/user_avatar.png');
    final avatar = AssetImage('assets/img/family.jpg');

    return FutureBuilder<bool>(
      future: _loginFlag ? _login() : null,
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
              callback = () => setState(() {
                    _loginFlag = true;
                  });

              break;
            }
          case ConnectionState.waiting:
            {
              child = CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.red,
                backgroundImage: stubImg,
              );
              var stack = Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  child,
                  CircularProgressIndicator(
//                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              );

              child = stack;

              break;
            }
          case ConnectionState.done:
            {
              child = CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.green,
                backgroundImage: avatar,
              );
              callback = () => Navigator.pushNamed(context, '/account');

              break;
            }
        }

        return MaterialButton(
          child: child,
          onPressed: callback,
        );
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return MaterialButton(
            child: Stack(
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage('assets/img/user_avatar.png'),
                ),
              ],
            ),
            onPressed: null,
          );
        } else
        /*if (snapshot.connectionState == ConnectionState.done)*/ {
          return MaterialButton(
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: AppColors.PRIMARY_COLOR,
              backgroundImage: AssetImage(
                  'assets/img/family.jpg') /*Icon(Icons.account_circle)*/,
            ),
            onPressed: () => Navigator.pushNamed(context, '/account'),
          );
        }
      },
    );
  }

  Future<bool> _login() => Future.delayed(Duration(seconds: 3), () => true);
}
