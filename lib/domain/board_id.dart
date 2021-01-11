import 'package:equatable/equatable.dart';

class BoardId with EquatableMixin {
  final String value;

  BoardId(this.value);

  @override
  List<Object> get props => [value];
}