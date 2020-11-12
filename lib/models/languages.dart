import 'package:json_annotation/json_annotation.dart';

part 'languages.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'url')
  final String url;
@JsonKey(name: 'data')
  final Map data;
  
  Data({this.type, this.url, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}