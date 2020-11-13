// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$FolderFromJson(Map<String, dynamic> json) {
  return Data(
    type: json['meta']['type'] as String,
    url: json['meta']['url'] as String,
    name: json['meta']['name'] as String,
    data: json['data'] as Map,);
}

Map<String, dynamic> _$FolderToJson(Data instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
  'data': instance.data,
  'name': instance.name,
};