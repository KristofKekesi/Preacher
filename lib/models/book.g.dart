// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$BookFromJson(Map<String, dynamic> json) {
  return Data(
    type: json['meta']['type'] as String,
    url: json['meta']['url'] as String,
    name: json['meta']['name'] as String,
    portrait: json['meta']['portrait'] as String,
    landscape: json['meta']['landscape'] as String,
    hidden: json['meta']['hidden'] as String,
    finished: json['meta']['finished'] as String,
    exclusive: json['meta']['exclusive'] as String,
    data: json['data'] as Map,);
}

Map<String, dynamic> _$BookToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
  'name': instance.name,
  'portrait': instance.portrait,
  'landscape': instance.landscape,
  'hidden': instance.hidden,
  'finished': instance.finished,
  'exclusive': instance.exclusive,
  'data': instance.data,
};