import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AppIcons {
  static final Map<String, Widget> bottomNavIcons = {
    "Главная" : Icon(AntDesign.home),
    "Медцентры" : Icon(FontAwesome5Regular.hospital),
    "Лекарства" : Icon(Fontisto.pills),
    "Карточка" : Icon(Foundation.clipboard_notes),
    "Прочее" : Transform.rotate(angle: 3.14, child: Icon(AntDesign.bars))
  };
}
