import 'package:flutter/widgets.dart';

import '../widget/visitcard/visit_card_screen.dart';
import '../widget/home/home_screen.dart';
import '../widget/medcenters/medical_center_screen.dart';
import '../widget/pills/medicament_screen.dart';
import '../widget/settings/settings_screen.dart';

class AppWidgets {
  static final List<Widget> bottomNavWidgets = [
    HomeScreen(),
    MedicalCenterScreen(),
    MedicamentScreen(),
    VisitCardScreen(),
    SettingsScreen()
  ];
}
