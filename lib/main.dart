import 'package:AibolitFlutter/widget/appbar/account/notification/notification_screen.dart';
import 'package:AibolitFlutter/widget/appbar/account/program/program_screen.dart';
import 'package:AibolitFlutter/widget/searchdoctor/doctor_search_screen.dart';
import 'package:AibolitFlutter/widget/util/single_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'utils/themes.dart';
import 'widget/appbar/account/account_screen.dart';
import 'widget/appbar/account/family/family_screen.dart';
import 'widget/appbar/login/login_screen.dart';
import 'widget/container/main_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(Themes.systemUiOverlayStyle);

  runApp(AibolitApp());
}

class AibolitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainContainer(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        '/account': (context) => AccountScreen(),
        '/account/family': (context) => FamilyScreen(),
        '/account/notification': (context) => NotificationScreen(),
        '/account/program': (context) => ProgramScreen(),
        '/clinic': (context) => SingleItemScreen(),
        '/login': (context) => LoginScreen(),
        '/search/doctor' : (context) => SearchDoctorScreen(),
      },
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', 'RU'),
      ],
      theme: Themes.appTheme,
    );
  }
}
