import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';
import 'package:trello2miro/driver/json/miro.dart';

const _baseUrl = 'https://api.miro.com';
final _accessToken = Platform.environment['MIRO_ACCESS_TOKEN'];

@singleton
class Miro {
  final Client _client;

  Miro(this._client);

  Future<void> createSticker(
      String boardId, num x, num y, String text) async {
    var body = CreateStickerJson('sticker', x, y, text);
    await _retry(() => _client.post('${_baseUrl}/v1/boards/${boardId}/widgets',
        headers: _headers(),
        body: jsonEncode(body.toJson())));
  }

  Future<void> createText(String boardId, num x, num y, String text,
      {num fontSize, String textAlign}) async {
    var body = CreateTextJson('text', x, y,
        StyleJson(
          Optional.ofNullable(fontSize).orElse(14),
          Optional.ofNullable(textAlign).orElse('center')
        ), text);
    return await _retry(() => _client.post('${_baseUrl}/v1/boards/${boardId}/widgets',
        headers: _headers(),
        body: jsonEncode(body.toJson())));
  }

  Future<void> _retry(Future<Response> Function() request) async {
    var response = await request();
    if (response.statusCode == 429) {
        var resetDate = DateTime.fromMillisecondsSinceEpoch(
            int.parse(response.headers['x-ratelimit-reset']) * 1000);
        print('waiting for ratelimit reset...');
        await Future.delayed(resetDate.difference(DateTime.now()));
        await _retry(request);
    }
  }

  Map<String, String> _headers() => {
    'Authorization': 'Bearer ${_accessToken}',
    'Content-Type': 'application/json'
  };
}
