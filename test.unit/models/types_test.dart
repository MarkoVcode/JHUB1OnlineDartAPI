library types.unit.test;

import 'package:unittest/unittest.dart';
import 'package:jhub1onlineapi/src/models/types.dart';
import 'package:jhub1onlineapi/src/models/eptype.dart';

void testModelsParserOnTypes() {
  group("MapModelConverterOnTypes", () {
    test("should have mapped all the properties of Types object", () {
      Types types = new Types.fromJSON(typesJSON);
      expect(types.getTotal(), equals(4));
      expect(types.getTypes().length, equals(4));
      expect(types.hasError(), equals(false));
      expect(types.getLinks().length, equals(1));
      expect(types.getLinks().first.getHref(), equals("/types"));
      expect(types.getLinks().first.getRel(), equals("self"));
    });

    test("should have mapped all the properties of Type object testing type no 1", () {
      Types types = new Types.fromJSON(typesJSON);
      EpType type = types.getTypes().first;
      expect(type.getID(), equals("V-3N7IV-QQQQQ-257K82PG6.164"));
      expect(type.getCreatedTime(), equals(1391051079000));
      expect(type.getCreatedString(), equals("11 May 1976 22:12:45"));
      expect(type.getUpdatedTime(), equals(1391051079000));
      expect(type.getUpdatedString(), equals("11 May 1976 22:12:45"));
      expect(type.getName(), equals("Dasher"));
      expect(type.getIcon(), equals("agent00001"));
      expect(type.getColor(), equals("#3CB371"));
      expect(type.getOrder(), equals(10));
      expect(type.getClass(), equals("integer"));
      expect(type.getLongDescription(), equals("Integer endpoint 3 for user 1"));
      expect(type.getShortDescription(), equals("Integer endpoint 3 for user 1"));
      expect(type.getLinks().length, equals(1));
      expect(type.getLinks().first.getHref(), equals("/types/V-3N7IV-QQQQQ-257K82PG6.164"));
      expect(type.getLinks().first.getRel(), equals("/types"));
      //     "valueParamsDef":{?????
    });

  });
}

var typesJSON = """
{
    "total":4,
    "links": [{ "href":"/types",
              "rel":"self"}],
    "types":[
        {
            "id":"V-3N7IV-QQQQQ-257K82PG6.164",
            "created_t":1391051079000,
            "updated_t":1391051079000,
            "created_s":"11 May 1976 22:12:45",
            "updated_s":"11 May 1976 22:12:45",
            "name":"Dasher",
            "icon":"agent00001",
            "color":"#3CB371",
            "shortdescription":"Integer endpoint 3 for user 1",
            "longdescription":"Integer endpoint 3 for user 1",
            "sorder":10,
            "links": [{ "href":"/types/V-3N7IV-QQQQQ-257K82PG6.164",
                "rel":"/types"}],
            "class":"integer",
            "valueParamsDef":{
                "unit":null,
                "maxlimit":null,
                "minlimit":null,
                "maxvalue":null,
                "minvalue":null,
                "threshold":null,
                "tstatic":null,
                "step":null,
                "submit":null
            }
        },
        {
            "id":"V-QQQQQ-PFQLM-257K82PG6.164",
            "created_t":1391051079000,
            "updated_t":1391051079000,
            "created_s":"11 May 1976 22:12:45",
            "updated_s":"11 May 1976 22:12:45",
            "name":"Dasher",
            "icon":"agent00001",
            "color":"#3CB371",
            "shortdescription":"Integer endpoint 3 for user 1",
            "longdescription":"Integer endpoint 3 for user 1",
            "sorder":10,
            "links": [{ "href":"/types/V-QQQQQ-PFQLM-257K82PG6.164",
                "rel":"/types"}],
            "class":"integer",
            "valueParamsDef":{
                "unit":null,
                "maxlimit":null,
                "minlimit":null,
                "maxvalue":null,
                "minvalue":null,
                "threshold":null,
                "tstatic":null,
                "step":null,
                "submit":null
            }
        },
        {
            "id":"V-3N7IV-EEEEE-257K82PG6.164",
            "created_t":1391051079000,
            "updated_t":1391051079000,
            "created_s":"11 May 1976 22:12:45",
            "updated_s":"11 May 1976 22:12:45",
            "name":"Dasher",
            "icon":"agent00001",
            "color":"#3CB371",
            "shortdescription":"Integer endpoint 3 for user 1",
            "longdescription":"Integer endpoint 3 for user 1",
            "sorder":10,
            "links": [{ "href":"/types/V-3N7IV-EEEEE-257K82PG6.164",
                "rel":"/types"}],
            "class":"integer",
            "valueParamsDef":{
                "unit":null,
                "maxlimit":null,
                "minlimit":null,
                "maxvalue":null,
                "minvalue":null,
                "threshold":null,
                "tstatic":null,
                "step":null,
                "submit":null
            }
        },
        {
            "id":"V-3N7IV-XXXXX-257K82PG6.164",
            "created_t":1391051079000,
            "updated_t":1391051079000,
            "created_s":"11 May 1976 22:12:45",
            "updated_s":"11 May 1976 22:12:45",
            "name":"Dasher",
            "icon":"agent00001",
            "color":"#3CB371",
            "shortdescription":"Integer endpoint 3 for user 1",
            "longdescription":"Integer endpoint 3 for user 1",
            "sorder":10,
            "links": [{ "href":"/types/V-3N7IV-XXXXX-257K82PG6.164",
                "rel":"/types"}],
            "class":"integer",
            "valueParamsDef":{
                "unit":null,
                "maxlimit":null,
                "minlimit":null,
                "maxvalue":null,
                "minvalue":null,
                "threshold":null,
                "tstatic":null,
                "step":null,
                "submit":null
            }
        }
    ]

}
""";
