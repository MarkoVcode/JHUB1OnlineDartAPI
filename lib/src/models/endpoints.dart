library model.endpoints;
import 'dart:convert';
import 'response.dart';
import 'endpoint.dart';
import 'link.dart';

class Endpoints extends Response {

  List<Endpoint> _endpoints;
  List<Link> _links;
  int _total;

  Endpoints.error() {}

  Endpoints() {

  }

  Endpoints.fromJSON(String json) {
    Map parsedMap = JSON.decode(json);
    createFromMap(parsedMap);
  }

  void createFromMap(Map parsedMap) {
    _total = parsedMap["total"];
    _endpoints = new List();
    for (Map agentMap in parsedMap["endpoints"]) {
      _endpoints.add(new Endpoint.fromMap(agentMap));
    }
    _links = new List();
    for (Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
  }

  int getTotal() {
    return _total;
  }

  List<Endpoint> getEndpoints() {
    return _endpoints;
  }

  List<Link> getLinks() {
    return _links;
  }
}
