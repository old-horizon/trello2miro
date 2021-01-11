import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:trello2miro/driver/json/trello.dart';

@singleton
class Trello {
  BoardJson fromFile(File file) => 
      BoardJson.fromJson(jsonDecode(file.readAsStringSync()));
}
