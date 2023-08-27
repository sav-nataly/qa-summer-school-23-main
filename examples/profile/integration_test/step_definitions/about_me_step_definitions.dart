import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/about_me_test_screen.dart';

abstract class AboutMeStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я заполняю заметку о себе {string}$'),
          (info, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(AboutMeTestScreen.aboutMeField, info);
          },
        ),
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я сохраняю данные профиля$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.tap(AboutMeTestScreen.saveBtn);
          },
        ),
      ];
}
