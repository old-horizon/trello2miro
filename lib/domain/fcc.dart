import 'dart:collection';

abstract class FCC<E> extends IterableBase<E> {
  List<E> get list;

  @override
  Iterator<E> get iterator => list.iterator;

  void forEachIndex(void Function(int index, E element) f) =>
      list.asMap().forEach(f);
}
