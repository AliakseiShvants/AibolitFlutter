import 'package:json_annotation/json_annotation.dart';

part 'drug_autocomplete.g.dart';

@JsonSerializable()
class DrugAutocomplete {
  @JsonKey(name: 'ls_name')
  final String name;

  DrugAutocomplete({this.name});

  factory DrugAutocomplete.fromJson(Map<String, dynamic> json) => _$DrugAutocompleteFromJson(json);

  Map<String, dynamic> toJson() => _$DrugAutocompleteToJson(this);
}