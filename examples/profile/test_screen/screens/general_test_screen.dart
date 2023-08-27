import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/widgets/next_button.dart';


abstract class GeneralTestScreen {
  static Finder nextButton = find.byType(NextButton);

  /// text field
  static Finder textField(String hint) => find.byWidgetPredicate((widget) {
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });

  static Finder text = find.text("Photo");

  static Finder listItem(String text) => find.byWidgetPredicate((widget) {
        return widget is Row && widget.children.any((element) => element is Text && element.data == "Photo");
        // return widget is Text && widget.data == text;
      });
}
