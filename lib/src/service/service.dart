import 'properties.dart';

abstract class Service {
  String buildURI() {
    var buffer = new StringBuffer();
    buffer.write(Properties.PROTOCOL);
    buffer.write("://");
    buffer.write(Properties.HOSTNAME);
    buffer.write(":");
    buffer.write(Properties.PORT);
    buffer.write("/");
    buffer.write(Properties.VERSION);
    buffer.write("/");
    return buffer.toString();
  }
}
