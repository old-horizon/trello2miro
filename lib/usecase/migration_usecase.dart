import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:trello2miro/domain/board_id.dart';
import 'package:trello2miro/port/miro_port.dart';
import 'package:trello2miro/port/trello_port.dart';

@singleton
class MigrationUseCase {
  final TrelloPort _trelloPort;
  final MiroPort _miroPort;

  MigrationUseCase(this._trelloPort, this._miroPort);

  Future<void> execute(File inputJson, BoardId boardId) async {
    var lanes = _trelloPort.getLanes(inputJson);
    await _miroPort.createLanes(boardId, lanes);
  }
}
