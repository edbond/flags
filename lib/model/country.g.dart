// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      capital: json['capital'] as String?,
      code: json['code'] as String,
      continent: json['continent'] as String?,
      flag1x1: json['flag_1x1'] as String,
      flag4x3: json['flag_4x3'] as String,
      name: json['name'] as String,
      iso: json['iso'] as bool,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      if (instance.capital case final value?) 'capital': value,
      'code': instance.code,
      if (instance.continent case final value?) 'continent': value,
      'flag_1x1': instance.flag1x1,
      'flag_4x3': instance.flag4x3,
      'name': instance.name,
      'iso': instance.iso,
    };
