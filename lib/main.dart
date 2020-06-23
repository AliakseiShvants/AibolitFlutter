import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'widget/main_container.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(Themes.systemUiOverlayStyle);

  runApp(AibolitApp());
}

class AibolitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.appTheme,
      home: MainContainer(),
    );
  }
}