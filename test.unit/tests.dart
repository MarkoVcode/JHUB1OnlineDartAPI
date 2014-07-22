library unit.tests;

import 'package:unittest/html_enhanced_config.dart';
import 'models/types_test.dart';
import 'models/agents_test.dart';
import 'models/values_test.dart';
import 'models/endpoints_test.dart';

/**
 *  All of the tests MUST always pass  
 */
void main() {
  useHtmlEnhancedConfiguration();

  testModelsParserOnAgents();
  testModelsParserOnValues();
  testModelsParserOnEndpoints();
  testModelsParserOnTypes();
}
