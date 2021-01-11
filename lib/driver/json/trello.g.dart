// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trello.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardJson _$BoardJsonFromJson(Map<String, dynamic> json) {
  return BoardJson(
    (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardJson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['lists'] as List)
        ?.map((e) =>
            e == null ? null : ListJson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BoardJsonToJson(BoardJson instance) => <String, dynamic>{
      'cards': instance.cards,
      'lists': instance.lists,
    };

ListJson _$ListJsonFromJson(Map<String, dynamic> json) {
  return ListJson(
    json['id'] as String,
    json['name'] as String,
    json['closed'] as bool,
  );
}

Map<String, dynamic> _$ListJsonToJson(ListJson instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'closed': instance.closed,
    };

CardJson _$CardJsonFromJson(Map<String, dynamic> json) {
  return CardJson(
    json['id'] as String,
    json['closed'] as bool,
    json['idList'] as String,
    json['name'] as String,
    (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : LabelJson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    _parsePluginData(json['pluginData'] as List),
  );
}

Map<String, dynamic> _$CardJsonToJson(CardJson instance) => <String, dynamic>{
      'id': instance.id,
      'closed': instance.closed,
      'idList': instance.idList,
      'name': instance.name,
      'labels': instance.labels,
      'pluginData': instance.agileTools,
    };

LabelJson _$LabelJsonFromJson(Map<String, dynamic> json) {
  return LabelJson(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$LabelJsonToJson(LabelJson instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PluginDataJson _$PluginDataJsonFromJson(Map<String, dynamic> json) {
  return PluginDataJson(
    json['id'] as String,
    json['idPlugin'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$PluginDataJsonToJson(PluginDataJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idPlugin': instance.idPlugin,
      'value': instance.value,
    };

AgileToolsJson _$AgileToolsJsonFromJson(Map<String, dynamic> json) {
  return AgileToolsJson(
    (json['points'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AgileToolsJsonToJson(AgileToolsJson instance) =>
    <String, dynamic>{
      'points': instance.points,
    };
