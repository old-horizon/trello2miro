import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  Client get client => Client();
}
