library agentsCall;

import 'service.dart';
import '../models/agents.dart';
import '../models/agent.dart';
import '../models/user.dart';
import '../models/endpoint.dart';
import '../models/endpoints.dart';
import '../models/endpointtypes.dart';
import '../models/delete.dart';
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
  
  /**
   * Retrives all available agents.
   * The call back provided returns response object Agents which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getAgents((agents) => populateAgents(agents));
   */
  void getAgents(Function callback(Agents agents)) {
    agentsAPI.findAll().then((agents) => callback(agents));
  }
  
  /**
   * Retrives agent with requested ID.
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getAgentByID((agent) => showAgentDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getAgentByID(Function callback(Agent agent), String id) {
    agentAPI.find(id).then((agent) => callback(agent));
  }
  
  /**
   * Retrives only new endpoints - the ones without assigned endpoint type.
   * The call back provided returns response wrapper Endpoints which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getNewEndopints((endpoints) => showNewEndpoints(endpoints));
   */
  void getNewEndopints(Function callback(Endpoints endpoints)) {

  }
  
  /**
   * Retrives all endpoints - the ones with assigned endpoint type.
   * The call back provided returns response wrapper Endpoints which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopints((endpoints) => showEndpoints(endpoints));
   */
  void getEndopints(Function callback(Endpoints endpoints)) {
    
  }
  
  /**
   * Retrives endopint with requested ID.
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopintByID((agent) => showEndpointDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getEndopintByID(Function callback(Endpoint endpoint), String id) {
    
  }
  
  void getUserByID(Function callback(User user), String id) {
    
  }
  
  /**
   * Retrives all endopint types: system defaults and defined by user.
   * The call back provided returns response wrapper EndpointTypes which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopintTypes((endpointTypes) => showEndpointTypes(endpointTypes));
   */
  void getEndopintTypes(Function callback(EndpointTypes endpointTypes)) {
    
  }
  
  void putEndpoint(Function callback(Endpoint endpoint), Endpoint endpoint) {
    
  }
  
  void putAgent(Function callback(Agent agent), Agent agent) {
    
  }
   
  /**
   * Deletes the agent with the agentID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteAgent((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void deleteAgent(String agentID) {
    
  }
  
  /**
   * Deletes the endpoint with the endpointID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteEndpoint((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void deleteEndpoint(Function callback(Delete delete), String endpointID) {
    
    
  }

  /**
   * Deletes the new endpoint with the newEndpointID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteNewEndpoint((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void deleteNewEndpoint(Function callback(Delete delete), String newEndpointID) {
    
    
  }
}