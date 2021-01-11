import 'dart:io';

import 'package:args/args.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:trello2miro/domain/board_id.dart';
import 'package:trello2miro/usecase/migration_usecase.dart';

import 'main.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

Future<void> main(List<String> args) async {
  configureDependencies();

  var parser = ArgParser()
    ..addOption('inputJson', abbr: 'i')
    ..addOption('outputBoard', abbr: 'o');

  var results = parser.parse(args);
  var inputJson = File(results['inputJson']);
  var outputBoard = BoardId(results['outputBoard']);

  var useCase = getIt.get<MigrationUseCase>();
  await useCase.execute(inputJson, outputBoard);
}
