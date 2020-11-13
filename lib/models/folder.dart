import 'package:json_annotation/json_annotation.dart';

part 'folder.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'name')
  final String name;
@JsonKey(name: 'data')
  final Map data;
  
  Data({this.type, this.url, this.name, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
  Map<String, dynamic> toJson() => _$FolderToJson(this);
}