import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Clinic {
  final String logo;
  final String title;

  @JsonKey(name: 'USR_ADR')
  final String address;

  @JsonKey(name: 'TOWN_NAME')
  final String town;

  Clinic({this.logo, this.title, this.address, this.town});
}