import 'package:AibolitFlutter/entity/visit.dart';
import 'package:intl/intl.dart';

import 'data.dart';

class Util {
  static bool isFuture(DateTime date) => date.isAfter(DateTime.now());

  static bool isToday(DateTime date) =>
      DateTime.now().year == date.year &&
      DateTime.now().month == date.month &&
      DateTime.now().day == date.day;

  static List<Visit> getFutureVisits() {
    var list = Data.visits;
    list.retainWhere(
        (element) => element.owner == Data.owner && isFuture(element.date));

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

  static double getLogoOpacity(Visit visit) {
    return Data.programToDoctors[visit.owner.program].contains(visit.doctor)
        ? 1
        : 0;
  }
}
