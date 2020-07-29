import 'package:AibolitFlutter/entity/clinic.dart';

class Doctor {
  final String avatar;
  final String firstName;
  final String middleName;
  final String lastName;
  final String specialityLong;
  final String speciality;
  final List<String> profiles;
  final List<Clinic> centers;

  Doctor({this.firstName, this.lastName, this.middleName, this.speciality,
      this.specialityLong, this.profiles, this.centers, this.avatar,});
}
