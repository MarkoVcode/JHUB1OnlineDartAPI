library model.value;

class Value {

  String _id;
  String _address;
  String _agent;
  String _created;
  String _name;
  String _value;

  Value.fromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }

  void getFromMap(Map parsedMap) {
    _id = parsedMap["id"];
    _created = parsedMap["created"];
    _address = parsedMap["address"];
    _name = parsedMap["name"];
    _agent = parsedMap["agent"];
    _value = parsedMap["value"];
  }

  String getID() {
    return _id;
  }

  String getCreated() {
    return _created;
  }

  String getName() {
    return _name;
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

}
