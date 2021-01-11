import 'package:trello2miro/domain/board_id.dart';
import 'package:trello2miro/domain/lane.dart';

abstract class MiroPort {
  Future<void> createLanes(BoardId id, Lanes lanes);
}
