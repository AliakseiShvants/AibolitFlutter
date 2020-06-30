import 'package:AibolitFlutter/utils/app_colors.dart';
import 'package:AibolitFlutter/utils/app_icons.dart';
import 'package:AibolitFlutter/utils/dimens.dart';
import 'package:flutter/material.dart';

import '../appbar/location.dart';
import '../appbar/login_action.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  List<Widget> _temp = <Widget>[
    Text('Some text1', style: TextStyle(fontSize: 10)),
    Text('Some text2', style: TextStyle(fontSize: 24)),
    Text('Some text3', style: TextStyle(fontSize: 22)),
    Text('Some text4', style: TextStyle(fontSize: 20)),
    Text('Some text5', style: TextStyle(fontSize: 18)),
    Text('Some text', style: TextStyle(fontSize: 16)),
    Text('Some text', style: TextStyle(fontSize: 14)),
    Text('Some text', style: TextStyle(fontSize: 12)),
    Text('Some text', style: TextStyle(fontSize: 10)),
  ];

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
        child: Center(child: _temp.elementAt(_selectedItem)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        iconSize: 32,
        items: List.generate(AppIcons.bottomNavIcons.length, (index) {
          final String key = AppIcons.bottomNavIcons.keys.elementAt(index);
          final Widget value = AppIcons.bottomNavIcons.values.elementAt(index);

          return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: value,
            ),
            title: Text(key),
          );
        }),
        onTap: _onMenuItemClick,
        selectedFontSize: 8,
        selectedItemColor: AppColors.PRIMARY_COLOR,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 8,
        unselectedItemColor: AppColors.primaryGrey,
      ),
    );
  }

  void _onMenuItemClick(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
