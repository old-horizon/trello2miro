import 'package:json_annotation/json_annotation.dart';

part 'miro.g.dart';

@JsonSerializable()
class CreateStickerJson {
  final String type;
  final num x;
  final num y;
  final String text;

  CreateStickerJson(this.type, this.x, this.y, this.text);

  Map<String, dynamic> toJson() => _$CreateStickerJsonToJson(this);
}

@JsonSerializable()
class CreateTextJson {
  final String type;
  final num x;
  final num y;
  final StyleJson style;
  final String text;

  CreateTextJson(this.type, this.x, this.y, this.style, this.text);

  Map<String, dynamic> toJson() => _$CreateTextJsonToJson(this);
}

@JsonSerializable()
class StyleJson {
  final num fontSize;
  final String textAlign;

  StyleJson(this.fontSize, this.textAlign);

  factory StyleJson.fromJson(Map<String, dynamic> json) =>
      _$StyleJsonFromJson(json);

  Map<String, dynamic> toJson() => _$StyleJsonToJson(this);
}
