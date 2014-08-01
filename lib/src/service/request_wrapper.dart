library wr;
import "package:restful/restful.dart";
import 'dart:async';

typedef Object ModelFactory(Object response);
typedef Object ErrorHandler(Object response);

class ModelTransform<M> {
  RamCachedResource _resource;
  ModelFactory _modelFactory;
  ErrorHandler _errorHandler;

  ModelTransform(this._resource, this._modelFactory);

  Future<M> find(id) {
    return _resource.find(id).then(_transform);
  }

  Future<M> findAll() {
    return _resource.findAll().then(_transform);
  }

  Future<M> delete(id) {
    return _resource.delete(id).then(_transform);
  }
  
  M _transform(Object json) => _modelFactory(json);
}