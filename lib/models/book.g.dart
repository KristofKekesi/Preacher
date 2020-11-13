// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$BookFromJson(Map<String, dynamic> json) {
  return Data(
    type: json['type'] as String,
    url: json['url'] as String,
    data: json['data'] as Map,);
}

Map<String, dynamic> _$BookToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
  'data': instance.data,
};