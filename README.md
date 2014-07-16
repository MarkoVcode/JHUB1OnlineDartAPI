# JHUB1OnlineRestfulAPI

JHUB1Online Restful API for Dart package - for connecting to restful web services.

## Usage
```
import "package:JHUB1OnlineRestfulAPI/jhub1_online.dart";
```
Instantiate the services `JHUB1OnlineServices`.
```
var jhub1online = new JHUB1OnlineServices();
```
### Public methods
 getAgentByID
 
```
jhub1online.getAgentByID((agent) => doStuffWithMyAgent(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");

void doStuffWithMyAgent(Agent agent) {
  if(agent.hasError()) {
    // error stuff
  } else {
    // good stuff
  }
}
```
 getAgents
 
``` 
jhub1online.getAgents((agents) => doStuffWithMyAgents(agents));

void doStuffWithMyAgents(Agents agents) {
  if(agents.hasError()) {
    // error stuff 
  } else {
    // good stuff
  }
}
 
```
