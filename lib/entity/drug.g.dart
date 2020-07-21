// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) {
  return Drug(
    id: json['ls_num'] as String,
    title: json['ls_name'] as String,
    form: json['tar_name'] as String,
    firm: json['firm_name'] as String,
    country: json['country_name'] as String,
    rx: json['otc_rx'] as String,
    name: json['nlec_name'] as String,
    minPrice: json['price_min'] as String,
    maxPrice: json['price_max'] as String,
    cnt: json['apt_cnt'] as String,
  );
}

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'ls_num': instance.id,
      'ls_name': instance.title,
      'tar_name': instance.form,
      'firm_name': instance.firm,
      'country_name': instance.country,
      'otc_rx': instance.rx,
      'nlec_name': instance.name,
      'price_min': instance.minPrice,
      'price_max': instance.maxPrice,
      'apt_cnt': instance.cnt,
    };
