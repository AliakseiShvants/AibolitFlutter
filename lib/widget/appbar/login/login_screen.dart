import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static String _appBarTitle = 'Вход';
  static String _headerTitle = 'Введите свой номер телефона';
  static String _headerMsg = 'Активация производится с помощью SMS-сообщения,'
      'которое будет выслано на ваш номер. '
      'Убедитесь, что ваше устройство сможет его принять.';

  bool _isLoginEnable = false;

  void _enableLogin() {
    setState(() {
      _isLoginEnable = true;
    });
  }

  Widget _loginWidget({Function callback}) => Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            AppWidgets.getHeaderWithLogo(_headerTitle, _headerMsg),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: AppColors.grey500,
                child: Text(
                  'Продолжить'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: callback,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200,
      appBar: AppWidgets.getAppBar(context, _appBarTitle),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _isLoginEnable ? _login(context) : null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  _loginWidget(),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      color: AppColors.primaryGrey,
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              );
            } else {
              return _loginWidget(callback: _enableLogin);
            }
          },
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));
    await Preferences.writeBoolPrefs(
        {Strings.IS_LOGGED_IN: true, Strings.IS_LOGIN_ENABLED: true});

    Navigator.pop(context);
  }
}
