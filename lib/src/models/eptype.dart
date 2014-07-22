library model.type;
import 'response.dart';

class EpType extends Response {
  
  String _id;
  int _created_t;
  String _created_s;
  int _updated_t;
  String _updated_s;
  String _name;
  String _icon;
  String _color;
  int _sorder;
  String _shortdescription;
  String _longdescription;
  Map _valueParamsDef;
  String _clazz;
  
  EpType() {
    
  }
  
  EpType.fromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }
  
  void createFromMap(Map parsedMap) {
    getFromMap(parsedMap);
  }

  void getFromMap(Map parsedMap) {
    _id = parsedMap["id"];
    _created_t = parsedMap["created_t"];
    _created_s = parsedMap["created_s"];
    _updated_t = parsedMap["updated_t"];
    _updated_s = parsedMap["updated_s"]; 
    _name = parsedMap["name"];
    _icon = parsedMap["icon"];
    _color = parsedMap["color"];
    _sorder = parsedMap["_sorder"];
    _shortdescription = parsedMap["shortdescription"];
    _longdescription = parsedMap["longdescription"];
    _clazz = parsedMap["class"];
    _valueParamsDef = parsedMap["valueParamsDef"];
  }
  
  String getID() {
    return _id;
  }
  
  String getCreatedString() {
    return _created_s;
  }

  int getCreatedTime() {
    return _created_t;
  }

  String getUpdatedString() {
    return _created_s;
  }

  int getUpdatedTime() {
    return _created_t;
  }
  
  String getName() {
    return _name;
  }
  
  String getIcon() {
    return _icon;
  }
  
  String getColor() {
    return _color;
  }
  
  int getOrder() {
    return _sorder;
  }
  
  String getShortDescription() {
    return _shortdescription;
  }

  String getLongDescription() {
    return _longdescription;
  }

  Map getValueParams() {
    return _valueParamsDef;
  }

  String getClass() {
    return _clazz;
  }
  
}