import 'package:trello2miro/domain/fcc.dart';

class Tag {
  final String value;

  Tag(this.value);
}

class Tags extends FCC<Tag> {
  @override
  final List<Tag> list;

  Tags(this.list);
}