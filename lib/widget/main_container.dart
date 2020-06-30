import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/app_widgets.dart';
import '../utils/dimens.dart';
import 'appbar/location.dart';
import 'appbar/login_action.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedItem = 0;

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
        child: AppWidgets.bottomNavWidgets[_selectedItem],
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
