import 'package:equatable/equatable.dart';
import 'package:trello2miro/domain/fcc.dart';

class Category with EquatableMixin {
  final CategoryId id;
  final CategoryName name;

  Category(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}

class CategoryId with EquatableMixin {
  final String value;

  CategoryId(this.value);

  @override
  List<Object> get props => [value];
}

class CategoryName with EquatableMixin {
  final String value;

  CategoryName(this.value);

  @override
  List<Object> get props => [value];
}

class Categories extends FCC<Category> with EquatableMixin {
  @override
  final List<Category> list;

  Categories(this.list);

  @override
  List<Object> get props => [list];
}
