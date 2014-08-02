library model.abstractResponse;
import "package:restfulplus/restfulplus.dart";

abstract class Response {

  bool _isError = false;
  RestRequest _restRequest;

  bool hasError() {
    return _isError;
  }

  /**
    * Allows access to all custom data attributes (data-*) set on this element.
    *
    * The keys for the map must follow these rules:
    *
    * * The name must not begin with 'xml'.
    * * The name cannot contain a semi-colon (';').
    * * The name cannot contain any capital letters.
    *
    * Any keys from markup will be converted to camel-cased keys in the map.
    *
    * For example, HTML specified as:
    *
    *     <div data-my-random-value='value'></div>
    *
    * Would be accessed in Dart as:
    *
    *     var value = element.dataset['myRandomValue'];
    *
    * See also:
    *
    * * [Custom data attributes](http://www.w3.org/TR/html5/global-attributes.html#custom-data-attribute)
    */
  RestRequest getRestRequest() {
    return _restRequest;
  }

  /**
    * Scrolls this element into view.
    *
    * Only one of of the alignment options may be specified at a time.
    *
    * If no options are specified then this will attempt to scroll the minimum
    * amount needed to bring the element into view.
    *
    * Note that alignCenter is currently only supported on WebKit platforms. If
    * alignCenter is specified but not supported then this will fall back to
    * alignTop.
    *
    * See also:
    *
    * * [scrollIntoView](http://docs.webplatform.org/wiki/dom/methods/scrollIntoView)
    * * [scrollIntoViewIfNeeded](http://docs.webplatform.org/wiki/dom/methods/scrollIntoViewIfNeeded)
    */
  void createFromMap(Map parsedMap);
  
  /**
   * This method is valid only for simplest case (most of the time GET) for asynchronous http
   * operations it will have to handle also other status codes than 200
   * It should be implemented on concrete. 
   */
  void createFromRestRequest(RestRequest rr) {
    _restRequest = rr;
    if(rr.request.status == 200) {
      createFromMap(rr.getData());
    } else {
      _isError = true;
    }
  }
}
