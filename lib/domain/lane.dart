import 'package:equatable/equatable.dart';
import 'package:trello2miro/domain/category.dart';
import 'package:trello2miro/domain/fcc.dart';
import 'package:trello2miro/domain/story.dart';

class Lane with EquatableMixin {
  final Category category;
  final Stories stories;

  Lane(this.category, this.stories);

  @override
  List<Object> get props => [category, stories];
}

class Lanes extends FCC<Lane> with EquatableMixin {
  @override
  List<Lane> list;

  Lanes(this.list);

  @override
  List<Object> get props => [list];
}
