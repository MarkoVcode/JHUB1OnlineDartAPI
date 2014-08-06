library interface;

import '../models/agents.dart';
import '../models/agent.dart';
import '../models/user.dart';
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
  
  static const String _RESOURCE_AGENTS = "agents";
  static const String _RESOURCE_ENDPOINTS = "endpoints";
  static const String _RESOURCE_TYPES = "types";
  static const String _RESOURCE_VALUES = "values";
  static const String _RESOURCE_PING = "ping";
  
  RamCachedModelTransform<Agent> _agentAPI;
  RamCachedModelTransform<Agents> _agentsAPI; 
  NonCachedModelTransform<Values> _valuesAPI;
  NonCachedModelTransform<Value> _valueAPI;
  RamCachedModelTransform<EpType> _typeAPI;
  RamCachedModelTransform<Types> _typesAPI;
  RamCachedModelTransform<Endpoint> _endpointAPI;
  RamCachedModelTransform<Endpoints> _endpointsAPI;
  NonCachedModelTransform<Ping> _pingAPI;
  
  NonCachedModelTransform<RestRequest> _agentDeleteAPI;
  NonCachedModelTransform<RestRequest> _valueDeleteAPI;
  NonCachedModelTransform<RestRequest> _typeDeleteAPI;
  NonCachedModelTransform<RestRequest> _endpointDeleteAPI;
  
  JHUB1OnlineServices(ServicesConfig confg) {
    var api = new RestApi(confg.getURI(), new JsonFormat());
    
    _agentAPI = new  RamCachedModelTransform<Agent>(
        api.ramCachedResource(_RESOURCE_AGENTS, confg.getCacheInvalidateTimeout()),
        (request) => new Agent()..createFromRestRequest(request));   
    _agentsAPI = new RamCachedModelTransform<Agents>(
        api.ramCachedResource(_RESOURCE_AGENTS, confg.getCacheInvalidateTimeout()),
        (request) => new Agents()..createFromRestRequest(request)); 
    _valuesAPI = new NonCachedModelTransform<Values>(
        api.nonCachedResource(_RESOURCE_VALUES),
        (request) => new Values()..createFromRestRequest(request));
    _valueAPI = new NonCachedModelTransform<Value>(
        api.nonCachedResource(_RESOURCE_VALUES),
        (request) => new Value()..createFromRestRequest(request));
    _typeAPI = new RamCachedModelTransform<EpType>(
        api.ramCachedResource(_RESOURCE_TYPES, confg.getCacheInvalidateTimeout()),
        (request) => new EpType()..createFromRestRequest(request));
    _typesAPI = new RamCachedModelTransform<Types>(
        api.ramCachedResource(_RESOURCE_TYPES, confg.getCacheInvalidateTimeout()),
        (request) => new Types()..createFromRestRequest(request));
    _endpointAPI = new RamCachedModelTransform<Endpoint>(
        api.ramCachedResource(_RESOURCE_ENDPOINTS, confg.getCacheInvalidateTimeout()),
        (request) => new Endpoint()..createFromRestRequest(request));
    _endpointsAPI = new RamCachedModelTransform<Endpoints>(
        api.ramCachedResource(_RESOURCE_ENDPOINTS, confg.getCacheInvalidateTimeout()),
        (request) => new Endpoints()..createFromRestRequest(request));
    _pingAPI = new NonCachedModelTransform<Ping>(
        api.nonCachedResource(_RESOURCE_PING),
        (request) => new Ping()..createFromRestRequest(request));
    _agentDeleteAPI = new NonCachedModelTransform<RestRequest>(
        api.nonCachedResource(_RESOURCE_AGENTS),
        (request) => request);
    _typeDeleteAPI = new NonCachedModelTransform<RestRequest>(
        api.nonCachedResource(_RESOURCE_TYPES),
        (request) => request);
    _endpointDeleteAPI = new NonCachedModelTransform<RestRequest>(
        api.nonCachedResource(_RESOURCE_ENDPOINTS),
        (request) => request);
    _valueDeleteAPI = new NonCachedModelTransform<RestRequest>(
        api.nonCachedResource(_RESOURCE_VALUES),
        (request) => request);
  }
  
  /**
   * GET  
   */  
  
  /**
   * Retrives all available agents and executes provided callback function. 
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type Agents which
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     jhub1online.getAgents((agents) => populateAgents(agents));
   */
  void getAgents(Function callback(Agents agents), {bool invalidateCache: false}) {
    _agentsAPI.findAll(invalidateCache).then((agents) => callback(agents));
  }
  
  /**
   * Returns Future<Agents> with all available agents. 
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error the Agents object has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Agent> futureAgents = jhub1online.getAgentsFuture();
   */
  Future<Agents> getAgentsFuture({bool invalidateCache: false}) {
    return _agentsAPI.findAll(invalidateCache);
  }
  
  /**
   * Retrives agent with ID and executes provided callback function. 
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type Agent which
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   *
   *     jhub1online.getAgentByID((agent) => showAgentDetails(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getAgentByID(Function callback(Agent agent), String id, {bool invalidateCache: false}) {
    _agentAPI.find(id, invalidateCache).then((agent) => callback(agent));
  }

  /**
   * Returns Future<Agent> with agent with requested ID. 
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error the Agent object has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Agent> futureAgent = jhub1online.getAgentByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  Future<Agent> getAgentByIDFuture(String id, {bool invalidateCache: false}) {
    return _agentAPI.find(id, invalidateCache);
  }
  
  /**
   * Retrives only values of new endpoints - the ones without assigned endpoint type
   * and executes provided callback function.
   * The response is never cached.
   * The callback provided parameter must be of type Values which
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     jhub1online.getNewValues((values) => doSomethingWithMyValues(values));
   */
  void getNewValues(Function callback(Values values)) {
    _valuesAPI.findAll().then((values) => callback(values));
  }

  /**
   * Returns Future<Values> with values of new endpoints - the ones without
   * assigned endpoint type.
   * The response is never cached.
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Values> futureNewValues = jhub1online.getNewValuesFuture();
   */
  Future<Values> getNewValuesFuture() {
    return _valuesAPI.findAll();
  }
  
  /**
   * Retrives values of the all endpoints that belong to Agent identified
   * by agentName.
   * and executes provided callback function.
   * The response is never cached.
   * The callback provided parameter must be of type Values which
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   *
   *     jhub1online.getValuesByAgentName((values) => doSomethingWithMyValues(values), "tt56rsnixh");
   */
  void getValuesByAgentName(Function callback(Values values), String agentName) {
    _valuesAPI.find(agentName).then((values) => callback(values));
  }

  /**
   * Returns Future<Values> with values of the all endpoints that belong to Agent
   * identified by agentName. 
   * The response is never cached.
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Values> futureValues = jhub1online.getValuesByAgentNameFuture("tt56rsnixh");
   */
  Future<Values> getValuesByAgentNameFuture(String agentName) {
    return _valuesAPI.find(agentName);
  }
  
  /**
   * Retrives last value of the endpoint identified by valueAddress
   * and executes provided callback function.
   * The response is never cached.
   * The callback provided parameter must be of type Value which
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   *
   *     jhub1online.getValueByAddress((value) => doSomethingWithMyValues(value), "tt56rsnixh/testValuesdxv");
   */
  void getValueByAddress(Function callback(Value value), String valueAddress) {
    _valueAPI.find(valueAddress).then((value) => callback(value));
  }

  /**
   * Returns Future<Value> with value of the endpoint identified by valueAddress
   * The response is never cached.
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Values> futureValue = jhub1online.getValueByAddressFuture("tt56rsnixh/testValuesdxv");
   */
  Future<Value> getValueByAddressFuture(String valueAddress) {
    return _valueAPI.find(valueAddress);
  }
  
  /**
   * Retrives all endpoint types and executes provided callback function.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type Types which
   * in case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   *
   *     jhub1online.getTypes((agents) => populateAgents(agents));
   */
  void getTypes(Function callback(Types types), {bool invalidateCache: false}) {
    _typesAPI.findAll(invalidateCache).then((types) => callback(types));
  }
  
  /**
   * Returns Future<Types> with all types.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *      Future&lt;Values> futureTypes = jhub1online.getTypesFuture();
   */
  Future<Types> getTypesFuture({bool invalidateCache: false}) {
    return _typesAPI.findAll(invalidateCache);
  }
  
  /**
   * Retrives endpoint type identified by ID and executes provided callback function.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type EpType which
   * in case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   *
   *     jhub1online.getTypeByID((type) => showTypeDetails(type), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getTypeByID(Function callback(EpType type), String id, {bool invalidateCache: false}) {
    _typeAPI.find(id, invalidateCache).then((type) => callback(type));
  }
  
  /**
   * Returns Future<EpType> of type identified by ID.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;EpType> futureEpType = jhub1online.getTypeByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  Future<EpType> getTypeByIDFuture(String id, {bool invalidateCache: false}) {
    return _typeAPI.find(id, invalidateCache);
  }

  /**
   * Retrives all defined endpoints and executes provided callback function.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type Endpoints which
   * in case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     jhub1online.getEndopints((endpoints) => showEndpoints(endpoints));
   */
  void getEndpoints(Function callback(Endpoints endpoints), {bool invalidateCache: false}) {
    _endpointsAPI.findAll(invalidateCache).then((endpoints) => callback(endpoints));
  }
  
  /**
   * Returns Future<Endpoints> with all endpoints.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *      Future&lt;Endpoints> futureEndpoints = jhub1online.getEndpointsFuture();
   */
  Future<Endpoints> getEndpointsFuture({bool invalidateCache: false}) {
    return _endpointsAPI.findAll(invalidateCache);
  }
  
  /**
   * Retrives single endpoint identified by its ID.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * The callback provided parameter must be of type Endpoint which
   * in case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     jhub1online.getEndpointByID((endpoint) => showEndpoint(endpoint), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  void getEndpointByID(Function callback(Endpoint endpoint), String id, {bool invalidateCache: false}) {
    _endpointAPI.find(id, invalidateCache).then((endpoint) => callback(endpoint));
  }
  
  /**
   * Returns Future<Endpoint> with endpoint identified by its ID.
   * The response is cached, cache can be invalidated by setting invalidateCache: true
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *      Future&lt;Endpoint> futureEndpoint = jhub1online.getEndpointByIDFuture("A-1E6B9-5P8TQ-HJ9JKDL0Y.733");
   */
  Future<Endpoint> getEndpointByIDFuture(String id, {bool invalidateCache: false}) {
    return _endpointAPI.find(id, invalidateCache);
  }
  
  /**
   * Ping returns real time values of all the important elements also
   * provides informations about events.
   * The response is never cached.
   * The callback provided parameter must be of type Ping which
   * in case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     jhub1online.ping((ping) => processPingData(ping));
   */
  void ping(Function callback(Ping ping)) {
    _pingAPI.findAll().then((ping) => callback(ping));
  }
  
  /**
   * Returns Future<Ping> which provides real time values of all the important
   * elements also informations about events.
   * The response is never cached.
   * In case of transport connection error has hasError flag set 'true'.
   * Check RestRequest object for more details (getRestRequest()).
   * For example:
   * 
   *     Future&lt;Ping> futurePing = jhub1online.pingFuture();
   */
  Future<Ping> pingFuture() {
    return _pingAPI.findAll();
  }
 
  /**
   * DELETE  
   */  
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the agent with the agentID.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteAgentByID(String id) {
    return _agentDeleteAPI.delete(id);
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the resource reflected in Agent object.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteAgent(Agent agent) {
    return _agentDeleteAPI.delete(agent.getID());
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the type resource with the typeID.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteTypeByID(String typeID) {
    return _typeDeleteAPI.delete(typeID);
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the resource reflected in EpType object.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteType(EpType type) {
    return _typeDeleteAPI.delete(type.getID());
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the endpoint resource with the endpointID.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteEndpointByID(String endpointID) {
    return _endpointDeleteAPI.delete(endpointID);
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the resource reflected in Endpoint object.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteEndpoint(Endpoint ep) {
    return _endpointDeleteAPI.delete(ep.getID());
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the value resource with the valueID.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteValueByID(String valueID) {
    return _valueDeleteAPI.delete(valueID);
  }
  
  /**
   * Returns Future<RestRequest>. 
   * Deletes the resource reflected in Value object.
   * The DELETE is synchronous and always return code 200 regardles the actual resource existence.
   * In case of transport connection error has hasError flag set 'true'.
   */
  Future<RestRequest> deleteValue(Value value) {
    return _valueDeleteAPI.delete(value.getID());
  }
  
  /**
   * POST  
   */
  
  
}