import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'widget/screen/account_screen.dart';
import 'widget/screen/main_screen.dart';

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
        '/' : (context) => MainScreen(),
        '/account' : (context) => AccountScreen()
      },
    );
  }
}