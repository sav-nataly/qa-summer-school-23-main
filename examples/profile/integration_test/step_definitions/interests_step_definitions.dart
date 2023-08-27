import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/general_test_screen.dart';
import '../../test_screen/screens/interests_test_screen.dart';

abstract class InterestsStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я выбираю из интересов {string}$'),
          (city, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();

            // await tester.tap(InterestsTestScreen.photoListItem);
            await tester.tap(InterestsTestScreen.artListItem);

            final l = tester.widget<ListView>(InterestsTestScreen.list).chi;
            final row = tester.widget<Row>(GeneralTestScreen.listItem("photo"));
            final chBox = row.children.firstWhere((element) => element is StateNotifierBuilder) as StateNotifierBuilder;
            final chb = chBox.builder;

            expect(chBox.builder as Checkbox, equals(true));

            // final ch = tester.widget<Row>(GeneralTestScreen.list);
            final y = 1;
            // expect(tester.widget<Row>(GeneralTestScreen.list).value
            //     , equals(true));
          },
        ),
      ];
}
