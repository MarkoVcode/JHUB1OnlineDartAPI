library model.ping;
import 'dart:convert';
import 'response.dart';

class Ping extends Response {

  String _pingTest;
  
  Ping.error() {}

  Ping() {

  }

  Ping.fromJSON(String json) {
    Map parsedMap = JSON.decode(json);
    createFromMap(parsedMap);
  }

  void createFromMap(Map parsedMap) {
    _pingTest = parsedMap["pingTest"];
  }

  String getPingTest() {
    return _pingTest;
  }
}
