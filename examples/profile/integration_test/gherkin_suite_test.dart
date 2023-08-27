import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:profile/runner.dart' as app;
import 'package:surf_logger/surf_logger.dart';
import 'contextual_world.dart';
import 'step_definitions/about_me_step_definitions.dart';
import 'step_definitions/city_step_definitions.dart';
import 'step_definitions/interests_step_definitions.dart';
import 'step_definitions/main_step_definitions.dart';
import 'step_definitions/profile_step_definitions.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
      configuration: FlutterTestConfiguration(
        order: ExecutionOrder.alphabetical,
        reporters: [
          StdoutReporter(MessageLevel.error)
            ..setWriteLineFn(Logger.d)
            ..setWriteFn(Logger.d),
          ProgressReporter()
            ..setWriteLineFn(Logger.d)
            ..setWriteFn(Logger.d),
          TestRunSummaryReporter()
            ..setWriteLineFn(Logger.d)
            ..setWriteFn(Logger.d),
          JsonReporter(writeReport: (_, __) => Future<void>.value()),
        ],
        stepDefinitions: [
          ...MainStepDefinitions.steps,
          ...ProfileStepDefinitions.steps,
          ...CityStepDefinitions.steps,
          ...InterestsStepDefinitions.steps,
          ...AboutMeStepDefinitions.steps,
        ],
          createWorld: (TestConfiguration config) async => await createMyWorldInstance(config),
      ),
      appMainFunction: (world) => app.run());
}

Future<ContextualWorld> createMyWorldInstance(TestConfiguration config) {
  return Future<ContextualWorld>.value(ContextualWorld());
}
