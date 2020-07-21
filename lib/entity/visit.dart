import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/user.dart';

import 'doctor.dart';

class Visit {
  final User owner;
  final DateTime date;
  final Doctor doctor;
  final Clinic center;

  Visit({this.owner, this.center, this.date, this.doctor});
}