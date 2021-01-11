// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStickerJson _$CreateStickerJsonFromJson(Map<String, dynamic> json) {
  return CreateStickerJson(
    json['type'] as String,
    json['x'] as num,
    json['y'] as num,
    json['text'] as String,
  );
}

Map<String, dynamic> _$CreateStickerJsonToJson(CreateStickerJson instance) =>
    <String, dynamic>{
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'text': instance.text,
    };

CreateTextJson _$CreateTextJsonFromJson(Map<String, dynamic> json) {
  return CreateTextJson(
    json['type'] as String,
    json['x'] as num,
    json['y'] as num,
    json['style'] == null
        ? null
        : StyleJson.fromJson(json['style'] as Map<String, dynamic>),
    json['text'] as String,
  );
}

Map<String, dynamic> _$CreateTextJsonToJson(CreateTextJson instance) =>
    <String, dynamic>{
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'style': instance.style,
      'text': instance.text,
    };

StyleJson _$StyleJsonFromJson(Map<String, dynamic> json) {
  return StyleJson(
    json['fontSize'] as num,
    json['textAlign'] as String,
  );
}

Map<String, dynamic> _$StyleJsonToJson(StyleJson instance) => <String, dynamic>{
      'fontSize': instance.fontSize,
      'textAlign': instance.textAlign,
    };
