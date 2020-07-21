import 'city.dart';
import 'program.dart';
import 'visit.dart';

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
  final List<Visit> visits;
  final List<User> family;

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
    this.visits,
    this.family,
  });

  @override
  bool operator ==(other) {
    return this.firstName == (other as User).firstName &&
        this.lastName == (other as User).lastName &&
        this.middleName == (other as User).middleName &&
        this.birthDay == (other as User).birthDay &&
        this.phoneNumber == (other as User).phoneNumber &&
        this.email == (other as User).email &&
        this.program == (other as User).program;
  }
}
