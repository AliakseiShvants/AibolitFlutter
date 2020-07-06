import 'package:flutter/widgets.dart';

import '../widget/screens/card_screen.dart';
import '../widget/screens/home_screen.dart';
import '../widget/screens/medical_center_screen.dart';
import '../widget/screens/medicament_screen.dart';
import '../widget/screens/settings_screen.dart';

class AppWidgets {
  static final List<Widget> bottomNavWidgets = [
    HomeScreen(),
    MedicalCenterScreen(),
    MedicamentScreen(),
    CardScreen(),
    SettingsScreen()
  ];
}
