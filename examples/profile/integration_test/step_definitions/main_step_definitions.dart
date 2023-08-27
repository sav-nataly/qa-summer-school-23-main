import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/main_test_screen.dart';

abstract class MainStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я перехожу к редактированию профиля$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.tap(MainTestScreen.editProfileBtn);
          },
        ),
      ];
}
