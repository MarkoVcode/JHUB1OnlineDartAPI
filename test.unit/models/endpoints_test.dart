library endpoints.unit.test;

import 'package:unittest/unittest.dart';
import 'package:jhub1onlineapi/src/models/endpoints.dart';
import 'package:jhub1onlineapi/src/models/endpoint.dart';

void testModelsParserOnEndpoints() {
  group("MapModelConverterOnEndpoints", () {
    test("should have mapped all the properties of Endpoints object", () {
      Endpoints endpoints = new Endpoints.fromJSON(endpointsJSON);
      expect(endpoints.getTotal(), equals(3));
      expect(endpoints.getEndpoints().length, equals(1));
      expect(endpoints.hasError(), equals(false));
      expect(endpoints.getLinks().length, equals(1));
      expect(endpoints.getLinks().first.getHref(), equals("/endpoints"));
      expect(endpoints.getLinks().first.getRel(), equals("self"));
    });
    
    test("should have mapped all the properties of Endpoint object testing endpoint no 1", () {
      Endpoints endpoints = new Endpoints.fromJSON(endpointsJSON);
      Endpoint endpoint = endpoints.getEndpoints().first;
      expect(endpoint.getID(), equals("V-3N7IV-PFQLM-RRRR82PG6.164"));
      expect(endpoint.getName(), equals("Dasher"));
      expect(endpoint.getIcon(), equals("agent00001"));
      expect(endpoint.getColor(), equals("#3CB371"));
      expect(endpoint.getOrder(), equals(10));
 //     expect(endpoint.getAddress(), equals("5ipcge8g9i/testValuejkhj"));
 //     expect(endpoint.getAgent() , equals("5ipcge8g9i"));
 //     expect(endpoint.getValue(), equals("true"));
      expect(endpoint.getLinks().length, equals(3));
      expect(endpoint.getLinks().first.getHref(), equals("/values/5ipcge8g9i/testValue22222"));
      expect(endpoint.getLinks().first.getRel(), equals("/values"));
    });
    
  });
}

var endpointsJSON = """
{
    "total":1,
    "links": [{ "href":"/endpoints",
                "rel":"self"}],
    "endpoints":{
        "id":"V-3N7IV-PFQLM-RRRR82PG6.164",
        "name":"Dasher",
        "icon":"agent00001",
        "color":"#3CB371",
        "description":"Hush little baby, don't say a word",
        "sorder":10,
        "accesstype":"????",
        "sharepolicy":"private",
        "geolocalization":null,
        "configValues":{
        },
        "links": [{ "href":"/values/5ipcge8g9i/testValue22222",
                "rel":"/values"},
                { "href":"/types/V-3N7IV-QQQQQ-257K82PG6.164",
                "rel":"/types"},
                { "href":"/endpoints/V-3N7IV-PFQLM-RRRR82PG6.164",
                "rel":"/endpoints"}],
        "valueaddress":"5ipcge8g9i/testValue22222",
        "typeid":"V-3N7IV-QQQQQ-257K82PG6.164"
    }
}
""";