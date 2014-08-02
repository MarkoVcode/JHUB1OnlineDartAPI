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
import "package:restfulplus/restfulplus.dart";
import 'noncached_model_trans.dart';
import 'ramcached_model_trans.dart';
import 'jhub1service_config.dart';
import 'package:logging/logging.dart';
import 'dart:async';

Logger _logger = new Logger("restful.request_helper");

class JHUB1OnlineServices {
  
  static const String RESOURCE_AGENTS = "agents";
  static const String RESOURCE_ENDPOINTS = "endpoints";
  static const String RESOURCE_TYPES = "types";
  static const String RESOURCE_VALUES = "values";
  static const String RESOURCE_PING = "ping";
  
  RamCachedModelTransform<Agent> agentAPI;
  RamCachedModelTransform<Agents> agentsAPI; 
  NonCachedModelTransform<Values> valuesAPI;
  NonCachedModelTransform<Value> valueAPI;
  RamCachedModelTransform<EpType> typeAPI;
  RamCachedModelTransform<Types> typesAPI;
  RamCachedModelTransform<Endpoint> endpointAPI;
  RamCachedModelTransform<Endpoints> endpointsAPI;
  NonCachedModelTransform<Ping> pingAPI;
  
  JHUB1OnlineServices(ServicesConfig confg) {
    var api = new RestApi(confg.getURI(), new JsonFormat());
    
    agentAPI = new  RamCachedModelTransform<Agent>(
        api.ramCachedResource(RESOURCE_AGENTS, confg.getCacheInvalidateTimeout()),
        (request) => new Agent()..createFromRestRequest(request));   
    agentsAPI = new RamCachedModelTransform<Agents>(
        api.ramCachedResource(RESOURCE_AGENTS, confg.getCacheInvalidateTimeout()),
        (request) => new Agents()..createFromRestRequest(request)); 
    valuesAPI = new NonCachedModelTransform<Values>(
        api.nonCachedResource(RESOURCE_VALUES),
        (request) => new Values()..createFromRestRequest(request));
    valueAPI = new NonCachedModelTransform<Value>(
        api.nonCachedResource(RESOURCE_VALUES),
        (request) => new Value()..createFromRestRequest(request));
    typeAPI = new RamCachedModelTransform<EpType>(
        api.ramCachedResource(RESOURCE_TYPES, confg.getCacheInvalidateTimeout()),
        (request) => new EpType()..createFromRestRequest(request));
    typesAPI = new RamCachedModelTransform<Types>(
        api.ramCachedResource(RESOURCE_TYPES, confg.getCacheInvalidateTimeout()),
        (request) => new Types()..createFromRestRequest(request));
    endpointAPI = new RamCachedModelTransform<Endpoint>(
        api.ramCachedResource(RESOURCE_ENDPOINTS, confg.getCacheInvalidateTimeout()),
        (request) => new Endpoint()..createFromRestRequest(request));
    endpointsAPI = new RamCachedModelTransform<Endpoints>(
        api.ramCachedResource(RESOURCE_ENDPOINTS, confg.getCacheInvalidateTimeout()),
        (request) => new Endpoints()..createFromRestRequest(request));
    pingAPI = new NonCachedModelTransform<Ping>(
        api.nonCachedResource(RESOURCE_PING),
        (request) => new Ping()..createFromRestRequest(request));
  }
  
  /**
   * Retrives all available agents.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response object Agents which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getAgents((agents) => populateAgents(agents));
   */
  void getAgents(Function callback(Agents agents), {bool invalidateCache: false}) {
    agentsAPI.findAll(invalidateCache).then((agents) => callback(agents));
  }
  
  /**
   * Retrives all available agents.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response object Agents which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *      jhub1online.getAgentsFuture().then((agents) => populateAgents(agents));
   */
  Future<Agents> getAgentsFuture({bool invalidateCache: false}) {
    return agentsAPI.findAll(invalidateCache);
  }
  
  /**
   * Retrives agent with requested ID.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getAgentByID((agent) => showAgentDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getAgentByID(Function callback(Agent agent), String id, {bool invalidateCache: false}) {
    agentAPI.find(id, invalidateCache).then((agent) => callback(agent));
  }

  /**
   * Retrives agent with requested ID.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     Future<Agent> agent = jhub1online.getAgentByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   *     agent.then((agent) => showAgentDetails(agent));
   */
  Future<Agent> getAgentByIDFuture(String id, {bool invalidateCache: false}) {
    return agentAPI.find(id, invalidateCache);
  }
  /**
   * Retrives only values of new endpoints - the ones without assigned endpoint type.
   * The response is not cached.
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
   * The response is not cached.
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
   * The response is not cached.
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
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response object Types which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getTypes((agents) => populateAgents(agents));
   */
  void getTypes(Function callback(Types types), {bool invalidateCache: false}) {
    typesAPI.findAll(invalidateCache).then((types) => callback(types));
  }
  
  /**
   * Retrives endpoint type with requested ID.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response wrapper EpType which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getTypeByID((agent) => showAgentDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getTypeByID(Function callback(EpType type), String id, {bool invalidateCache: false}) {
    typeAPI.find(id, invalidateCache).then((type) => callback(type));
  }
  
  
  /**
   * Retrives all defined endpoints.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response wrapper Values which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopints((endpoints) => showEndpoints(endpoints));
   */
  void getEndopints(Function callback(Endpoints endpoints), {bool invalidateCache: false}) {
    endpointsAPI.findAll(invalidateCache).then((endpoints) => callback(endpoints));
  }
  
  /**
   * Retrives endopint with requested ID.
   * The response is cached and can be invalidated by setting invalidateCache: true
   * The call back provided returns response wrapper Agent which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     getEndopintByID((agent) => showEndpointDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getEndopintByID(Function callback(Endpoint endpoint), String id, {bool invalidateCache: false}) {
    endpointAPI.find(id, invalidateCache).then((endpoint) => callback(endpoint));
  }
  
  /**
   * Ping returns real time values of all the important elements.
   * The response is never cached.
   * The call back provided returns response wrapper Ping which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     ping((ping) => processPingData(ping));
   */
  void ping(Function callback(Ping ping)) {
    pingAPI.findAll().then((ping) => callback(ping));
  }
  
  /**
   * Ping returns real time values of all the important elements.
   * The response is never cached.
   * The call back provided returns response wrapper Ping which
   * in case of error holds RequestFault object and has hasError() flag set 'true'.
   *
   *     pingFuture().then((ping) => processPingData(ping));
   */
  Future<Ping> pingFuture() {
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