import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AppIcons {
  static final Map<String, Widget> bottomNavIcons = {
    "Home" : Icon(AntDesign.home),
    "Medical center" : Icon(FontAwesome5Regular.hospital),
    "Medicament" : Icon(Fontisto.pills),
    "Card" : Icon(Foundation.clipboard_notes),
    "Other" : Transform.rotate(angle: 3.14, child: Icon(AntDesign.bars))
  };
}
