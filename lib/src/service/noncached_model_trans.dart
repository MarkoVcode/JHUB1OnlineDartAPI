library non_cached_decorator;
import "package:restfulplus/restfulplus.dart";
import 'dart:async';

typedef Object ModelFactory(Object response);
typedef Object ErrorHandler(Object response);

class NonCachedModelTransform<M> {
  NonCachedResource _resource;
  ModelFactory _modelFactory;
  ErrorHandler _errorHandler;

  NonCachedModelTransform(this._resource, this._modelFactory);

  Future<M> find(id) {
    return _resource.find(id).then(_transform);
  }

  Future<M> findAll() {
    return _resource.findAll().then(_transform);
  }

  Future<M> query(Map<String, Object> params) {
    return _resource.query(params).then(_transform);
  }
  
  Future<M> delete(id) {
    return _resource.delete(id).then(_transform);
  }
  
  M _transform(Object json) => _modelFactory(json);
}