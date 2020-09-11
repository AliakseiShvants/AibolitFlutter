import 'package:AibolitFlutter/entity/city.dart';
import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/utils/data.dart';
import 'package:AibolitFlutter/utils/network.dart';
import 'package:AibolitFlutter/utils/preferences.dart';
import 'package:AibolitFlutter/utils/strings.dart';
import 'package:AibolitFlutter/widget/util/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_widgets.dart';
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
  String _serverVersion;

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _locationIndex = prefs.getInt(Strings.LOCATION_INDEX) ?? 0;
    _isLoggedIn = prefs.getBool(Strings.IS_LOGGED_IN) ?? false;
    _serverVersion = await Network.getServerVersion();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainerInherited(
      serverVersion: _serverVersion,
      bottomNavBarItem: _selectedItem,
      bottomNavBarCallback: _onMenuItemClick,
      isLoggedIn: _isLoggedIn,
      locationIndex: _locationIndex,
      locationCallback: _setLocation,
      user: _user,
      isNeedToRefresh: true,
      loginCallback: _login,
      logoutCallback: _logout,
      child: Scaffold(
        appBar: AppWidgets.getAppBar(
          automaticallyImplyLeading: true,
          title: Location(
            locationIndex: _locationIndex,
            cities: Data.cities,
            locationCallback: _setLocation,
          ),
          actions: <Widget>[
            LoginAction(
              user: _user,
              isLoggedIn: _isLoggedIn,
              isNeedToRefresh: true,
              loginCallback: _login,
              logoutCallback: _logout,
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: AppWidgets.bottomNavWidgets[_selectedItem],
        ),
        bottomNavigationBar: BottomNavBar(),
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

class MainContainerInherited extends InheritedWidget {
  static MainContainerInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainContainerInherited>();
  }

  final AppBar appBar;
  final String serverVersion;
  final int bottomNavBarItem;
  final Function bottomNavBarCallback;
  final bool isLoggedIn;
  final int locationIndex;
  final Function locationCallback;
  final User user;
  final bool isNeedToRefresh;
  final Function loginCallback;
  final Function logoutCallback;
  final Widget child;

  MainContainerInherited({
    this.appBar,
    this.serverVersion,
    this.bottomNavBarItem,
    this.bottomNavBarCallback,
    this.isLoggedIn,
    this.locationIndex,
    this.locationCallback,
    this.user,
    this.isNeedToRefresh,
    this.loginCallback,
    this.logoutCallback,
    this.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
