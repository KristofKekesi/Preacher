import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'portrait')
  final String portrait;
  @JsonKey(name: 'landscape')
  final String landscape;
  @JsonKey(name: 'hidden')
  final String hidden;
  @JsonKey(name: 'finished')
  final String finished;
  @JsonKey(name: 'exclusive')
  final String exclusive;
  @JsonKey(name: 'data')
  final Map data;

  Data({this.type, this.url, this.name, this.portrait, this.landscape, this.hidden, this.finished, this.exclusive, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
