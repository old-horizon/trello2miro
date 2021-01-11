// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:trello2miro/usecase/migration_usecase.dart';
import 'package:trello2miro/driver/miro.dart';
import 'package:trello2miro/gateway/miro_gateway.dart';
import 'package:trello2miro/port/miro_port.dart';
import 'package:trello2miro/register_module.dart';
import 'package:trello2miro/driver/trello.dart';
import 'package:trello2miro/gateway/trello_gateway.dart';
import 'package:trello2miro/port/trello_port.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();

  // Eager singletons must be registered in the right order
  gh.singleton<Client>(registerModule.client);
  gh.singleton<Miro>(Miro(get<Client>()));
  gh.singleton<MiroPort>(MiroGateway(get<Miro>()));
  gh.singleton<Trello>(Trello());
  gh.singleton<TrelloPort>(TrelloGateway(get<Trello>()));
  gh.singleton<MigrationUseCase>(
      MigrationUseCase(get<TrelloPort>(), get<MiroPort>()));
  return get;
}

class _$RegisterModule extends RegisterModule {}
