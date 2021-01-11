import 'dart:io';

import 'package:trello2miro/domain/lane.dart';

abstract class TrelloPort {
  Lanes getLanes(File file);
}
