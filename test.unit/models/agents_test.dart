library agents.unit.test;

import 'package:unittest/unittest.dart';
import 'package:jhub1onlinerestfulapi/src/models/agents.dart';
import 'package:jhub1onlinerestfulapi/src/models/agent.dart';

void testModelsParser() {
  group("MapModelConverter", () {
    test("should have mapped all the properties of Agents object", () {
      Agents agents = new Agents.fromJSON(agentsJSON);
      expect(agents.getTotal(), equals(3));
      expect(agents.getAgents().length, equals(3));
      expect(agents.hasError(), equals(false));
      expect(agents.getLinks().length, equals(1));
      expect(agents.getLinks().first.getHref(), equals("/agents"));
    });
    
    test("should have mapped all the properties of Agent object testing agent no 3", () {
      Agents agents = new Agents.fromJSON(agentsJSON);
      Agent agent = agents.getAgents().last;
      expect(agent.getID(), equals("A-KQ50J-QR5DB-9U3ZF35B7.782"));
      expect(agent.getTimezone(), equals("Europe/London"));
      expect(agent.getCreatedTime() , equals(1391051030000));
      expect(agent.getCreatedString(), equals("11 May 1976 22:12:45"));
      expect(agent.getStatus(), equals("offline"));
      expect(agent.getName(), equals("Cupid"));
      expect(agent.getIcon(), equals("agent00001"));
      expect(agent.getColor(), equals("#2E8B57"));
      expect(agent.getDescription(), equals("We're off to never-never land"));
      expect(agent.getOrder(), equals(60));
      expect(agent.getUpdatedString(), equals("13 May 1976 22:12:45"));
      expect(agent.getUpdatedTime() , equals(1391551030099));
      expect(agent.getBuildDateString(), equals("13 May 1988 22:12:45"));
      expect(agent.getBuildDateTime(), equals(1391551030000));
      expect(agent.getBuildID(), equals("QQAAZZ"));
      //@TODO: consider the way of handling configs and attributes
//"localConfig": {"version":0},
//"remoteConfig": {"version":0},
  //    "attributes":{
  //      "att1":"val1",
  //      "att2":"val2"
   //   }
    });
    
  });
}





var agentsJSON = """
{
"total":3,
"links": [{ "href":"/agents",
            "rel":"self"}],
"agents":[
{
  "id":"A-1E6B9-5P8TQ-HJ9JKDL0Y.733",
  "username":"5ipcge8g9i",
  "timezone":"Europe/London",
  "created_t":1391051030000,
  "created_s":"11 May 1976 22:12:45",
  "status":"online",
  "updated_t":null,
  "updated_s":null,
  "name":"Dasher",
  "icon":"agent00001",
  "color":"#3CB371",
  "description":"Hush little baby, don't say a word",
  "sorder":10,
  "localConfig": {"version":0},
  "remoteConfig": {"version":0},
  "buildid": null,
  "builddate_t": null,
  "builddate_s": null,
  "links": [{ "href":"/agents/A-1E6B9-5P8TQ-HJ9JKDL0Y.733",
                "rel":"self"}],
  "attributes":{
    "att1":"val1",
    "att2":"val2"
  }
},
{
  "id":"A-YI7P2-OHJZM-IHWW2X9CZ.555",
  "username":"pbp9juwi2s",
  "timezone":"Europe/London",
  "created_t":1391051030000,
  "created_s":"11 May 1976 22:12:45",
  "status":"online",
  "updated_t":null,
  "updated_s":null,
  "name":"Comet",
  "icon":"agent00005",
  "color":"#F5DEB3",
  "description":"Take my hand",
  "sorder":50,
  "localConfig": {"version":0},
  "remoteConfig": {"version":0},
  "buildid": "qag54366",
  "builddate_t":1391051030000,
  "builddate_s":"11 May 1976 22:12:45",
  "links": [{ "href":"/agents/A-YI7P2-OHJZM-IHWW2X9CZ.555",
                "rel":"/agents"}],
  "attributes":{}
},
{
  "id":"A-KQ50J-QR5DB-9U3ZF35B7.782",
  "username":"ygmu8ygw5s",
  "timezone":"Europe/London",
  "created_t":1391051030000,
  "created_s":"11 May 1976 22:12:45",
  "status":"offline",
  "updated_t":1391551030099,
  "updated_s":"13 May 1976 22:12:45",
  "name":"Cupid",
  "icon":"agent00001",
  "color":"#2E8B57",
  "description":"We're off to never-never land",
  "sorder":60,
  "localConfig": {"version":0},
  "remoteConfig": {"version":0},
  "buildid": "QQAAZZ",
  "builddate_t": 1391551030000,
  "builddate_s": "13 May 1988 22:12:45",
  "links": [{ "href":"/agent/A-KQ50J-QR5DB-9U3ZF35B7.782",
                "rel":"/agent"}],
  "attributes":{
    "att1":"val1",
    "att2":"val2"
  }
}
]}
""";