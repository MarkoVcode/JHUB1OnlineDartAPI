library wr;
import "package:restful/restful.dart";
import 'dart:async';

typedef Object ModelFactory(Object response);
typedef Object ErrorHandler(RequestFault response);

class ModelTransform<M> implements Resource {
  Resource _resource;
  ModelFactory _modelFactory;
  ErrorHandler _errorHandler;

  ModelTransform(this._resource, this._modelFactory, this._errorHandler);

  Future<M> find(id) {
    return _resource.find(id).then(_transform).catchError(_error);
  }

  Future<M> findAll() {
    return _resource.findAll().then(_transform).catchError(_error);
  }
  
  M _transform(Object json) => _modelFactory(json);
  M _error(RequestFault error) => _errorHandler(error);
}