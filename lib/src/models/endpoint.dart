library model.endpoint;
import 'response.dart';
import 'link.dart';

class Endpoint extends Response {
  
  String _id;
  String _name;
  String _icon;
  String _color;
  String _description;
  int _sorder;
  String _accesstype;
  String _sharepolicy;
  String _geolocalization;
  Map _configValues;
  List<Link> _links;
  String _valueaddress;
  String _typeid;
  
  Endpoint.error() {}
  
  Endpoint() {
    
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  Endpoint.fromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  void getFromMap(Map parsedMap) {
    _id = parsedMap["id"];
    _name = parsedMap["name"];
    _icon = parsedMap["icon"];
    _color = parsedMap["color"];
    _description = parsedMap["description"];
    _sorder = parsedMap["_sorder"];
    _accesstype = parsedMap["accesstype"];
    _sharepolicy = parsedMap["sharepolicy"];
    _geolocalization = parsedMap["geolocalization"];
    _links = new List<Link>();
    for(Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
    _configValues = parsedMap["configValues"];
    _valueaddress = parsedMap["valueaddress"];
    _typeid = parsedMap["typeid"];
  }
  
  String getID() {
    return _id;
  }
  
  String getName() {
    return _name;
  }
  
  String getIcon() {
    return _icon;
  }
  
  String getColor() {
    return _color;
  }
  
  String getDescription() {
    return _description;
  }
  
  int getOrder() {
    return _sorder;
  }
  
  List<Link> getLinks() {
    return _links;
  }
}