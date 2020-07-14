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
//      initialRoute: '/',
      routes: {
        '/account' : (context) => AccountScreen(),
        '/login' : (context) => LoginScreen(),
      },
      home: MainContainer(),
    );
  }
}