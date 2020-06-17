import 'package:flutter/material.dart';
import 'appbar/adaptive_appbar.dart';

import '../utils/strings.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  bool _isLoggedIn = false;

  void _login() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        height: 56,
        isLoggedIn: _isLoggedIn,
        loginCallback: _login,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            Text('Some text', style: TextStyle(fontSize: 26)),
            Text('Some text', style: TextStyle(fontSize: 24)),
            Text('Some text', style: TextStyle(fontSize: 22)),
            Text('Some text', style: TextStyle(fontSize: 20)),
            Text('Some text', style: TextStyle(fontSize: 18)),
            Text('Some text', style: TextStyle(fontSize: 16)),
            Text('Some text', style: TextStyle(fontSize: 14)),
            Text('Some text', style: TextStyle(fontSize: 12)),
            Text('Some text', style: TextStyle(fontSize: 10)),
          ],
        ),
      )),
    );
  }
}
