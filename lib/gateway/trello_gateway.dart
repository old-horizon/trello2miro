import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';
import 'package:trello2miro/domain/category.dart';
import 'package:trello2miro/domain/lane.dart';
import 'package:trello2miro/domain/story.dart';
import 'package:trello2miro/domain/tag.dart';
import 'package:trello2miro/driver/json/trello.dart';
import 'package:trello2miro/driver/trello.dart';
import 'package:trello2miro/port/trello_port.dart';

@Singleton(as: TrelloPort)
class TrelloGateway implements TrelloPort {
  final Trello _trello;

  TrelloGateway(this._trello);

  @override
  Lanes getLanes(File file) {
    var boardJson = _trello.fromFile(file);
    var categories = _getActiveCategories(boardJson);
    var stories = _getActiveStories(boardJson);
    return Lanes(categories
        .map((c) => Lane(c, stories.findByCategoryId(c.id)))
        .toList());
  }

  Categories _getActiveCategories(BoardJson boardJson) => 
      Categories(boardJson.lists.where((e) => !e.closed)
        .map((e) => e.toCategory())
        .toList());
  
  Stories _getActiveStories(BoardJson boardJson) =>
      Stories(boardJson.cards.where((e) => !e.closed)
          .map((e) => e.toStory())
          .toList());
}

extension on ListJson {
  Category toCategory() => Category(CategoryId(id), CategoryName(name));
}

extension on CardJson {
  Story toStory() => Story(StoryId(id), CategoryId(idList), StoryContent(name),
      Optional.ofNullable(agileTools).map((v) => v.toStoryPoint()), 
      Tags(labels.map((e) => e.toTag()).toList()));
}

extension on AgileToolsJson {
  StoryPoint toStoryPoint() => StoryPoint(points);
}

extension on LabelJson {
  Tag toTag() => Tag(name);
}
