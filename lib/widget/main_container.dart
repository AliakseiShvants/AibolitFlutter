import 'package:flutter/material.dart';

import '../utils/strings.dart';
import 'appbar/location.dart';
import 'login_action.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8.0,
        title: Location(),
        actions: <Widget>[
          LoginAction(),
        ],
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
        ),
      ),
    );
  }
}
