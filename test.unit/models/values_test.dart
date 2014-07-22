library values.unit.test;

import 'package:unittest/unittest.dart';
import 'package:jhub1onlineapi/src/models/values.dart';
import 'package:jhub1onlineapi/src/models/value.dart';

void testModelsParserOnValues() {
  group("MapModelConverterOnValues", () {
    test("should have mapped all the properties of Values object", () {
      Values values = new Values.fromJSON(valuesJSON);
      expect(values.getTotal(), equals(3));
      expect(values.getValues().length, equals(3));
      expect(values.hasError(), equals(false));
      expect(values.getLinks().length, equals(1));
      expect(values.getLinks().first.getHref(), equals("/values/5ipcge8g9i"));
      expect(values.getLinks().first.getRel(), equals("self"));
    });

    test("should have mapped all the properties of Value object testing value no 3", () {
      Values values = new Values.fromJSON(valuesJSON);
      Value value = values.getValues().last;
      expect(value.getID(), equals("V-3N7IV-PFQLM-257K82PG6.164"));
      expect(value.getTimezone(), equals("Europe/London"));
      expect(value.getCreatedTime(), equals(1391051030000));
      expect(value.getCreatedString(), equals("11 May 1976 22:12:45"));
      expect(value.getName(), equals("testValuejkhj"));
      expect(value.getAddress(), equals("5ipcge8g9i/testValuejkhj"));
      expect(value.getAgent(), equals("5ipcge8g9i"));
      expect(value.getValue(), equals("true"));
      expect(value.getLinks().length, equals(2));
      expect(value.getLinks().first.getHref(), equals("/agents/A-1E6B9-5P8TQ-HJ9JKDL0Y.733"));
      expect(value.getLinks().first.getRel(), equals("/agents"));
    });

  });
}

var valuesJSON = """
{
    "total":3,
    "links": [{ "href":"/values/5ipcge8g9i",
            "rel":"self"}], 
    "values":[
        {
            "id":"V-3N7IV-PFQLM-257K82PG6.164T",
            "name":"testValue22222T",
            "address":"5ipcge8g9i/testValue22222T",
            "links": [{ "href":"/agents/A-1E6B9-5P8TQ-HJ9JKDL0Y.733T",
                  "rel":"/agentsT"},
                 { "href":"/values/5ipcge8g9i/testValue22222T",
                  "rel":"/valuesT"}
                  ],
            "agent":"5ipcge8g9iT",
            "timezone":"Europe/LondonT",
      "created_t":13910510300004,
      "created_s":"11 May 1976 22:12:45T",
            "value":"44T"
        },
        {
            "id":"V-3N7IV-PFQLM-257K82PG6.164E",
            "name":"testValuesdsaE",
            "address":"5ipcge8g9i/testValuesdsaE",
            "links": [{ "href":"/agents/A-1E6B9-5P8TQ-HJ9JKDL0Y.733E",
                  "rel":"/agentsE"},
                 { "href":"/values/5ipcge8g9i/testValuesdsaE",
                  "rel":"/valuesE"}
                  ],
            "agent":"5ipcge8g9iE",
            "timezone":"Europe/LondonE",
      "created_t":13910510300009,
      "created_s":"11 May 1976 22:12:45E",
            "value":"45E"
        },
        {
            "id":"V-3N7IV-PFQLM-257K82PG6.164",
            "name":"testValuejkhj",
            "address":"5ipcge8g9i/testValuejkhj",
            "links": [{ "href":"/agents/A-1E6B9-5P8TQ-HJ9JKDL0Y.733",
                  "rel":"/agents"},
                 { "href":"/values/5ipcge8g9i/testValuejkhj",
                  "rel":"/values"}
                  ],
            "agent":"5ipcge8g9i",
            "timezone":"Europe/London",
      "created_t":1391051030000,
      "created_s":"11 May 1976 22:12:45",
            "value":"true"
        }
    ]
}
""";
