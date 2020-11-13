import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'url')
  final String url;
@JsonKey(name: 'data')
  final Map data;
  
  Data({this.type, this.url, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}