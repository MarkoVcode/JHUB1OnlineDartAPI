library model.link;

class Link {
  String _href;
  String _rel;
  
  Link.fromMap(Map map) {
    _href = map["href"];
    _rel = map["rel"];
  }
  
  String getHref() {
    return _href;
  }
  
  String getRel() {
    return _rel;
  }
}