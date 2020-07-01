import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'widget/main_container.dart';
import 'widget/screens/account_screen.dart';

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
      },
      home: MainContainer(),
    );
  }
}