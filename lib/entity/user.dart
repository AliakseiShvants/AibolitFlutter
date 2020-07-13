import 'package:flutter/widgets.dart';

import 'city.dart';
import 'program.dart';

class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDay;
  final String phoneNumber;
  final String email;
  final Program program;
  final String avatar;
  final City city;

  User({
    this.firstName,
    this.middleName,
    this.lastName,
    this.birthDay,
    this.phoneNumber,
    this.email,
    this.program,
    this.avatar,
    this.city,
  });

  @override
  bool operator ==(other) {
    return this.firstName == (other as User).firstName &&
        this.lastName == (other as User).lastName &&
        this.middleName == (other as User).middleName &&
        this.birthDay == (other as User).birthDay &&
        this.phoneNumber == (other as User).phoneNumber &&
        this.email == (other as User).email &&
        this.program == (other as User).program &&
        this.avatar == (other as User).avatar &&
        this.city == (other as User).city;
  }
}
