library model.value;
import "link.dart";
import 'response.dart';

class Value extends Response {

  String _id;
  String _address;
  String _agent;
  int _created_t;
  String _created_s;
  String _timezone;
  String _name;
  String _value;
  List<Link> _links;

  Value() {

  }

  Value.fromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }

  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }

  void getFromMap(Map parsedMap) {
    _id = parsedMap["id"];
    _created_t = parsedMap["created_t"];
    _created_s = parsedMap["created_s"];
    _address = parsedMap["address"];
    _timezone = parsedMap["timezone"];
    _name = parsedMap["name"];
    _agent = parsedMap["agent"];
    _value = parsedMap["value"];
    _links = new List<Link>();
    for (Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
  }

  String getID() {
    return _id;
  }

  String getCreatedString() {
    return _created_s;
  }

  int getCreatedTime() {
    return _created_t;
  }

  String getName() {
    return _name;
  }

  String getTimezone() {
    return _timezone;
  }

  String getValue() {
    return _value;
  }

  String getAgent() {
    return _agent;
  }

  String getAddress() {
    return _address;
  }

  List<Link> getLinks() {
    return _links;
  }
}
