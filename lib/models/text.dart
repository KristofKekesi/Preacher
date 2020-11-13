import 'package:json_annotation/json_annotation.dart';

part 'text.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'name')
  final String name;
@JsonKey(name: 'data')
  final Map data;
  
  Data({this.type, this.name, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
  Map<String, dynamic> toJson() => _$TextToJson(this);
}