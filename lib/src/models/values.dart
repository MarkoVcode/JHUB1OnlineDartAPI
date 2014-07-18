library model.values;
import 'dart:convert';
import 'value.dart';
import 'response.dart';

class Values extends Response {
  
  List<Value> _values; 
  int _total;
 
  Values.error() {}
  
  Values() {
    
  }
  
  Values.fromJSON(String json){
    Map parsedMap = JSON.decode(json);
    createFromMap(parsedMap);
  }
  
  void createFromMap(Map parsedMap) {
    _total = parsedMap["total"];
    _values = new List();
    for(Map agentMap in parsedMap["values"]) {
      _values.add(new Value.fromMap(agentMap));
    }
  }
  
  int getTotal() {
    return _total;
  }

  List<Value> getValues() {
    return _values;
  }
  
}