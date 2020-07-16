import 'file:///C:/Users/Aliaksei_Shvants/projects/AibolitFlutter/lib/widget/appbar/account/family/family_screen.dart';
import 'package:AibolitFlutter/widget/appbar/account/notification/notification_screen.dart';
import 'package:AibolitFlutter/widget/appbar/account/program/program_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'widget/appbar/account/account_screen.dart';
import 'widget/appbar/login/login_screen.dart';
import 'widget/container/main_container.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(Themes.systemUiOverlayStyle);

  runApp(AibolitApp());
}

class AibolitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.appTheme,
      routes: {
        '/account' : (context) => AccountScreen(),
        '/login' : (context) => LoginScreen(),
        '/account/family' : (context) => FamilyScreen(),
        '/account/program' : (context) => ProgramScreen(),
        '/account/notification' : (context) => NotificationScreen(),
      },
      home: MainContainer(),
    );
  }
}