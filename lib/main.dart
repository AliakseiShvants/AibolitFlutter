import 'package:AibolitFlutter/widget/search/service/service_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/themes.dart';
import 'widget/appbar/account/account_screen.dart';
import 'widget/appbar/account/family/family_screen.dart';
import 'widget/appbar/account/notification/notification_screen.dart';
import 'widget/appbar/account/program/program_screen.dart';
import 'widget/appbar/login/login_screen.dart';
import 'widget/clinics/clinic/clinic_item_screen.dart';
import 'widget/search/doctor/advanced_doctor_search_screen.dart';
import 'widget/search/doctor/doctor_search_screen.dart';
import 'widget/util/main_container.dart';

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
        '/clinic': (context) => ClinicItemScreen(),
        '/login': (context) => LoginScreen(),
        '/search/doctor' : (context) => DoctorSearchScreen(),
        '/search/doctor/advanced' : (context) => AdvancedSearchDoctorScreen(),
        '/search/service' : (context) => ServiceSearchScreen(),
        '/search/pills' : (context) => ServiceSearchScreen(),
      },
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', 'RU'),
      ],
      theme: Themes.appTheme,
    );
  }
}
