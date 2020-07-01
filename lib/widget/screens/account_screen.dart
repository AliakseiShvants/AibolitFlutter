import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Учетная запись')),
      body: SafeArea(
        child: Center(
            child: GestureDetector(
          child: Text('Выйти'),
          onTap: () => _logout(context),
        )),
      ),
    );
  }

  void _logout(BuildContext context) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLoggedIn', false);

    Navigator.pop(context);
  }
}
