import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../appbar/location.dart';
import '../appbar/login_action.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: Dimens.ONE_PADDING,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 24.0,
              padding: const EdgeInsets.all(0.0),
              icon: Icon(Icons.home),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.local_hospital),
              onPressed: () => Navigator.pushNamed(context, '/account'),
            ),
            title: Text('Hospital'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 24.0,
              icon: new SvgPicture.asset('assets/icons/pill.svg'),
              onPressed: () => Navigator.pushNamed(context, '/account'),
            ),
            title: Text('Pills'),
          ),
        ],
      ),
    );
  }
}
