library agent;
import 'dart:convert';
import 'response.dart';
import 'link.dart';

class Agent extends Response {
 
  String _id;
  String _created;
  String _status;
  String _updated;
  String _name;
  String _icon;
  String _color;
  String _description;
  int _sorder;
//  localConfig
//  remoteConfig
  String _buildid;
  String _builddate;
  Link _link;
//  attributes
  
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
    _created = parsedMap["created"];
    _status = parsedMap["status"];
    _updated = parsedMap["updated"];
    _name = parsedMap["name"];
    _icon = parsedMap["icon"];
    _color = parsedMap["color"];
    _description = parsedMap["description"];
    _buildid = parsedMap["buildid"];
    _builddate = parsedMap["builddate"];
    _link = new Link.fromMap(parsedMap["link"]);
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  String getID() {
    return _id;
  }
  
  String getCreated() {
    return _created;
  }
  
  String getStatus() {
    return _status;
  }
  
  String getUpdated() {
    return _updated;
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
  
  String getBuildId() {
    return _buildid;
  }
  
  String getBuildDate() {
    return _builddate;
  }
  
  Link getLink() {
    return _link;
  }
}
