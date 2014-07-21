library model.agent;
import 'dart:convert';
import 'response.dart';
import 'link.dart';

class Agent extends Response {
 
  String _id;
  String _username;
  int _created_t;
  String _created_s;
  String _timezone;
  String _status;
  int _updated_t;
  String _updated_s;
  String _name;
  String _icon;
  String _color;
  String _description;
  int _sorder;
//  localConfig
//  remoteConfig
  String _buildid;
  int _builddate_t;
  String _builddate_s;
  List<Link> _links;
  Map _attributes;
  
  Agent() {
    
  }
  
  Agent.fromJSON(String json) {
    Map parsedMap = JSON.decode(json);
    getFromMap(parsedMap);
  }

  Agent.fromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  void getFromMap(Map parsedMap) {
    _id = parsedMap["id"];
    _username = parsedMap["username"];
    _created_t = parsedMap["created_t"];
    _created_s = parsedMap["created_s"];
    _timezone = parsedMap["timezone"];
    _status = parsedMap["status"];
    _updated_t = parsedMap["updated_t"];
    _updated_s = parsedMap["updated_s"];
    _name = parsedMap["name"];
    _icon = parsedMap["icon"];
    _color = parsedMap["color"];
    _description = parsedMap["description"];
    _sorder = parsedMap["sorder"];
    _buildid = parsedMap["buildid"];
    _builddate_t = parsedMap["builddate_t"];
    _builddate_s = parsedMap["builddate_s"];
    _links = new List<Link>();
    for(Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
    _attributes = parsedMap["attributes"];
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  String getID() {
    return _id;
  }
  
  String getTimezone() {
    return _timezone;
  }
  
  String getUsername() {
    return _username;
  }
  
  String getCreatedString() {
    return _created_s;
  }
  
  int getCreatedTime() {
    return _created_t;
  }
  
  String getStatus() {
    return _status;
  }
  
  int getUpdatedTime() {
    return _updated_t;
  }
  
  String getUpdatedString() {
    return _updated_s;
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
  
  String getBuildID() {
    return _buildid;
  }
  
  int getBuildDateTime() {
    return _builddate_t;
  }
  
  String getBuildDateString() {
    return _builddate_s;
  }
  
  List<Link> getLinks() {
    return _links;
  }
  
  Map getAttributes() {
    return _attributes;
  }
}
