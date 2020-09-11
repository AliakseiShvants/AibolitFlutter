import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_widgets.dart';
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

  Widget _loginWidget({
    @required BuildContext context,
    @required Function callback,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: <Widget>[
            AppWidgets.getHeaderWithLogo(
              _headerTitle,
              _headerMsg,
              1,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _phonePrefixController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: _phonePrefixController.text,
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
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: AppWidgets.getMaterialButton(
                context: null,
                top: 16,
                title: 'Продолжить',
                disabledColor: AppColors.grey500,
                color: AppColors.green,
                callback: _isLoginButtonEnabled ? callback : null,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    _phoneNumberController.addListener(() {
      _validate();
    });

    return Scaffold(
      backgroundColor: AppColors.grey200,
      appBar: AppWidgets.getAppBar(
        context: context,
        title: Text(_appBarTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<void>(
            future: _isLoginEnable ? _login(context) : null,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _loginWidget(
                      context: context,
                      callback: null,
                    ),
                    Container(
                      color: AppColors.primaryGrey.withOpacity(0.8),
                    ),
                    CircularProgressIndicator(),
                  ],
                );
              } else {
                return _loginWidget(
                  context: context,
                  callback: _enableLogin,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pop(context, true);
  }

  void _validate() {
    if (_phoneNumberController.text.length == 14) {
      setState(() {
        _isLoginButtonEnabled = true;
      });
    }
  }
}
