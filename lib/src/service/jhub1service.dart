library interface;

import '../models/agents.dart';
import '../models/agent.dart';
//import '../models/user.dart';
import '../models/endpoint.dart';
import '../models/endpoints.dart';
import '../models/types.dart';
import '../models/eptype.dart';
import '../models/values.dart';
import '../models/value.dart';
import '../models/ping.dart';
import "package:restful/restful.dart";
import 'request_wrapper.dart';
import 'package:logging/logging.dart';
import 'dart:async';

Logger _logger = new Logger("restful.request_helper");

class JHUB1OnlineServices {
  
  static const String RESOURCE_AGENTS = "agents";
  static const String RESOURCE_ENDPOINTS = "endpoints";
  static const String RESOURCE_TYPES = "types";
  static const String RESOURCE_VALUES = "values";
  static const String RESOURCE_PING = "ping";
  
  ModelTransform<Agent> agentAPI;
  ModelTransform<Agents> agentsAPI; 
  ModelTransform<Values> valuesAPI;
  ModelTransform<Value> valueAPI;
  ModelTransform<EpType> typeAPI;
  ModelTransform<Types> typesAPI;
  ModelTransform<Endpoint> endpointAPI;
  ModelTransform<Endpoints> endpointsAPI;
  ModelTransform<Ping> pingAPI;
  
  JHUB1OnlineServices() {
    var api = new RestApi("http://127.0.0.1:8081/mock0", new JsonFormat());
    
    agentAPI = new ModelTransform<Agent>(
        api.cachedResource(RESOURCE_AGENTS),
        (request) => new Agent()..createFromRestRequest(request));   
    agentsAPI = new ModelTransform<Agents>(
        api.cachedResource(RESOURCE_AGENTS),
        (request) => new Agents()..createFromRestRequest(request)); 
    valuesAPI = new ModelTransform<Values>(
        api.cachedResource(RESOURCE_VALUES),
        (request) => new Values()..createFromRestRequest(request));
    valueAPI = new ModelTransform<Value>(
        api.cachedResource(RESOURCE_VALUES),
        (request) => new Value()..createFromRestRequest(request));
    typeAPI = new ModelTransform<EpType>(
        api.cachedResource(RESOURCE_TYPES),
        (request) => new EpType()..createFromRestRequest(request));
    typesAPI = new ModelTransform<Types>(
        api.cachedResource(RESOURCE_TYPES),
        (request) => new Types()..createFromRestRequest(request));
    endpointAPI = new ModelTransform<Endpoint>(
        api.cachedResource(RESOURCE_ENDPOINTS),
        (request) => new Endpoint()..createFromRestRequest(request));
    endpointsAPI = new ModelTransform<Endpoints>(
        api.cachedResource(RESOURCE_ENDPOINTS),
        (request) => new Endpoints()..createFromRestRequest(request));
    pingAPI = new ModelTransform<Ping>(
        api.cachedResource(RESOURCE_PING, 10000),
        (request) => new Ping()..createFromRestRequest(request));
  }
  
  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(Properties.PROTOCOL);
    buffer.write("://");
    buffer.write(Properties.HOSTNAME);
    buffer.write(":");
    buffer.write(Properties.PORT);
    buffer.write("/");
    buffer.write(Properties.VERSION);
    buffer.write("/");
    return buffer.toString();
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
    _logger.warning("BLA");
  }
  
  /**
   * Retrives all available agents.
   * The call back provided returns response object Agents which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *      Future<Agents> agents = jhub1online.getAgentsFuture();
   *      agents.then((agents) => populateAgents(agents));
   */
  Future<Agents> getAgentsFuture() {
    return agentsAPI.findAll();
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
   * Retrives agent with requested ID .
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     Future<Agent> agent = jhub1online.getAgentByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   *     agent.then((agent) => showAgentDetails(agent));
   */
  Future<Agent> getAgentByIDFuture(String id) {
    return agentAPI.find(id);
  }
  /**
   * Retrives only values of new endpoints - the ones without assigned endpoint type.
   * The call back provided returns response wrapper Values which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getNewValues((values) => doSomethingWithMyValues(values));
   */
  void getNewValues(Function callback(Values values)) {
    valuesAPI.findAll().then((values) => callback(values));
  }

  /**
   * Retrives values of the all endpoints that belong to Agent identified by name.
   * The call back provided returns response wrapper Values which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getValuesByAgentName((values) => doSomethingWithMyValues(values), "tt56rsnixh");
   */
  void getValuesByAgentName(Function callback(Values values), String agentName) {
    valuesAPI.find(agentName).then((values) => callback(values));
  }

  /**
   * Retrives value identified by address.
   * The call back provided returns response wrapper Value which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getValueByAddress((value) => doSomethingWithMyValues(value), "tt56rsnixh/testValuesdxv");
   */
  void getValueByAddress(Function callback(Value value), String valueAddress) {
    valueAPI.find(valueAddress).then((value) => callback(value));
  }

  /**
   * Retrives all endpoint types.
   * The call back provided returns response object Types which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getTypes((agents) => populateAgents(agents));
   */
  void getTypes(Function callback(Types types)) {
    typesAPI.findAll().then((types) => callback(types));
  }
  
  /**
   * Retrives endpoint type with requested ID.
   * The call back provided returns response wrapper EpType which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getTypeByID((agent) => showAgentDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getTypeByID(Function callback(EpType type), String id) {
    typeAPI.find(id).then((type) => callback(type));
  }
  
  
  /**
   * Retrives all defined endpoints.
   * The call back provided returns response wrapper Values which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopints((endpoints) => showEndpoints(endpoints));
   */
  void getEndopints(Function callback(Endpoints endpoints)) {
    endpointsAPI.findAll().then((endpoints) => callback(endpoints));
  }
  
  /**
   * Retrives endopint with requested ID.
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopintByID((agent) => showEndpointDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getEndopintByID(Function callback(Endpoint endpoint), String id) {
    endpointAPI.find(id).then((endpoint) => callback(endpoint));
  }
  

  
  
  Future<Ping> ping() {
    return pingAPI.findAll();
  }
 // void putEndpoint(Function callback(Endpoint endpoint), Endpoint endpoint) {
    
 // }
  
//  void putAgent(Function callback(Agent agent), Agent agent) {
    
 // }
   
  /**
   * Deletes the agent with the agentID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteAgent((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  //void deleteAgent(String agentID) {
    
 // }
  
  /**
   * Deletes the endpoint with the endpointID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteEndpoint((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
 // void deleteEndpoint(Function callback(Delete delete), String endpointID) {
    
    
 // }

  /**
   * Deletes the new endpoint with the newEndpointID,
   * The call back provided returns response wrapper Delete which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     deleteNewEndpoint((delete) => confirmDeleted(delete), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  //void deleteNewEndpoint(Function callback(Delete delete), String newEndpointID) {
    
    
  //}
}

class Properties {
  static const String PROTOCOL = "http";
  static const String PORT = "8081";
  static const String VERSION = "mock0";
  static const String HOSTNAME = "127.0.0.1";
  static const String SERVICE_AGENT = "";
  static const String SERVICE_AGENTS = "";
}