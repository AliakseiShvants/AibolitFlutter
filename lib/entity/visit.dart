import 'package:AibolitFlutter/entity/med_center.dart';
import 'package:AibolitFlutter/entity/user.dart';

import 'doctor.dart';

class Visit {
  final User owner;
  final DateTime date;
  final Doctor doctor;
  final MedCenter center;

  Visit({this.owner, this.center, this.date, this.doctor});
}