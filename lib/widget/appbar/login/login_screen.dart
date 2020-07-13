import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

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

  var _phonePrefixController = TextEditingController(text: '+ 375');
  var _phoneNumberController = MaskedTextController(
    mask: '(00) 000 00 00',
  );

  bool _isLoginEnable = false;
  bool _isLoginButtonEnabled = false;

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
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _phonePrefixController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: _phonePrefixController.text
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '(__) ___ __ __',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  disabledColor: AppColors.grey500,
                  color:  AppColors.green,
                  child: Text(
                    'Продолжить'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _isLoginButtonEnabled ? callback : null,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    _phoneNumberController.addListener(() {_validate();});

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Container(
                    color: AppColors.primaryGrey.withOpacity(0.8),
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

  void _validate() {
    if (_phoneNumberController.text.length == 14) {
      setState(() {
        _isLoginButtonEnabled = true;
      });
    }
  }
}
