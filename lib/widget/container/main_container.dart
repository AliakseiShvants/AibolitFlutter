import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_widgets.dart';
import '../../utils/borders.dart';
import '../appbar/location.dart';
import '../appbar/login_action.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedItem = 0;
  int _locationIndex = 0;
  bool _isLoggedIn = false;
  User _user = Data.guest;

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _locationIndex = prefs.getInt(Strings.LOCATION_INDEX) ?? 0;
    _isLoggedIn = prefs.getBool(Strings.IS_LOGGED_IN) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Location(
          _locationIndex,
          Data.cities,
          _setLocation,
        ),
        actions: <Widget>[
          LoginAction(
            _user,
            _isLoggedIn,
            true,
            _login,
            _logout,
          ),
        ],
      ),
      body: SafeArea(
        child: AppWidgets.bottomNavWidgets[_selectedItem],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: Borders.primaryGreyBorderSide,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedItem,
          iconSize: 32,
          items: List.generate(
            AppIcons.bottomNavIcons.length,
            (index) {
              final String key = AppIcons.bottomNavIcons.keys.elementAt(index);
              final Widget value =
                  AppIcons.bottomNavIcons.values.elementAt(index);

              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: value,
                ),
                title: Text(key),
              );
            },
          ),
          onTap: _onMenuItemClick,
          selectedFontSize: 8,
          selectedItemColor: AppColors.PRIMARY_COLOR,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 8,
          unselectedItemColor: AppColors.primaryGrey,
        ),
      ),
    );
  }

  void _onMenuItemClick(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  void _login() {
    Navigator.pushNamed(context, '/login').then((value) async {
      if (value) {
        await Preferences.writeBoolPref(Strings.IS_LOGGED_IN, true);
        await Preferences.writeIntPref(
            Strings.LOCATION_INDEX, Data.cities.indexOf(Data.owner.city));

        setState(() {
          _user = Data.owner;
          _locationIndex = Data.cities.indexOf(_user.city);
          _isLoggedIn = true;
        });
      }
    });
  }

  void _logout() {
    Navigator.pushNamed(context, '/account').then((value) {
      if (value) {
        setState(() {
          _user = Data.guest;
          _locationIndex = 0;
          _isLoggedIn = false;
        });
      }
    });
  }

  void _setLocation(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Strings.LOCATION_INDEX, index);

    setState(() {
      _locationIndex = index;
    });
  }
}
