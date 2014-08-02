library interface_configuration;

class ServicesConfig {
  String protocol = "http";
  int port = 8081;
  String host = "127.0.0.1";
  String apiVersion = "mock0";
  int cacheAutoInvalidate = 9999999999;

  String getURI() {
    var buffer = new StringBuffer();
    buffer.write(protocol);
    buffer.write("://");
    buffer.write(host);
    buffer.write(":");
    buffer.write(port);
    buffer.write("/");
    buffer.write(apiVersion);
    return buffer.toString();
  }
  
  int getCacheInvalidateTimeout() {
    return cacheAutoInvalidate;
  }
}
