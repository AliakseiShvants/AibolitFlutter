import 'package:json_annotation/json_annotation.dart';

part 'drug.g.dart';

@JsonSerializable()
class Drug {
  @JsonKey(name: 'ls_num')
  final String id;

  @JsonKey(name: 'ls_name')
  final String title;

  @JsonKey(name: 'tar_name')
  final String form;

  @JsonKey(name: 'firm_name')
  final String firm;

  @JsonKey(name: 'country_name')
  final String country;

  @JsonKey(name: 'otc_rx')
  final String rx;

  @JsonKey(name: 'nlec_name')
  final String name;

  @JsonKey(name: 'price_min')
  final String minPrice;

  @JsonKey(name: 'price_max')
  final String maxPrice;

  @JsonKey(name: 'apt_cnt')
  final String cnt;

  Drug({
    this.id,
    this.title,
    this.form,
    this.firm,
    this.country,
    this.rx,
    this.name,
    this.minPrice,
    this.maxPrice,
    this.cnt,
  });

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Map<String, dynamic> toJson() => _$DrugToJson(this);
}
