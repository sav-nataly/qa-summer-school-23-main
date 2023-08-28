import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

abstract class GeneralTestScreen {
  /// Кнопка далее
  static Finder nextButton = find.byType(NextButton);

  /// Поиск текстового поля по подсказке
  static Finder textField(String hint) => find.byWidgetPredicate((widget) {
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });
}
