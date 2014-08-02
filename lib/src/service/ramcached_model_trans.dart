library ram_cached_decorator;
import "package:restfulplus/restfulplus.dart";
import 'dart:async';

typedef Object ModelFactory(Object response);
typedef Object ErrorHandler(Object response);

class RamCachedModelTransform<M> {
  RamCachedResource _resource;
  ModelFactory _modelFactory;
  ErrorHandler _errorHandler;

  RamCachedModelTransform(this._resource, this._modelFactory);

  Future<M> find(String id, [bool invalidate = false]) {
    return _resource.find(id, invalidate).then(_transform);
  }

  Future<M> findAll([bool invalidate = false]) {
    return _resource.findAll(invalidate).then(_transform);
  }

  Future<M> query(Map<String, Object> params, [bool invalidate = false]) {
    return _resource.query(params, invalidate).then(_transform);
  }
  
  M _transform(Object json) => _modelFactory(json);
}