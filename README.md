# JHUB1OnlineRestfulAPI

JHUB1Online Restful API for Dart package - for connecting to restful web services.

## Usage
import "package:JHUB1OnlineRestfulAPI/jhub1_online.dart";



var jhub1online = new JHUB1OnlineServices();
 
 
 jhub1online.getAgentByID((agent) => doStuffWithMyAgent(agent), "A-1E6B9-5P8TQ-HJ9JKDL0Y.733");

 jhub1online.getAgents((agents) => doStuffWithMyAgents(agents));

 
 
