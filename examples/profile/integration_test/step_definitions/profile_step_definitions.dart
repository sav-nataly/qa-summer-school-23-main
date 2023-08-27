import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/general_test_screen.dart';
import '../../test_screen/screens/profile_test_screen.dart';
import '../contextual_world.dart';

abstract class ProfileStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю фамилию {string}$'),
          (surname, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['surname'] = surname;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.surnameField, surname);
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю имя {string}$'),
          (firstName, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['firstName'] = firstName;
            await tester.enterText(ProfileTestScreen.firstNameField, firstName);
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю отчество {string}$'),
          (secondName, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['secondName'] = secondName;
            await tester.enterText(
                ProfileTestScreen.secondNameField, secondName);
          },
        ),
        when1<String, ContextualWorld>(
          RegExp(r'Я указываю дату рождения {string}$'),
          (birthday, context) async {
            final tester = context.world.rawAppDriver;
            context.world.scenarioContext['birthday'] = birthday;
            tester
                .widget<TextField>(ProfileTestScreen.birthdayField)
                .controller
                ?.text = birthday;
          },
        ),
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я перехожу далее$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.tap(GeneralTestScreen.nextButton);
          },
        ),
        when<ContextualWorld>(
          RegExp(r'Я вижу заполненные данные ФИО$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            expect(
                tester
                    .widget<TextField>(ProfileTestScreen.surnameField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['surname'] as String));
            expect(
                tester
                    .widget<TextField>(ProfileTestScreen.firstNameField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['firstName'] as String));
            expect(
                tester
                    .widget<TextField>(ProfileTestScreen.secondNameField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['secondName'] as String));
          },
        ),
        when<ContextualWorld>(
          RegExp(r'Я вижу заполненное поле даты рождения$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            expect(
                tester
                    .widget<TextField>(ProfileTestScreen.birthdayField)
                    .controller!
                    .text,
                equals(context.world.scenarioContext['birthday'] as String));
          },
        ),
      ];
}
