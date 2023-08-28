import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/city_test_screen.dart';
import '../contextual_world.dart';

abstract class CityStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, ContextualWorld>(
          RegExp(r'Я выбираю город {string}$'),
          (city, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['city'] = city;
            await tester.pumpAndSettle();
            tester
                .widget<TextField>(CityTestScreen.cityField)
                .controller
                ?.text = city;
          },
        ),
        when<ContextualWorld>(
          RegExp(r'Я вижу заполненное поле города$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            expect(
                tester
                    .widget<TextField>(CityTestScreen.cityField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['city'] as String));
          },
        ),
      ];
}
