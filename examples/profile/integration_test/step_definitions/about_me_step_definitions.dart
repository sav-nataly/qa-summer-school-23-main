import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/about_me_test_screen.dart';
import '../contextual_world.dart';

abstract class AboutMeStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, ContextualWorld>(
          RegExp(r'Я заполняю заметку о себе {string}$'),
          (info, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['info'] = info;
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
        then<ContextualWorld>(
          RegExp(r'Я вижу заполненное поле заметки о себе$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            expect(
                tester
                    .widget<TextField>(AboutMeTestScreen.aboutMeField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['info'] as String));
          },
        ),
      ];
}
