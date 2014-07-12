library abstractResponse;
import "package:restful/restful.dart";

abstract class Response {
  
   bool isError = false;
   RequestFault requestFault;
   
   bool hasError() {
     return isError;
   }
   
   void setError(RequestFault requestFault) {
     isError = true;
     this.requestFault = requestFault;
   }
   
   RequestFault getError() {
     return requestFault;
   }
   
   void createFromMap(Map parsedMap);
}