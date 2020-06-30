import '../../utils/dimens.dart';
import '../../utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAction extends StatefulWidget {
//  const LoginAction({@required this.onPress, Key key}) : super(key: key);

  @override
  _LoginActionState createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? MaterialButton(
            child: CircleAvatar(
              radius: Dimens.DOUBLE_PADDING,
              backgroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pushNamed('/account'),
          )
        : MaterialButton(
            child: Text(
              Strings.LOGIN,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: _onPressed,
          );
  }

  Future<void> _onPressed() async {
//    final SharedPreferences prefs = await _prefs;
//    prefs.setBool('isLoggedIn', _isLoggedIn);

    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
//    widget._onPress.call();
  }
}
