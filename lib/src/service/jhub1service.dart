library agentsCall;

import 'service.dart';
import '../models/agents.dart';
import '../models/agent.dart';
import '../models/user.dart';
import '../models/endpoint.dart';
import '../models/endpoints.dart';
import '../models/endpointtypes.dart';
import "package:restful/restful.dart";
import 'request_wrapper.dart';

class JHUB1OnlineServices extends Service {
  
  static const String RESOURCE_AGENTS = "agents";
  static const String RESOURCE_ENDPOINTS = "endpoints";
  
  ModelTransform<Agent> agentAPI;
  ModelTransform<Agents> agentsAPI; 
  
  JHUB1OnlineServices() {
    var api = new RestApi(apiUri: "http://127.0.0.1:8081/mock0", format: new JsonFormat());
    agentAPI = new ModelTransform<Agent>(
        api.resource(RESOURCE_AGENTS),
        (json) => new Agent()..createFromMap(json),
        (error) => new Agent()..setError(error)
        );   
    agentsAPI = new ModelTransform<Agents>(
        api.resource(RESOURCE_AGENTS),
        (json) => new Agents()..createFromMap(json),
        (error) => new Agents()..setError(error)
        );   
  }
  
  void getAgents(Function callback(Agents agents)) {
    agentsAPI.findAll().then((agents) => callback(agents));
  }
  
  void getAgentByID(Function callback(Agent agent), String id) {
    agentAPI.find(id).then((agent) => callback(agent));
  }
  
  void getNewEndopints(Function callback(Endpoints endpoints)) {

  }
  
  void getEndopints(Function callback(Endpoints endpoints)) {
    
  }

  void getEndopintByID(Function callback(Endpoint endpoint), String id) {
    
  }
  
  void getUserByID(Function callback(User user), String id) {
    
  }
  
  void getEndopintTypes(Function callback(EndpointTypes endpointTypes)) {
    
  }
  
  void putEndpoint(Endpoint endpoint) {
    
  }
  
  void putAgent(Agent agent) {
    
  }
  
  void deleteAgents(List<String> agentIDs) {
    
  }
  
  void deleteEndpoints(List<String> endpointIDs) {
    
  }
  
  void deleteNewEndpoints(List<String> newendpointIDs) {
    
  }
}