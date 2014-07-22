library model.types;
import 'response.dart';
import 'eptype.dart';
import 'link.dart';
import 'dart:convert';

class Types extends Response {
  List<EpType> _types; 
  List<Link> _links;
  int _total;
 
  Types.error() {}
  
  Types() {
    
  }
  
  Types.fromJSON(String json){
    Map parsedMap = JSON.decode(json);
    createFromMap(parsedMap);
  }
  
  void createFromMap(Map parsedMap) {
    _total = parsedMap["total"];
    _types = new List<EpType>();
    for(Map agentMap in parsedMap["types"]) {
      _types.add(new EpType.fromMap(agentMap));
    }
    _links = new List<Link>();
    for(Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
  }
  
  int getTotal() {
    return _total;
  }

  List<EpType> getTypes() {
    return _types;
  }
  
  List<Link> getLinks() {
    return _links;
  }
  
}