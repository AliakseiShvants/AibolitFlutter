import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Clinic {
  final String logo;
  final String title;

  @JsonKey(name: 'USR_ADR')
  final String address;

  @JsonKey(name: 'TOWN_NAME')
  final String town;

  @JsonKey(name: 'GEO_X')
  final String x;

  @JsonKey(name: 'GEO_Y')
  final String y;

  Clinic({
    this.logo,
    this.title,
    this.address,
    this.town,
    this.x,
    this.y,
  });
}
