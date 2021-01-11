import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:optional/optional.dart';

part 'trello.g.dart';

const pluginId = '59d4ef8cfea15a55b0086614';

@JsonSerializable()
class BoardJson {
  final List<CardJson> cards;
  final List<ListJson> lists;

  BoardJson(this.cards, this.lists);

  factory BoardJson.fromJson(Map<String, dynamic> json) =>
      _$BoardJsonFromJson(json);
}

@JsonSerializable()
class ListJson {
  final String id;
  final String name;
  final bool closed;

  ListJson(this.id, this.name, this.closed);

  factory ListJson.fromJson(Map<String, dynamic> json) =>
      _$ListJsonFromJson(json);
}

@JsonSerializable()
class CardJson {
  final String id;
  final bool closed;
  final String idList;
  final String name;
  final List<LabelJson> labels;
  @JsonKey(name: 'pluginData', fromJson: _parsePluginData)
  final AgileToolsJson agileTools;

  CardJson(this.id, this.closed, this.idList, this.name, this.labels,
      this.agileTools);

  factory CardJson.fromJson(Map<String, dynamic> json) =>
      _$CardJsonFromJson(json);
}

@JsonSerializable()
class LabelJson {
  final String id;
  final String name;

  LabelJson(this.id, this.name);

  factory LabelJson.fromJson(Map<String, dynamic> json) =>
      _$LabelJsonFromJson(json);
}

@JsonSerializable()
class PluginDataJson {
  final String id;
  final String idPlugin;
  final String value;

  PluginDataJson(this.id, this.idPlugin, this.value);

  factory PluginDataJson.fromJson(Map<String, dynamic> json) =>
      _$PluginDataJsonFromJson(json);
}

@JsonSerializable()
class AgileToolsJson {
  final double points;

  AgileToolsJson(this.points);

  factory AgileToolsJson.fromJson(Map<String, dynamic> json) =>
      _$AgileToolsJsonFromJson(json);
}

AgileToolsJson _parsePluginData(List<dynamic> list) => Optional.ofNullable(list
      .firstWhere((e) => e['idPlugin'] == pluginId, orElse: () => null))
    .map((v) => AgileToolsJson.fromJson(jsonDecode(v['value']))).orElse(null);
