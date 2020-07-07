import 'package:AibolitFlutter/entity/program.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDay;
  final String phoneNumber;
  final String email;
  final List<Program> programs;

  User({
    @required this.firstName,
    this.middleName,
    @required this.lastName,
    this.birthDay,
    this.phoneNumber,
    this.email,
    this.programs
  });
}
