// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$TextFromJson(Map<String, dynamic> json) {
  return Data(
    type: json['meta']['type'] as String,
    name: json['meta']['name'] as String,
    data: json['data'] as Map,);
}

Map<String, dynamic> _$TextToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'name': instance.name,
  'data': instance.data,
};