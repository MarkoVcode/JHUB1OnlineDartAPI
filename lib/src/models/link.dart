library link;

class Link {
  String href;
  String rel;
  
  Link.fromMap(Map map) {
    href = map["href"];
  }
  
  String getHref() {
    return href;
  }
  
  String getRel() {
    return rel;
  }
}