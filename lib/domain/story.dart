import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';
import 'package:trello2miro/domain/category.dart';
import 'package:trello2miro/domain/fcc.dart';
import 'package:trello2miro/domain/tag.dart';

class Story with EquatableMixin {
  final StoryId id;
  final CategoryId categoryId;
  final StoryContent content;
  final Optional<StoryPoint> point;
  final Tags tags;

  Story(this.id, this.categoryId, this.content, this.point, this.tags);

  @override
  List<Object> get props => [id, categoryId, content, point, tags];
}

class StoryId with EquatableMixin {
  final String value;

  StoryId(this.value);

  @override
  List<Object> get props => [value];
}

class StoryContent with EquatableMixin {
  final String value;

  StoryContent(this.value);

  @override
  List<Object> get props => [value];
}

class StoryPoint with EquatableMixin {
  final double value;

  StoryPoint(this.value);

  @override
  List<Object> get props => [value];
}

class Stories extends FCC<Story> with EquatableMixin {
  @override
  final List<Story> list;

  Stories(this.list);

  Stories findByCategoryId(CategoryId categoryId) =>
      Stories(where((e) => e.categoryId == categoryId).toList());

  @override
  List<Object> get props => [list];
}
