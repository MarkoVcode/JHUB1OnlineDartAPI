library model.agents;
import 'dart:convert';
import 'agent.dart';
import 'link.dart';
import 'response.dart';

class Agents extends Response {

  List<Agent> _agents;
  List<Link> _links;
  int _total;

  Agents.error() {}

  Agents() {

  }

  Agents.fromJSON(String json) {
    Map parsedMap = JSON.decode(json);
    createFromMap(parsedMap);
  }

  void createFromMap(Map parsedMap) {
    _total = parsedMap["total"];
    _agents = new List();
    for (Map agentMap in parsedMap["agents"]) {
      _agents.add(new Agent.fromMap(agentMap));
    }
    _links = new List();
    for (Map agentMap in parsedMap["links"]) {
      _links.add(new Link.fromMap(agentMap));
    }
  }

  int getTotal() {
    return _total;
  }

  List<Agent> getAgents() {
    return _agents;
  }

  List<Link> getLinks() {
    return _links;
  }
}
