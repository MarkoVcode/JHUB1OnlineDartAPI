library interface;

import 'service.dart';
import '../models/agents.dart';
import '../models/agent.dart';
import '../models/user.dart';
import '../models/endpoint.dart';
import '../models/endpoints.dart';
import '../models/types.dart';
import '../models/eptype.dart';
import '../models/values.dart';
import '../models/value.dart';
import "package:restful/restful.dart";
import 'request_wrapper.dart';
import 'package:logging/logging.dart';

Logger _logger = new Logger("restful.request_helper");

class JHUB1OnlineServices extends Service {
  
  static const String RESOURCE_AGENTS = "agents";
  static const String RESOURCE_ENDPOINTS = "endpoints";
  static const String RESOURCE_TYPES = "types";
  static const String RESOURCE_VALUES = "values";
  
  ModelTransform<Agent> agentAPI;
  ModelTransform<Agents> agentsAPI; 
  ModelTransform<Values> valuesAPI;
  ModelTransform<Value> valueAPI;
  ModelTransform<EpType> typeAPI;
  ModelTransform<Types> typesAPI;
  ModelTransform<Endpoint> endpointAPI;
  ModelTransform<Endpoints> endpointsAPI;
  
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
    valuesAPI = new ModelTransform<Values>(
        api.resource(RESOURCE_VALUES),
        (json) => new Values()..createFromMap(json),
        (error) => new Values()..setError(error)
        );
    valueAPI = new ModelTransform<Value>(
        api.resource(RESOURCE_VALUES),
        (json) => new Value()..createFromMap(json),
        (error) => new Value()..setError(error)
        );
    typeAPI = new ModelTransform<EpType>(
        api.resource(RESOURCE_TYPES),
        (json) => new EpType()..createFromMap(json),
        (error) => new EpType()..setError(error)
        );
    typesAPI = new ModelTransform<Types>(
        api.resource(RESOURCE_TYPES),
        (json) => new Types()..createFromMap(json),
        (error) => new Types()..setError(error)
        );
    endpointAPI = new ModelTransform<Endpoint>(
        api.resource(RESOURCE_ENDPOINTS),
        (json) => new Endpoint()..createFromMap(json),
        (error) => new Endpoint()..setError(error)
        );
    endpointsAPI = new ModelTransform<Endpoints>(
        api.resource(RESOURCE_ENDPOINTS),
        (json) => new Endpoints()..createFromMap(json),
        (error) => new Endpoints()..setError(error)
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
    _logger.warning("BLA");
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