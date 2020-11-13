// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$LanguageFromJson(Map<String, dynamic> json) {
  return Data(
    type: json['type'] as String,
    url: json['url'] as String,
    data: json['data'] as Map,);
}

Map<String, dynamic> _$LanguageToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
  'data': instance.data,
};