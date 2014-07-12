library agent;
import 'dart:convert';
import 'response.dart';
import 'link.dart';

class Agent extends Response {
 
  String id;
  DateTime created;
  String status;
  DateTime updated;
  String name;
  String icon;
  String color;
  String description;
  int sorder;
  String buildid;
  DateTime builddate;
  Link link;

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
    id = parsedMap["id"];
    status = parsedMap["status"];
    name = parsedMap["name"];
    icon = parsedMap["icon"];
    color = parsedMap["color"];
    description = parsedMap["description"];
    buildid = parsedMap["buildid"];
    link = new Link.fromMap(parsedMap["link"]);
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  String getID() {
    return id;
  }
  
  String getStatus() {
    return status;
  }
  String getName() {
    return name;
  }
  
  String getIcon() {
    return icon;
  }
  
  String getColor() {
    return color;
  }
  
  String getDescription() {
    return description;
  }
  
  String getBuildId() {
    return buildid;
  }
  
  Link getLink() {
    return link;
  }
}
