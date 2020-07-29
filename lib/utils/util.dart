import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/entity/visit.dart';
import 'package:AibolitFlutter/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_widgets.dart';
import 'data.dart';

class Util {
  static bool isFuture(DateTime date) => date.isAfter(DateTime.now());

  static bool isToday(DateTime date) =>
      DateTime.now().year == date.year &&
      DateTime.now().month == date.month &&
      DateTime.now().day == date.day;

  static List<Visit> getFutureVisits() {
    var list = Data.visits;
    list.retainWhere((element) => isFuture(element.date));

    return list;
  }

  static String getVisitTitle(DateTime date, String speciality) {
    final visitTime = DateFormat('HH:mm').format(date);
    var result = 'Визит';

    if (Util.isToday(date)) {
      result = 'Сегодня - $visitTime';
    } else if (Util.isFuture(date)) {
      result = DateFormat('dd MMMM - HH:mm').format(date);
    } else {
      result += ': $speciality';
    }

    return result;
  }

  static double getLogoOpacity(Visit visit) =>
      Data.programToDoctors[visit.owner.program].contains(visit.doctor) ? 1 : 0;

  static double getLogoOpacityByClinic(Clinic clinic) =>
      Data.epamClinics.contains(clinic) ? 1 : 0;

  static openBrowser(String url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    }
  }

  static String getFullName(User user) {
    var middle = user.middleName != null ? user.middleName : '';

    return '${user.lastName} ${user.firstName} $middle';
  }

  static String getBirthDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static void showModalBottom({
    BuildContext context,
    String title,
    int currentIndex,
    List<String> list,
    bool isClose = false,
    Function callback,
  }) =>
      showModalBottomSheet(
        context: context,
        builder: (context) => AppWidgets.getActionsModal(
          context: context,
          title: title,
          currentIndex: currentIndex,
          list: list,
          isClose: isClose,
          callback: callback,
        ),
      );

}
