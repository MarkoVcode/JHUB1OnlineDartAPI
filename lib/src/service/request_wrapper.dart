library wr;
import "package:restful/restful.dart";
import 'dart:async';

typedef Object ModelFactory(Object response);
typedef Object ErrorHandler(Object response);

class ModelTransform<M> {
  Resource _resource;
  ModelFactory _modelFactory;
  ErrorHandler _errorHandler;

  ModelTransform(this._resource, this._modelFactory, this._errorHandler);

  Future<M> find(id) {
    return _resource.find(id).then(_transform).catchError(_errorh);
  }

  Future<M> findAll() {
    return _resource.findAll().then(_transform).catchError(_errorh);
  }

  Future<M> delete(id) {
    return _resource.delete(id).then(_transform).catchError(_errorh);
  }
  
  M _transform(Object json) => _modelFactory(json);
  M _errorh(Object requestFault) => _errorHandler(requestFault);
}