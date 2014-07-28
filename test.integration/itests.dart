library integration.tests;
import 'package:unittest/html_enhanced_config.dart';
import 'actions/agents_test.dart';
/**
 *  Not all of these tests will always pass.  
 */
void main() {
  useHtmlEnhancedConfiguration();
  testModelsParserOnAgents();
}