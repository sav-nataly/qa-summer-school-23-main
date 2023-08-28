import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/interests_test_screen.dart';
import '../contextual_world.dart';

abstract class InterestsStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, ContextualWorld>(
          RegExp(r'Я выбираю из интересов {string}$'),
          (interest, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();

            final texts =
                tester.widgetList<Text>(InterestsTestScreen.textsList);
            final tapText =
                texts.where((element) => element.data == interest).first;
            final index = texts.toList().indexOf(tapText);
            context.world.scenarioContext['interestIndex'] = index;

            final finder = find.byWidget(tapText);

            await tester.tap(finder);
          },
        ),
        when<ContextualWorld>(
          RegExp(r'Я вижу выбранные интересы$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();

            final textIndex =
                context.world.scenarioContext['interestIndex'] as int;
            final chbList =
                tester.widgetList<Checkbox>(InterestsTestScreen.chBox);

            expect(chbList.elementAt(textIndex).value, equals(true));
          },
        ),
      ];
}
