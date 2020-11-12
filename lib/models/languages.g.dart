// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$EmployeesFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['type'] as String,
    name: json['url'] as String,
    src: json['data'] as Map,);
}

Map<String, dynamic> _$EmployeesToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
  'data': instance.data,
};